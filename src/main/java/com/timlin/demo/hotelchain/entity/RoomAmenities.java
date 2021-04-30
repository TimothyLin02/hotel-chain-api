package com.timlin.demo.hotelchain.entity;

import java.io.Serializable;

public class RoomAmenities implements Serializable{
	
	private Integer amenityId;
	private String roomNumber;
	private Integer hotelId;
	
	public Integer getAmenityId() {
		return amenityId;
	}
	public void setAmenityId(Integer amenityId) {
		this.amenityId = amenityId;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public Integer getHotelId() {
		return hotelId;
	}
	public void setHotelId(Integer hotelId) {
		this.hotelId = hotelId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((amenityId == null) ? 0 : amenityId.hashCode());
		result = prime * result + ((hotelId == null) ? 0 : hotelId.hashCode());
		result = prime * result + ((roomNumber == null) ? 0 : roomNumber.hashCode());
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
		RoomAmenities other = (RoomAmenities) obj;
		if (amenityId == null) {
			if (other.amenityId != null)
				return false;
		} else if (!amenityId.equals(other.amenityId))
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
		return true;
	}
	
	
}
