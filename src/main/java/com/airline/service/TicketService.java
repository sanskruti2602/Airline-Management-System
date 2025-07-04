package com.airline.service;

import java.util.List;

import com.airline.entity.Ticket;

public interface TicketService {
	
	 Ticket saveTicket(Ticket ticket);
	 List<Ticket> getAllTickets();
	 Ticket getTicketById(Long id);
	 void deleteTicketById(Long ticketId);
	 List<Ticket> getTicketsByPassengerId(Long passengerId);

}
