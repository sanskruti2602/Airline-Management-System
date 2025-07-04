package com.airline.service;

import java.util.List;

import com.airline.entity.Airport;

public interface AirportService {

		Airport saveAirport(Airport airport);
	    List<Airport> getAllAirports();
	    Airport getAirportById(Integer id);
	    void deleteAirportById(Integer id);
}
