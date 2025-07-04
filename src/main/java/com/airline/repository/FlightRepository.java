package com.airline.repository;


//import java.util.Optional;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.airline.entity.Flight;

@Repository
public interface FlightRepository extends JpaRepository<Flight , Long>{

//	void deleteById(Long id);
//
//	Optional<Flight> findById(Long id);


}
