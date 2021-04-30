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

import com.timlin.demo.hotelchain.entity.Hotel;

@Repository
public class HotelRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<Hotel> mapper = new RowMapper<Hotel>(){  
        @Override  
        public Hotel mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	Hotel e = new Hotel();  
            e.setHotelId(rs.getInt("hotel_id"));  
            e.setAddress(rs.getString("address"));  
            e.setBrandId(rs.getInt("brand_id"));
            e.setEmail(rs.getString("email"));
            e.setPhoneNumber(rs.getString("phone_number"));
            e.setStars(rs.getDouble("stars"));
            e.setTotalNumberOfRooms(rs.getInt("total_number_of_rooms"));
            return e;  
        }  
    };  
    
	public List<Hotel> findAllByBrandId(Integer brandId) {
        return jdbcTemplate.query(
        		"select * from hotel where brand_id=? order by hotel_id",
        		new Object[] { brandId },
                new int[] { Types.INTEGER },
                mapper);
	}

	public Hotel save(Hotel hotel) {
        return null;
	}
	
	public Hotel create(Hotel hotel) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
	    jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(
        		"insert into hotel (address, email, brand_id, phone_number, stars, total_number_of_rooms) values (?, ?, ?, ?, ?, ?)",
               	new String[] { "hotel_id" }
            );
    		ps.setString(1, hotel.getAddress());
    		ps.setString(2, hotel.getEmail());
    		ps.setInt(3, hotel.getBrandId());
    		ps.setString(4, hotel.getPhoneNumber());
    		ps.setDouble(5, hotel.getStars());
    		ps.setInt(6, hotel.getTotalNumberOfRooms());
	        return ps;
	    }, keyHolder);

	    hotel.setHotelId(keyHolder.getKey().intValue());
	    return hotel;
	}

	public Hotel findById(Integer id) {
		List<Hotel> lst = jdbcTemplate.query(
                "select * from hotel where hotel_id = ?",
                new Object[]{id},
                new int[] {Types.INTEGER},
                mapper);
		if (lst == null || lst.isEmpty()) {
			return null;
		}
		return lst.get(0);
	}

	public void updateRoomCount(Integer hotelId) {
        jdbcTemplate.update(
        	"update hotel set total_number_of_rooms = (select count(*) from room where hotel_id = ?) where hotel_id = ?",
        	hotelId, hotelId);
	}
}
