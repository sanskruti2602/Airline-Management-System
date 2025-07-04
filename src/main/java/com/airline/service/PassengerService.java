package com.airline.service;

import java.util.List;
import com.airline.entity.Passenger;

public interface PassengerService {

    Passenger savePassenger(Passenger passenger);
    List<Passenger> getAllPassengers();
    void updatePassenger(Passenger passenger); 
    Passenger getPassengerByEmailAndPassword(String email, String password);
    Passenger getPassengerById(Long id);
    void deletePassengerById(Long id);


}
