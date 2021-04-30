package com.timlin.demo.hotelchain.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class BookedRoom implements Serializable {

	private BookedRoomId roomId;
	
	private Double price;
	private Integer capacity;
	private Boolean extendable;
	private String view;
	private Integer occupancy;
	
	private List<BookedAmenity> amenities = new ArrayList<>();

	
	public BookedRoom() {
	}
	

	public BookedRoom(Room r) {
		roomId = new BookedRoomId(r.getRoomId());
		price = r.getPrice();
		capacity = r.getCapacity();
		extendable = r.getExtendable();
		view = r.getView();
		amenities.addAll(
			r.getAmenities().stream().map(a->new BookedAmenity(a, BookedRoom.this)).collect(Collectors.toList())
		);
	}

	public BookedRoomId getRoomId() {
		return roomId;
	}

	public void setRoomId(BookedRoomId roomId) {
		this.roomId = roomId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public Boolean getExtendable() {
		return extendable;
	}

	public void setExtendable(Boolean extendable) {
		this.extendable = extendable;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public List<BookedAmenity> getAmenities() {
		return amenities;
	}

	public void setAmenities(List<BookedAmenity> amenities) {
		this.amenities = amenities;
	}

	
	public Integer getOccupancy() {
		return occupancy;
	}

	public void setOccupancy(Integer occupancy) {
		this.occupancy = occupancy;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((capacity == null) ? 0 : capacity.hashCode());
		result = prime * result + ((extendable == null) ? 0 : extendable.hashCode());
		result = prime * result + ((occupancy == null) ? 0 : occupancy.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((roomId == null) ? 0 : roomId.hashCode());
		result = prime * result + ((view == null) ? 0 : view.hashCode());
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
		BookedRoom other = (BookedRoom) obj;
		if (capacity == null) {
			if (other.capacity != null)
				return false;
		} else if (!capacity.equals(other.capacity))
			return false;
		if (extendable == null) {
			if (other.extendable != null)
				return false;
		} else if (!extendable.equals(other.extendable))
			return false;
		if (occupancy == null) {
			if (other.occupancy != null)
				return false;
		} else if (!occupancy.equals(other.occupancy))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (roomId == null) {
			if (other.roomId != null)
				return false;
		} else if (!roomId.equals(other.roomId))
			return false;
		if (view == null) {
			if (other.view != null)
				return false;
		} else if (!view.equals(other.view))
			return false;
		return true;
	}

	
}
