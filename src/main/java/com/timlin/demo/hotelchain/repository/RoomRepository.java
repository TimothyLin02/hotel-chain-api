package com.timlin.demo.hotelchain.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.timlin.demo.hotelchain.entity.Amenity;
import com.timlin.demo.hotelchain.entity.Room;
import com.timlin.demo.hotelchain.entity.RoomAmenities;
import com.timlin.demo.hotelchain.entity.RoomId;

@Repository
public class RoomRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    private AmenityRepository amenityRepository;
    
    private RowMapper<Room> mapper = new RowMapper<Room>(){  
        @Override  
        public Room mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	RoomId id = new RoomId();  
        	Room e = new Room();  
        	e.setRoomId(id);
            id.setHotelId(rs.getInt("hotel_id"));  
            id.setRoomNumber(rs.getString("room_number"));  
            e.setCapacity(rs.getInt("capacity"));  
            e.setPrice(rs.getDouble("price"));  
            e.setExtendable(rs.getBoolean("extendable"));  
            e.setView(rs.getString("view"));  
            return e;  
        }  
    };  

	public List<Room> findAllByHotelId(Integer hotelId) {
		List<Amenity> amenities = amenityRepository.findAllByHotelId(hotelId);
		
		List<Room> rooms = jdbcTemplate.query(
        		"select * from room where hotel_id=? order by room_number",
        		new Object[] { hotelId },
                new int[] { Types.INTEGER },
                mapper);
		
		List<RoomAmenities> roomAmenities= jdbcTemplate.query(
                "select * from room_amenity where hotel_id  = ?",
                new Object[]{hotelId},
                new int[] {Types.INTEGER},
                new RowMapper<RoomAmenities>(){  
                    @Override  
                    public RoomAmenities mapRow(ResultSet rs, int rownumber) throws SQLException {  
                    	RoomAmenities e = new RoomAmenities();
                        e.setAmenityId(rs.getInt("amenity_id")); 
                        e.setRoomNumber(rs.getString("room_number"));
                        return e;
                    }  
                });
		
		for (Room room : rooms) {
			for (RoomAmenities ras : roomAmenities) {
				if (room.getRoomId().getRoomNumber().equals(ras.getRoomNumber())) {
					for (Amenity a : amenities) {
						if (a.getAmenityId().equals(ras.getAmenityId())) {
							room.getAmenities().add(a);
							break;
						}
					}
				}
			}
		}
		
		return rooms;
	}

	public Room save(Room room) {
        return null;
	}
	
	public Room create(Room room) {
        jdbcTemplate.update(
       		"insert into room (room_number, capacity, extendable, price, view, hotel_id) values (?, ?, ?, ?, ?, ?)",
       		room.getRoomId().getRoomNumber(), room.getCapacity(), room.getExtendable(), room.getPrice(), room.getView(), room.getRoomId().getHotelId());
        return room;
	}
}