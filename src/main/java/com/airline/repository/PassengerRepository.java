package com.airline.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.airline.entity.Passenger;

@Repository
public interface PassengerRepository extends JpaRepository<Passenger, Long> {

	  Passenger findByEmailAndPassword(String email, String password);

	Optional<Passenger> findById(Long id);

	void deleteById(Long id);
}
