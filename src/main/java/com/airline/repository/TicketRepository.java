package com.airline.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.airline.entity.Ticket;

@Repository
public interface TicketRepository extends JpaRepository<Ticket,Long> {
	List<Ticket> findByPassenger_PassengerId(Long passengerId);

	//void deleteById(Long ticketId);

}
