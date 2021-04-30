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

import com.timlin.demo.hotelchain.entity.BookedRoom;
import com.timlin.demo.hotelchain.entity.BookedRoomId;

@Repository
public class BookedRoomRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
	@Autowired
	private BookedAmenityRepository bookedAmenityRepository;

    private RowMapper<BookedRoom> mapper = new RowMapper<BookedRoom>(){  
        @Override  
        public BookedRoom mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	BookedRoomId id = new BookedRoomId();  
        	BookedRoom e = new BookedRoom();  
            e.setRoomId(id);
            id.setBookingId(rs.getInt("booking_id"));  
            id.setHotelId(rs.getInt("hotel_id"));  
            id.setRoomNumber(rs.getString("room_number"));  
            id.setState(rs.getString("state"));  
            e.setCapacity(rs.getInt("capacity"));  
            e.setOccupancy(rs.getInt("occupancy"));  
            e.setPrice(rs.getDouble("price"));  
            e.setExtendable(rs.getBoolean("extendable"));  
            e.setView(rs.getString("view"));  
            return e;  
        }  
    };

	public void create(List<BookedRoom> bookedRooms) {
        jdbcTemplate.batchUpdate(
                "insert into booked_room(booking_id, hotel_id, state, room_number, capacity, extendable, occupancy, price, view) values (?,?,?,?,?,?,?,?,?)",
                new BatchPreparedStatementSetter() {
                    public void setValues(PreparedStatement ps, int i) 
                        throws SQLException 
                    {
                    	BookedRoom br = bookedRooms.get(i);
                        ps.setInt(1, br.getRoomId().getBookingId());
                        ps.setInt(2, br.getRoomId().getHotelId());
                        ps.setString(3, br.getRoomId().getState());
                        ps.setString(4, br.getRoomId().getRoomNumber());
                        ps.setInt(5, br.getCapacity());
                        ps.setBoolean(6, br.getExtendable());
                        ps.setInt(7, br.getOccupancy());
                        ps.setDouble(8, br.getPrice());
                        ps.setString(9, br.getView());
                    }
                    public int getBatchSize() {
                        return bookedRooms.size();
                    }
                });
	}

	public List<BookedRoom> findByBooking(Integer bookingId, String state) {
		List<BookedRoom> rooms = jdbcTemplate.query(
        	"select * from booked_room where booking_id=? and state=?",
        	new Object[] { bookingId, state },
            new int[] { Types.INTEGER, Types.VARCHAR },
            mapper);
		for (BookedRoom room : rooms) {
			room.setAmenities(
				bookedAmenityRepository.findByRoomId(room.getRoomId())
			);
		}
		return rooms;
	}

}