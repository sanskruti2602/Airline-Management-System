package com.airline.service;

import java.util.List;
import com.airline.entity.Flight;

public interface FlightService {

    Flight saveFlight(Flight flight);

    List<Flight> getAllFlights();

    Flight getFlightById(Long id);

    void deleteFlightById(Long id);

    void updateFlight(Flight flight);
}
