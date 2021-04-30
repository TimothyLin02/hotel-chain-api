package com.timlin.demo.hotelchain.entity;

import java.io.Serializable;

public class Amenity implements Serializable {

	private Integer amenityId;
	private String amenity;
	
	public Integer getAmenityId() {
		return amenityId;
	}

	public void setAmenityId(Integer amenityID) {
		this.amenityId = amenityID;
	}

	public String getAmenity() {
		return amenity;
	}

	public void setAmenity(String amenity) {
		this.amenity = amenity;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((amenity == null) ? 0 : amenity.hashCode());
		result = prime * result + ((amenityId == null) ? 0 : amenityId.hashCode());
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
		Amenity other = (Amenity) obj;
		if (amenity == null) {
			if (other.amenity != null)
				return false;
		} else if (!amenity.equals(other.amenity))
			return false;
		if (amenityId == null) {
			if (other.amenityId != null)
				return false;
		} else if (!amenityId.equals(other.amenityId))
			return false;
		return true;
	}
}
