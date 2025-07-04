package com.airline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.entity.Passenger;
import com.airline.repository.PassengerRepository;

@Service
public class PassengerServiceImpl implements PassengerService {

    @Autowired
    private PassengerRepository passengerRepository;

    @Override
    public Passenger savePassenger(Passenger passenger) {
        try {
            return passengerRepository.save(passenger);
        } catch (Exception e) {
            e.printStackTrace(); // Log for debugging
            return null;
        }
    }

    @Override
    public List<Passenger> getAllPassengers() {
        try {
            return passengerRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Passenger getPassengerByEmailAndPassword(String email, String password) {
        return passengerRepository.findByEmailAndPassword(email, password);
    }

	 @Override
	    public void updatePassenger(Passenger passenger) {
	        try {
	            passengerRepository.save(passenger); // save() does both insert and update
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 @Override
	 public Passenger getPassengerById(Long id) {
	     try {
	         return passengerRepository.findById(id).orElse(null);
	     } catch (Exception e) {
	         e.printStackTrace();
	         return null;
	     }
	 }

	 @Override
	 public void deletePassengerById(Long id) {
	     try {
	         passengerRepository.deleteById(id);
	     } catch (Exception e) {
	         e.printStackTrace();
	     }
	 }

}
