package com.timlin.demo.hotelchain.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.timlin.demo.hotelchain.entity.Amenity;
import com.timlin.demo.hotelchain.entity.Booking;
import com.timlin.demo.hotelchain.entity.Customer;
import com.timlin.demo.hotelchain.entity.Employee;
import com.timlin.demo.hotelchain.entity.Hotel;
import com.timlin.demo.hotelchain.entity.HotelBrand;
import com.timlin.demo.hotelchain.entity.Office;
import com.timlin.demo.hotelchain.entity.Room;
import com.timlin.demo.hotelchain.service.ApiService;


@RestController
public class ApiController {

	@Autowired
	private ApiService apiService;

    @GetMapping(value="/api/hotelbrand")
    public List<HotelBrand> hotelBrands() {
        return apiService.getHotelBrands();
    }
    
    @GetMapping(value="/api/hotelbrand/{id}")
    public HotelBrand getHotelBrand(@PathVariable Integer id) {
        return apiService.getHotelBrand(id);
    }
    
    @PostMapping(value="/api/hotelbrand")
    public HotelBrand newHotelBrand(@RequestBody HotelBrand hotelBrand) {
        return apiService.newHotelBrand(hotelBrand);
    }
    
    @PostMapping(value="/api/hotel")
    public Hotel newHotel(@RequestBody Hotel hotel) {
    	if (hotel.getStars() == null) {
        	hotel.setStars(0.0);
    	}
        return apiService.newHotel(hotel);
    }

    @PostMapping(value="/api/room")
    public Room newRoom(@RequestBody Room room) {
        return apiService.newRoom(room);
    }
    
    @PostMapping(value="/api/amenity")
    public Amenity newAmenity(@RequestBody Amenity amenity) {
        return apiService.newAmenity(amenity);
    }
    
    @PostMapping(value="/api/office")
    public Office newOffice(@RequestBody Office office) {
        return apiService.newOffice(office);
    }
    
    @PostMapping(value="/api/customer")
    public Customer newCustomer(@RequestBody Customer customer) {
    	customer.setCustID(null);
    	customer.setRegistrationDate(new Date());
        return apiService.newCustomer(customer);
    }
    
    @PostMapping(value="/api/employee")
    public Employee newEmployee(@RequestBody Employee employee) {
    	employee.setEmployeeId(null);
        return apiService.newEmployee(employee);
    }
    
    @GetMapping(value="/api/customer")
    public List<Customer> customers() {
        return apiService.getCustomers();
    }
    
    @GetMapping(value="/api/customer/{id}")
    public Customer getCustomer(@PathVariable Integer id) {
        return apiService.getCustomer(id);
    }
    
    @GetMapping(value="/api/amenity")
    public List<Amenity> amenities() {
        return apiService.getAmenities();
    }
    
    @GetMapping(value="/api/employee")
    public List<Employee> employees() {
        return apiService.getEmployees();
    }
    
    @GetMapping(value="/api/hotel/{id}")
    public Hotel getHotel(@PathVariable Integer id) {
        return apiService.getHotel(id);
    }
    
    @GetMapping(value="/api/booking/prepare/{id}")
    public Booking prepareBooking(@PathVariable Integer id) {
        return apiService.prepareBooking(id);
    }
    
    @GetMapping(value="/api/booking/history/{id}")
    public List<Booking> bookingHistory(@PathVariable Integer id) {
        return apiService.getBookings(id);
    }
    
    @GetMapping(value="/api/booking")
    public List<Booking> getBookings() {
        return apiService.getBookings();
    }
    
    @GetMapping(value="/api/checkin/{id}")
    public Booking getBooking(@PathVariable Integer id) {
        return apiService.getLatestBooking(id);
    }
    
    @GetMapping(value="/api/checkout/{id}")
    public Booking getRentedBooking(@PathVariable Integer id) {
        return apiService.getLatestBooking(id);
    }
    
    @PostMapping(value="/api/booking")
    public Booking newBooking(@RequestBody Booking booking) {
    	booking.setState("Booking");
    	booking.setTimeStamp(new Date());
        return apiService.newBooking(booking);
    }
    
    @PostMapping(value="/api/checkin")
    public Booking newRent(@RequestBody Booking booking) {
    	booking.setState("Renting");
    	booking.setTimeStamp(new Date());
        return apiService.newBooking(booking);
    }
    
    @PostMapping(value="/api/checkout")
    public Booking newPay(@RequestBody Booking booking) {
    	booking.setState("Paid");
    	booking.setTimeStamp(new Date());
        return apiService.newBooking(booking);
    }
}
