package com.timlin.demo.hotelchain.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timlin.demo.hotelchain.entity.Amenity;
import com.timlin.demo.hotelchain.entity.BookedAmenity;
import com.timlin.demo.hotelchain.entity.BookedRoom;
import com.timlin.demo.hotelchain.entity.Booking;
import com.timlin.demo.hotelchain.entity.Customer;
import com.timlin.demo.hotelchain.entity.Employee;
import com.timlin.demo.hotelchain.entity.Hotel;
import com.timlin.demo.hotelchain.entity.HotelBrand;
import com.timlin.demo.hotelchain.entity.Office;
import com.timlin.demo.hotelchain.entity.Room;
import com.timlin.demo.hotelchain.repository.AmenityRepository;
import com.timlin.demo.hotelchain.repository.BookedAmenityRepository;
import com.timlin.demo.hotelchain.repository.BookedRoomRepository;
import com.timlin.demo.hotelchain.repository.BookingRepository;
import com.timlin.demo.hotelchain.repository.CustomerRepository;
import com.timlin.demo.hotelchain.repository.EmployeeRepository;
import com.timlin.demo.hotelchain.repository.HotelBrandRepository;
import com.timlin.demo.hotelchain.repository.HotelRepository;
import com.timlin.demo.hotelchain.repository.OfficeRepository;
import com.timlin.demo.hotelchain.repository.RoomAmenitiesRepository;
import com.timlin.demo.hotelchain.repository.RoomRepository;
import com.timlin.demo.hotelchain.service.ApiService;

@Service
public class ApiServiceImpl implements ApiService {

	@Autowired
	private HotelBrandRepository hotelBrandRepository;
	
	@Autowired
	private HotelRepository hotelRepository;

	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private AmenityRepository amenityRepository;

	@Autowired
	private RoomAmenitiesRepository roomAmenitiesRepository;

	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private BookedRoomRepository bookedRoomRepository;

	@Autowired
	private BookedAmenityRepository bookedAmenityRepository;

	@Autowired
	private OfficeRepository officeRepository;

	@Override
	public List<HotelBrand> getHotelBrands() {
		List<HotelBrand> hbs = hotelBrandRepository.findAll();
		for (HotelBrand hb: hbs) {
			hb.getHotels();
			hb.getOffices();
		}
		return hbs;
	}

	@Override
	public HotelBrand newHotelBrand(HotelBrand hotelBrand) {
		hotelBrand.setNumberOfHotels(0);
		return hotelBrandRepository.create(hotelBrand);
	}

	@Override
	public Hotel newHotel(Hotel hotel) {
		Hotel saved = hotelRepository.create(hotel);
		return saved;
	}

	@Override
	public Office newOffice(Office office) {
		return officeRepository.create(office);
	}

	@Override
	public Customer newCustomer(Customer customer) {
		return customerRepository.create(customer);
	}

	@Override
	public Employee newEmployee(Employee employee) {
		return employeeRepository.create(employee);
	}

	@Override
	public Room newRoom(Room room) {
		Room saved = roomRepository.create(room);
		roomAmenitiesRepository.saveAll(saved.getRoomId(), room.getAmenities());
		hotelRepository.updateRoomCount(saved.getRoomId().getHotelId());
		return saved;
	}

	@Override
	public Amenity newAmenity(Amenity amenity) {
		return amenityRepository.create(amenity);
	}

	@Override
	public HotelBrand getHotelBrand(Integer id) {
		HotelBrand hb = hotelBrandRepository.findById(id);
		List<Hotel> hs = hotelRepository.findAllByBrandId(hb.getBrandId());
		if (hs != null) {
			hb.setHotels(hs);
			for (Hotel h : hs) {
				h.setAmenities(
					amenityRepository.findAllByHotelId(h.getHotelId())
				);
			}
		}
		hb.setNumberOfHotels(hb.getHotels().size());
		hb.setOffices(officeRepository.findAllByBrandId(hb.getBrandId()));

		return hb;
	}

	@Override
	public List<Customer> getCustomers() {
		return customerRepository.findAll();
	}

	@Override
	public List<Employee> getEmployees() {
		return employeeRepository.findAll();
	}

	@Override
	public Hotel getHotel(Integer id) {
		Hotel hotel = hotelRepository.findById(id);
		if (hotel == null) return null;
		hotel.setAmenities(
			amenityRepository.findAllByHotelId(hotel.getHotelId())
		);
		hotel.setEmployees(
			employeeRepository.findAllByHotelId(hotel.getHotelId())
		);
		hotel.setRooms(
			roomRepository.findAllByHotelId(hotel.getHotelId())
		);
		return hotel;
	}

	@Override
	public Booking prepareBooking(Integer id) {
		Hotel hotel = getHotel(id);
		Booking booking = new Booking();
		if (hotel != null) {
			booking.setBookedRooms(
				hotel.getRooms().stream().map(r->new BookedRoom(r)).collect(Collectors.toList())
			);
		}
		return booking;
	}

	@Override
	public Booking newBooking(Booking booking) {
		if (booking.getState() == null) {
			booking.setState("Booking");
		}
		Booking saved = bookingRepository.create(booking);
		for (BookedRoom br : booking.getBookedRooms()) {
			br.getRoomId().setBookingId(saved.getBookingId());
			br.getRoomId().setState(saved.getState());
		}
		bookedRoomRepository.create(booking.getBookedRooms());
		List<BookedAmenity> bookedAmenities = new ArrayList<>();
		for (BookedRoom br : booking.getBookedRooms()) {
			bookedAmenities.addAll(br.getAmenities());
			for (BookedAmenity ba : br.getAmenities()) {
				ba.getAmenityId().setBookingId(saved .getBookingId());
				ba.getAmenityId().setState(saved .getState());
			}
		}
		if (!bookedAmenities.isEmpty()) {
			bookedAmenityRepository.create(bookedAmenities);
		}
		return saved;
	}

	@Override
	public Customer getCustomer(Integer id) {
		if (id == 0) {
			List<Customer> all = customerRepository.findAll();
			if (all.size() > 0) return all.get(0);
			return null;
		}
		return customerRepository.findById(id);
	}

	@Override
	public List<Amenity> getAmenities() {
		return amenityRepository.findAll();
	}

	@Override
	public Booking getBooking(Integer id, String state) {
		return bookingRepository.findById(id, state);
	}

	@Override
	public List<Booking> getBookings(Integer id) {
		return bookingRepository.findByBookingId(id);
	}

	@Override
	public List<Booking> getBookings() {
		return bookingRepository.findAll();
	}

	@Override
	public Booking getLatestBooking(Integer id) {
		List<Booking> bookings = bookingRepository.findByBookingId(id);
		if (bookings.isEmpty()) {
			return null;
		}
		Collections.sort(bookings, new Comparator<Booking>() {
			@Override
			public int compare(Booking o1, Booking o2) {
				return -(o1.getTimeStamp().compareTo(o2.getTimeStamp()));
			}
		});
		return bookings.get(0);
	}
}
