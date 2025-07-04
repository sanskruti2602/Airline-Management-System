package com.airline.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.entity.Flight;
import com.airline.repository.FlightRepository;

@Service
public class FlightServiceImpl implements FlightService {

    @Autowired
    private FlightRepository flightRepository;

    @Override
    public Flight saveFlight(Flight flight) {
        try {
            return flightRepository.save(flight);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Flight> getAllFlights() {
        try {
            return flightRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Flight getFlightById(Long id) {
        try {
            return flightRepository.findById(id).orElse(null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void deleteFlightById(Long id) {
        try {
            flightRepository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateFlight(Flight flight) {
        try {
            Optional<Flight> existing = flightRepository.findById(flight.getFlightId());
            if (existing.isPresent()) {
                flightRepository.save(flight);
            } else {
                throw new RuntimeException("Flight not found with ID: " + flight.getFlightId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
