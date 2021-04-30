package com.timlin.demo.hotelchain.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.timlin.demo.hotelchain.entity.Amenity;

@Repository
public class AmenityRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private RowMapper<Amenity> mapper = new RowMapper<Amenity>(){  
        @Override  
        public Amenity mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	Amenity e = new Amenity();  
            e.setAmenityId(rs.getInt("amenity_id"));  
            e.setAmenity(rs.getString("amenity"));  
            return e;  
        }  
    };

	public List<Amenity> findAllById(List<Integer> aids) {
		if (aids == null || aids.isEmpty()) {
			return Collections.EMPTY_LIST;
		}
		String sql = String.format(
			"select * from amenity where amenity_id IN (%s)",
			String.join(",", Collections.nCopies(aids.size(), "?")));

		int[] types = new int[aids.size()];
		Arrays.fill(types, Types.INTEGER);
		
		return jdbcTemplate.query(
        		sql,
        		aids.toArray(),
        		types,
                mapper);
	}

	public List<Amenity> findAllByHotelId(Integer hotelId) {
		List<Integer> amenityIds= jdbcTemplate.query(
                "select * from hotel_amenity where hotel_id  = ?",
                new Object[]{hotelId},
                new int[] {Types.INTEGER},
                new RowMapper<Integer>(){  
                    @Override  
                    public Integer mapRow(ResultSet rs, int rownumber) throws SQLException {  
                        return rs.getInt("amenity_id"); 
                    }  
                });
		
		return findAllById(amenityIds);
	}
	
	public Amenity save(Amenity amenity) {
        return null;
	}  
    
	public Amenity create(Amenity amenity) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
	    jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(
               	"insert into amenity (amenity) values (?)",
               	new String[] { "amenity_id" }
            );
           	ps.setString(1, amenity.getAmenity());
	        return ps;
	    }, keyHolder);

	    amenity.setAmenityId(keyHolder.getKey().intValue());
	    return amenity;
	}

	public List<Amenity> findAll() {
        return jdbcTemplate.query("SELECT * FROM amenity", mapper);
	}  
}