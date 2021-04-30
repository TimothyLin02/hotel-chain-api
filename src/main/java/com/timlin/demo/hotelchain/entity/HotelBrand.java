package com.timlin.demo.hotelchain.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class HotelBrand implements Serializable {

	private Integer brandId;
	
	private String HotelName;
	private Integer numberOfHotels;

	private List<Hotel> hotels = new ArrayList<>();
	private List<Office> offices = new ArrayList<>();
	
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer brandID) {
		this.brandId = brandID;
	}
	public String getHotelName() {
		return HotelName;
	}
	public void setHotelName(String hotelName) {
		HotelName = hotelName;
	}
	public Integer getNumberOfHotels() {
		return numberOfHotels;
	}
	public void setNumberOfHotels(Integer numberOfHotels) {
		this.numberOfHotels = numberOfHotels;
	}
	public List<Hotel> getHotels() {
		return hotels;
	}
	public void setHotels(List<Hotel> hotels) {
		this.hotels = hotels;
	}
	public List<Office> getOffices() {
		return offices;
	}
	public void setOffices(List<Office> offices) {
		this.offices = offices;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((HotelName == null) ? 0 : HotelName.hashCode());
		result = prime * result + ((brandId == null) ? 0 : brandId.hashCode());
		result = prime * result + ((numberOfHotels == null) ? 0 : numberOfHotels.hashCode());
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
		HotelBrand other = (HotelBrand) obj;
		if (HotelName == null) {
			if (other.HotelName != null)
				return false;
		} else if (!HotelName.equals(other.HotelName))
			return false;
		if (brandId == null) {
			if (other.brandId != null)
				return false;
		} else if (!brandId.equals(other.brandId))
			return false;
		if (numberOfHotels == null) {
			if (other.numberOfHotels != null)
				return false;
		} else if (!numberOfHotels.equals(other.numberOfHotels))
			return false;
		return true;
	}
	
}
