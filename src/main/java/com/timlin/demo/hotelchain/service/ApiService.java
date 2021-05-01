package com.timlin.demo.hotelchain.service;

import java.util.List;
import java.util.Map;

import com.timlin.demo.hotelchain.entity.Amenity;
import com.timlin.demo.hotelchain.entity.BookedAmenity;
import com.timlin.demo.hotelchain.entity.Booking;
import com.timlin.demo.hotelchain.entity.Customer;
import com.timlin.demo.hotelchain.entity.Employee;
import com.timlin.demo.hotelchain.entity.Hotel;
import com.timlin.demo.hotelchain.entity.HotelBrand;
import com.timlin.demo.hotelchain.entity.Office;
import com.timlin.demo.hotelchain.entity.Room;
import com.timlin.demo.hotelchain.entity.Login;

public interface ApiService {

	public List<HotelBrand> getHotelBrands();

	public HotelBrand newHotelBrand(HotelBrand hotelBrand);

	public Hotel newHotel(Hotel hotel);

	public Office newOffice(Office office);

	public Customer newCustomer(Customer customer);

	public Employee newEmployee(Employee employee);

	public Room newRoom(Room room);

	public Amenity newAmenity(Amenity amenity);

	public HotelBrand getHotelBrand(Integer id);

	public List<Customer> getCustomers();

	public List<Employee> getEmployees();

	public Hotel getHotel(Integer id);

	public Booking prepareBooking(Integer id);

	public Booking newBooking(Booking booking);

	public Customer getCustomer(Integer id);

	public List<Amenity> getAmenities();

	public Booking getLatestBooking(Integer id);
	
	public Booking getBooking(Integer id, String state);
	
	public List<Booking> getBookings(Integer id);
	
	public List<Booking> getBookings();
	
	public Customer getLoginCustomer(Login login);
}
