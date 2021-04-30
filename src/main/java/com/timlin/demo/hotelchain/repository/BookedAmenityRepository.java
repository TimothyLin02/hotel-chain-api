package com.timlin.demo.hotelchain.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.timlin.demo.hotelchain.entity.BookedAmenity;
import com.timlin.demo.hotelchain.entity.BookedAmenityId;
import com.timlin.demo.hotelchain.entity.BookedRoomId;

@Repository
public class BookedAmenityRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    private RowMapper<BookedAmenity> mapper = new RowMapper<BookedAmenity>(){  
        @Override  
        public BookedAmenity mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	BookedAmenityId id = new BookedAmenityId();  
        	BookedAmenity e = new BookedAmenity();
        	e.setAmenityId(id);
            id.setBookingId(rs.getInt("booking_id"));  
            id.setHotelId(rs.getInt("hotel_id"));  
            id.setRoomNumber(rs.getString("room_number"));  
            id.setState(rs.getString("state"));  
            id.setAmenityId(rs.getInt("amenity_id"));  
            e.setAmenity(rs.getString("amenity"));  
            return e;  
        }  
    };

	public void create(List<BookedAmenity> bookedAmenities) {
        jdbcTemplate.batchUpdate(
        	"insert into booked_amenity(booking_id, hotel_id, state, room_number, amenity_id, amenity) values (?,?,?,?,?,?)",
            new BatchPreparedStatementSetter() {
        		public void setValues(PreparedStatement ps, int i) 
                        throws SQLException 
        		{
        			BookedAmenity br = bookedAmenities.get(i);
        			ps.setInt(1, br.getAmenityId().getBookingId());
        			ps.setInt(2, br.getAmenityId().getHotelId());
        			ps.setString(3, br.getAmenityId().getState());
        			ps.setString(4, br.getAmenityId().getRoomNumber());
        			ps.setInt(5, br.getAmenityId().getAmenityId());
        			ps.setString(6, br.getAmenity());
        		}
        		public int getBatchSize() {
        			return bookedAmenities.size();
                }
        	});
	}

	public List<BookedAmenity> findByRoomId(BookedRoomId roomId) {
		return jdbcTemplate.query(
	        	"select * from booked_amenity where booking_id=? and state=? and hotel_id=? and room_number=?",
	        	new Object[] { roomId.getBookingId(), roomId.getState(), roomId.getHotelId(), roomId.getRoomNumber()},
	            new int[] { Types.INTEGER, Types.VARCHAR, Types.INTEGER, Types.VARCHAR },
	            mapper);
	}
    
}