package com.airline.controller;

import com.airline.entity.Flight;
import com.airline.entity.Passenger;
import com.airline.service.FlightService;
import com.airline.service.PassengerService;
import com.airline.service.TicketService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class AdminController {

	@Autowired 
	private TicketService ticketService;
    @Autowired
    private FlightService flightService;

    @Autowired
    private PassengerService passengerService;

    // ----------------------------------------
    // 1. Admin Login
    // ----------------------------------------
    @PostMapping("/adminLogin")
    public String handleAdminLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            Model model) {

        if ("admin".equals(username) && "admin123".equals(password)) {
            return "admin-dashboard";
        } else {
            model.addAttribute("error", "Invalid username or password.");
            return "admin-login";
        }
    }

    @GetMapping("/admin-dashboard")
    public String adminDashboard() {
        return "admin-dashboard";
    }

    // ----------------------------------------
    // 2. Add Flight
    // ----------------------------------------
    @GetMapping("/add-flight")
    public String showAddFlightForm(Model model) {
        model.addAttribute("flight", new Flight());
        return "add-flight";
    }

    @PostMapping("/saveFlight")
    public String saveFlight(@ModelAttribute Flight flight, Model model) {
        flightService.saveFlight(flight);
        model.addAttribute("successMessage", "Flight added successfully!");
        model.addAttribute("flight", new Flight());
        return "add-flight";
    }

    // ----------------------------------------
    // 3. View / Update Flights
    // ----------------------------------------
    @GetMapping("/update-flights")
    public String showUpdateFlights(Model model, @ModelAttribute("message") String message) {
        model.addAttribute("flightList", flightService.getAllFlights());
        model.addAttribute("selectedFlight", new Flight());
        if (!message.isEmpty()) model.addAttribute("message", message);
        return "update-flights";
    }

    @GetMapping("/edit-flight")
    public String editFlight(@RequestParam("id") Long id, Model model) {
        model.addAttribute("selectedFlight", flightService.getFlightById(id));
        model.addAttribute("flightList", flightService.getAllFlights());
        return "update-flights";
    }

    @PostMapping("/updateFlight")
    public String updateFlight(@ModelAttribute Flight flight, RedirectAttributes redirectAttributes) {
        flightService.updateFlight(flight);
        redirectAttributes.addFlashAttribute("message", "Flight updated successfully!");
        return "redirect:/update-flights";
    }

    @GetMapping("/delete-flight")
    public String deleteFlight(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        flightService.deleteFlightById(id);
        redirectAttributes.addFlashAttribute("message", "Flight deleted successfully!");
        return "redirect:/update-flights";
    }

    // ----------------------------------------
    // 4. Cancel Flights
    // ----------------------------------------
    @GetMapping("/cancel-flight")
    public String cancelFlightPage(Model model, @ModelAttribute("cancelSuccess") String cancelMessage) {
        model.addAttribute("flightList", flightService.getAllFlights());
        if (!cancelMessage.isEmpty()) {
            model.addAttribute("cancelMessage", "Flight canceled successfully!");
        }
        return "cancel-flights";
    }

    @PostMapping("/cancelFlight")
    public String cancelFlight(@RequestParam("flightId") Long id, RedirectAttributes redirectAttributes) {
        flightService.deleteFlightById(id);
        redirectAttributes.addFlashAttribute("cancelSuccess", "true");
        return "redirect:/cancel-flight";
    }

    // ----------------------------------------
    // 5. Passenger Management
    // ----------------------------------------

    // View all passengers
    @GetMapping("/view-passengers")
    public String viewPassengers(Model model) {
        model.addAttribute("passengerList", passengerService.getAllPassengers());
        return "view-passengers";
    }

    // Show list to update
    @GetMapping("/update-passengers")
    public String updatePassengers(Model model, @ModelAttribute("message") String message) {
        model.addAttribute("passengerList", passengerService.getAllPassengers());
        model.addAttribute("selectedPassenger", new Passenger());
        if (!message.isEmpty()) model.addAttribute("message", message);
        return "update-passengers";
    }

    // Edit specific passenger
    @GetMapping("/update-passenger")
    public String updatePassenger(@RequestParam("id") Long id, Model model) {
        model.addAttribute("selectedPassenger", passengerService.getPassengerById(id));
        model.addAttribute("passengerList", passengerService.getAllPassengers());
        return "update-passengers";
    }

    // Save updated passenger
    @PostMapping("/update-passenger")
    public String saveUpdatedPassenger(@ModelAttribute Passenger passenger, RedirectAttributes redirectAttributes) {
        passengerService.updatePassenger(passenger);
        redirectAttributes.addFlashAttribute("message", "Passenger updated successfully!");
        return "redirect:/update-passengers";
    }

    // Show list to delete
    @GetMapping("/delete-passengers")
    public String deletePassengersPage(Model model, @ModelAttribute("message") String message) {
        model.addAttribute("passengerList", passengerService.getAllPassengers());
        if (!message.isEmpty()) model.addAttribute("message", message);
        return "delete-passengers";
    }

    // Delete selected passenger
    @GetMapping("/delete-passenger")
    public String deletePassenger(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        passengerService.deletePassengerById(id);
        redirectAttributes.addFlashAttribute("message", "Passenger deleted successfully!");
        return "redirect:/delete-passengers";
    }

	 // ----------------------------------------
	 // 6. Booking Management
	 // ----------------------------------------
	
	 @GetMapping("/view-bookings")
	 public String viewBookings(Model model) {
	     model.addAttribute("ticketList", ticketService.getAllTickets());
	     return "view-bookings";
	 }
	
	 @GetMapping("/cancel-booking-page")
	 public String showCancelBookingPage(Model model, @ModelAttribute("cancelMessage") String cancelMessage) {
	     model.addAttribute("ticketList", ticketService.getAllTickets());
	     if (!cancelMessage.isEmpty()) {
	         model.addAttribute("cancelMessage", cancelMessage);
	     }
	     return "cancel-booking";
	 }
	
	 @PostMapping("/cancel-booking")
	 public String cancelTicket(@RequestParam("ticketId") Long ticketId, RedirectAttributes redirectAttributes) {
	     try {
	         ticketService.deleteTicketById(ticketId);
	         redirectAttributes.addFlashAttribute("cancelMessage", "Ticket cancelled successfully.");
	     } catch (Exception e) {
	         redirectAttributes.addFlashAttribute("cancelMessage", "Error occurred while cancelling ticket.");
	     }
	     return "redirect:/cancel-booking-page";
	 }
	
	 @GetMapping("/confirm-booking")
	 public String confirmBookingPage(Model model) {
	     // If you want to show pending tickets or allow admin to approve them later
	     model.addAttribute("ticketList", ticketService.getAllTickets());
	     return "confirm-booking";
	 }

}
