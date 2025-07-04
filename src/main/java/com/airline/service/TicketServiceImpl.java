package com.airline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.entity.Ticket;
import com.airline.repository.TicketRepository;

@Service
public class TicketServiceImpl implements TicketService{

	@Autowired
	private TicketRepository ticketRepository;
	@Override
	public Ticket saveTicket(Ticket ticket) {
		
		try
		{
			return ticketRepository.save(ticket);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<Ticket> getAllTickets() {
	
		try
		{
			return ticketRepository.findAll();
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public Ticket getTicketById(Long id) {

		try
		{
			return ticketRepository.findById(id).orElse(null);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@Override
	public List<Ticket> getTicketsByPassengerId(Long passengerId) {
	    return ticketRepository.findByPassenger_PassengerId(passengerId);
	}

	@Override
	public void deleteTicketById(Long ticketId) {
		// TODO Auto-generated method stub
		
		try
		 {
			 ticketRepository.deleteById(ticketId);
		 }catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
	}


}
