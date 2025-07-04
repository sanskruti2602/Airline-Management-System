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
public class Ticket {

	 	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long ticketId;

	    private String seatNumber;
	    private String travelDate;
	    private Double price;
	    private String status;  // Booked / Cancelled

	    @ManyToOne
	    @JoinColumn(name = "flight_id")
	    private Flight flight;

	    @ManyToOne
	    @JoinColumn(name = "passenger_id")
	    private Passenger passenger;

		public Long getTicketId() {
			return ticketId;
		}

		public void setTicketId(Long ticketId) {
			this.ticketId = ticketId;
		}

		public String getSeatNumber() {
			return seatNumber;
		}

		public void setSeatNumber(String seatNumber) {
			this.seatNumber = seatNumber;
		}

		public String getTravelDate() {
			return travelDate;
		}

		public void setTravelDate(String travelDate) {
			this.travelDate = travelDate;
		}

		public Double getPrice() {
			return price;
		}

		public void setPrice(Double price) {
			this.price = price;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public Flight getFlight() {
			return flight;
		}

		public void setFlight(Flight flight) {
			this.flight = flight;
		}

		public Passenger getPassenger() {
			return passenger;
		}

		public void setPassenger(Passenger passenger) {
			this.passenger = passenger;
		}
	    
}
