package com.timlin.demo.hotelchain.repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.timlin.demo.hotelchain.entity.Amenity;
import com.timlin.demo.hotelchain.entity.RoomId;

@Repository
public class RoomAmenitiesRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
	public void saveAll(RoomId roomId, List<Amenity> amenities) {
        jdbcTemplate.batchUpdate(
           	"insert into room_amenity(hotel_id, room_number, amenity_id) values (?,?,?)",
                new BatchPreparedStatementSetter() {
            		public void setValues(PreparedStatement ps, int i) 
                            throws SQLException 
            		{
            			ps.setInt(1, roomId.getHotelId());
            			ps.setString(2, roomId.getRoomNumber());
            			ps.setInt(3, amenities.get(i).getAmenityId());
            		}
            		public int getBatchSize() {
            			return amenities.size();
                    }
            	});
	}
    
}