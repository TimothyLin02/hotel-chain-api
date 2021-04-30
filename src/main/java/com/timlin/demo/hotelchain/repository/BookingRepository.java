package com.timlin.demo.hotelchain.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.timlin.demo.hotelchain.entity.Booking;

@Repository
public class BookingRepository 
{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
	@Autowired
	private BookedRoomRepository bookedRoomRepository;

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private CustomerRepository customerRepository;


	
    private RowMapper<Booking> mapper = new RowMapper<Booking>(){  
        @Override  
        public Booking mapRow(ResultSet rs, int rownumber) throws SQLException {  
        	Booking e = new Booking();  
            e.setBookingId(rs.getInt("booking_id"));  
            e.setCustID(rs.getInt("custid"));  
            e.setCost(rs.getDouble("cost"));  
            e.setState(rs.getString("state"));  
            e.setServicedBy(rs.getInt("employee_id"));  
            e.setStartDate(rs.getTimestamp("start_date"));  
            e.setEndDate(rs.getTimestamp("end_date"));  
            e.setTimeStamp(rs.getTimestamp("time_stamp"));
            if (e.getServicedBy() == 0) {
            	e.setServicedBy(null);
            }
            return e;  
        }  
    };

	public Booking save(Booking booking) {
		return null;
	}
	
	public Booking create(Booking booking) {
		if (booking.getBookingId() != null) {
		    jdbcTemplate.update(connection -> {
		        PreparedStatement ps = connection.prepareStatement(
	            	"insert into booking (booking_id, state, custid, cost, end_date, start_date, time_stamp, employee_id) values (?, ?, ?, ?, ?, ?, ?, ?)"
	            );
	           	ps.setInt(1, booking.getBookingId());
	           	ps.setString(2, booking.getState());
	           	ps.setInt(3, booking.getCustID());
	           	ps.setDouble(4, booking.getCost());
	           	ps.setTimestamp(5, new java.sql.Timestamp(booking.getEndDate().getTime()));
	           	ps.setTimestamp(6, new java.sql.Timestamp(booking.getStartDate().getTime()));
	           	ps.setTimestamp(7, new java.sql.Timestamp(booking.getTimeStamp().getTime()));
	           	if (booking.getServicedBy() == null || booking.getServicedBy() == 0) {
	               	ps.setNull(8, Types.INTEGER);
	           	}
	           	else {
	               	ps.setInt(8, booking.getServicedBy());
	           	}
		        return ps;
		    });
		    return booking;
		}
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
	    jdbcTemplate.update(connection -> {
	        PreparedStatement ps = connection.prepareStatement(
            	"insert into booking (state, custid, cost, end_date, start_date, time_stamp, employee_id) values (?, ?, ?, ?, ?, ?, ?)",
               	new String[] { "booking_id" }
            );
           	ps.setString(1, booking.getState());
           	ps.setInt(2, booking.getCustID());
           	ps.setDouble(3, booking.getCost());
           	ps.setTimestamp(4, new java.sql.Timestamp(booking.getEndDate().getTime()));
           	ps.setTimestamp(5, new java.sql.Timestamp(booking.getStartDate().getTime()));
           	ps.setTimestamp(6, new java.sql.Timestamp(booking.getTimeStamp().getTime()));
           	if (booking.getServicedBy() == null || booking.getServicedBy() == 0) {
               	ps.setNull(7, Types.INTEGER);
           	}
           	else {
               	ps.setInt(7, booking.getServicedBy());
           	}
	        return ps;
	    }, keyHolder);

	    booking.setBookingId(keyHolder.getKey().intValue());
	    return booking;
	}

	public List<Booking> findByBookingId(Integer id) {
		List<Booking> lst = jdbcTemplate.query(
                "select * from booking where booking_id = ?",
                new Object[]{id},
                new int[] {Types.INTEGER},
                mapper);
		if (lst == null || lst.isEmpty()) {
			return Collections.EMPTY_LIST;
		}
		
		for (Booking booking : lst) {
			fill(booking);
		}
		return lst;
	}
	
	public Booking findById(Integer id, String state) {
		List<Booking> lst = jdbcTemplate.query(
                "select * from booking where booking_id = ? and state = ?",
                new Object[]{id, state},
                new int[] {Types.INTEGER, Types.VARCHAR},
                mapper);
		if (lst == null || lst.isEmpty()) {
			return null;
		}
		
		Booking booking = lst.get(0);
		fill(booking);
		return booking;
	}

	public List<Booking> findAll() {
		List<Booking> lst = jdbcTemplate.query(
                "select * from booking",
                mapper);
		if (lst == null || lst.isEmpty()) {
			return Collections.EMPTY_LIST;
		}
		
		for (Booking booking : lst) {
			fill(booking);
		}
		return lst;
	}
	
	public void fill(Booking booking) {
		booking.setBookedRooms(
			bookedRoomRepository.findByBooking(booking.getBookingId(), booking.getState())
		);
		booking.setCustomer(
			customerRepository.findById(booking.getCustID())
		);
		booking.setEmployee(
			employeeRepository.findById(booking.getServicedBy())
		);
	}
}
