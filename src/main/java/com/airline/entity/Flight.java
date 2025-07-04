package com.airline.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Flight {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long flightId;
	 private String flightNumber;
	    private String airlineName;
	    private String source;
	    private String destination;
	    private String departureTime;
	    private String arrivalTime;

	    private Double price; // ✅ Add this line

	    // Getters and setters for price
	    public Double getPrice() {
	        return price;
	    }

	    public void setPrice(Double price) {
	        this.price = price;
	    }
	    
	    private int seats;

	    // Getters and setters
	    public int getSeats() {
	        return seats;
	    }

	    public void setSeats(int seats) {
	        this.seats = seats;
	    }
	    
	    @ManyToOne
	    @JoinColumn(name = "airport_id")
	    private Airport airport;

	    @OneToMany(mappedBy = "flight", cascade = CascadeType.ALL)
	    private List<Ticket> tickets;

		public Long getFlightId() {
			return flightId;
		}

		public void setFlightId(Long flightId) {
			this.flightId = flightId;
		}

		public String getFlightNumber() {
			return flightNumber;
		}

		public void setFlightNumber(String flightNumber) {
			this.flightNumber = flightNumber;
		}

		public String getAirlineName() {
			return airlineName;
		}

		public void setAirlineName(String airlineName) {
			this.airlineName = airlineName;
		}

		public String getSource() {
			return source;
		}

		public void setSource(String source) {
			this.source = source;
		}

		public String getDestination() {
			return destination;
		}

		public void setDestination(String destination) {
			this.destination = destination;
		}

		public String getDepartureTime() {
			return departureTime;
		}

		public void setDepartureTime(String departureTime) {
			this.departureTime = departureTime;
		}

		public String getArrivalTime() {
			return arrivalTime;
		}

		public void setArrivalTime(String arrivalTime) {
			this.arrivalTime = arrivalTime;
		}

		public Airport getAirport() {
			return airport;
		}

		public void setAirport(Airport airport) {
			this.airport = airport;
		}

		public List<Ticket> getTickets() {
			return tickets;
		}

		public void setTickets(List<Ticket> tickets) {
			this.tickets = tickets;
		}
	    
	    

}
