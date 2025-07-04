package com.airline.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Airport {

	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long airportId;

	    private String name;
	    private String code;
	    private String location;

	    @OneToMany(mappedBy = "airport", cascade = CascadeType.ALL)
	    private List<Flight> flights;

		public Long getAirportId() {
			return airportId;
		}

		public void setAirportId(Long airportId) {
			this.airportId = airportId;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
		}

		public List<Flight> getFlights() {
			return flights;
		}

		public void setFlights(List<Flight> flights) {
			this.flights = flights;
		}
	    
	    
}
