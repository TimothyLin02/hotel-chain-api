package com.timlin.demo.hotelchain.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.timlin.demo.hotelchain.entity.HotelBrand;

@Repository
public class HotelBrandRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private RowMapper<HotelBrand> mapper = new RowMapper<HotelBrand>(){  
        @Override  
        public HotelBrand mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	HotelBrand e = new HotelBrand();  
            e.setBrandId(rs.getInt("brand_id"));  
            e.setHotelName(rs.getString("hotel_name"));
            e.setNumberOfHotels(rs.getInt("number_of_hotels"));
            return e;  
        }  
    };  

	public List<HotelBrand> findAll() {
        return jdbcTemplate.query("SELECT * FROM hotel_brand", mapper);
	}

	public HotelBrand save(HotelBrand hotelBrand) {
        return null;
	}

	public HotelBrand create(HotelBrand hotelBrand) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
	    jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(
                "insert into hotel_brand (hotel_name, number_of_hotels) values(?,?)",
               	new String[] { "brand_id" }
            );
           	ps.setString(1, hotelBrand.getHotelName());
           	ps.setInt(2, hotelBrand.getNumberOfHotels());
	        return ps;
	    }, keyHolder);

	    hotelBrand.setBrandId(keyHolder.getKey().intValue());
	    return hotelBrand;
	}

	public HotelBrand findById(Integer id) {
		List<HotelBrand> lst = jdbcTemplate.query(
                "select * from hotel_brand where brand_id = ?",
                new Object[]{id},
                new int[] {Types.INTEGER},
                mapper);
		if (lst == null || lst.isEmpty()) {
			return null;
		}
		return lst.get(0);
	}
}