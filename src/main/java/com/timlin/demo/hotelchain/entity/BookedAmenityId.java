package com.timlin.demo.hotelchain.entity;

import java.io.Serializable;

public class BookedAmenityId implements Serializable {

	private Integer bookingId;
	private String state;
	private Integer hotelId;
	private String roomNumber;
	private Integer amenityId;
	
	public BookedAmenityId() {
	}
	
	public BookedAmenityId(Integer amenityId, BookedRoomId bookedRoomId) {
		this.amenityId = amenityId;
		this.bookingId = bookedRoomId.getBookingId();
		this.state = bookedRoomId.getState();
		this.hotelId = bookedRoomId.getHotelId();
		this.roomNumber = bookedRoomId.getRoomNumber();
	}
	
	public Integer getBookingId() {
		return bookingId;
	}
	public void setBookingId(Integer bookingId) {
		this.bookingId = bookingId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getHotelId() {
		return hotelId;
	}
	public void setHotelId(Integer hotelId) {
		this.hotelId = hotelId;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public Integer getAmenityId() {
		return amenityId;
	}
	public void setAmenityId(Integer amenityId) {
		this.amenityId = amenityId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((amenityId == null) ? 0 : amenityId.hashCode());
		result = prime * result + ((bookingId == null) ? 0 : bookingId.hashCode());
		result = prime * result + ((hotelId == null) ? 0 : hotelId.hashCode());
		result = prime * result + ((roomNumber == null) ? 0 : roomNumber.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookedAmenityId other = (BookedAmenityId) obj;
		if (amenityId == null) {
			if (other.amenityId != null)
				return false;
		} else if (!amenityId.equals(other.amenityId))
			return false;
		if (bookingId == null) {
			if (other.bookingId != null)
				return false;
		} else if (!bookingId.equals(other.bookingId))
			return false;
		if (hotelId == null) {
			if (other.hotelId != null)
				return false;
		} else if (!hotelId.equals(other.hotelId))
			return false;
		if (roomNumber == null) {
			if (other.roomNumber != null)
				return false;
		} else if (!roomNumber.equals(other.roomNumber))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		return true;
	}

}
