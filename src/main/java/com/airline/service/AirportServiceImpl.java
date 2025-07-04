package com.airline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.entity.Airport;
import com.airline.repository.AirportRepository;

@Service
public class AirportServiceImpl implements AirportService {

    @Autowired
    private AirportRepository airportRepository;

    @Override
    public Airport saveAirport(Airport airport) {
        try {
            return airportRepository.save(airport);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Airport> getAllAirports() {
        try {
            return airportRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Airport getAirportById(Integer id) {
        try {
            return airportRepository.findById(id).orElse(null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void deleteAirportById(Integer id) {
        try {
            airportRepository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
