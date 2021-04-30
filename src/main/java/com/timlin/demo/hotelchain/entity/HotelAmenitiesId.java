package com.timlin.demo.hotelchain.entity;

import java.io.Serializable;

public class HotelAmenitiesId implements Serializable {

	private Integer amenityId;
	private Integer hotelId;
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((amenityId == null) ? 0 : amenityId.hashCode());
		result = prime * result + ((hotelId == null) ? 0 : hotelId.hashCode());
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
		HotelAmenitiesId other = (HotelAmenitiesId) obj;
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
		return true;
	}
	public Integer getAmenityId() {
		return amenityId;
	}
	public void setAmenityId(Integer amenityId) {
		this.amenityId = amenityId;
	}
	public Integer getHotelId() {
		return hotelId;
	}
	public void setHotelId(Integer hotelId) {
		this.hotelId = hotelId;
	}
	
	
}
