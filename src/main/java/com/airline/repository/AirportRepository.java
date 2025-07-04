package com.airline.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.airline.entity.Airport;

@Repository
public interface AirportRepository extends JpaRepository<Airport, Integer>{

}
