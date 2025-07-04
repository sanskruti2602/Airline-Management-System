package com.airline.controller;

import com.airline.entity.Flight;
import com.airline.entity.Passenger;
import com.airline.entity.Ticket;
import com.airline.service.FlightService;
import com.airline.service.PassengerService;
import com.airline.service.TicketService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.List;

@Controller
public class PassengerController {

    @Autowired
    private PassengerService passengerService;

    @Autowired
    private TicketService ticketService;

    @Autowired
    private FlightService flightService;

    // --------------------- GET MAPPINGS ---------------------

    @GetMapping("/passenger-login")
    public String showPassengerLoginPage() {
        return "passenger-login";
    }

    @GetMapping("/passenger-register")
    public String showPassengerRegisterPage() {
        return "passenger-register";
    }

    @GetMapping("/passenger-dashboard")
    public String showDashboard(HttpSession session, RedirectAttributes redirectAttributes) {
        if (session.getAttribute("loggedInPassenger") == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first.");
            return "redirect:/passenger-login";
        }
        return "passenger-dashboard";
    }

    @GetMapping("/view-flights")
    public String showFlightListPage(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        if (session.getAttribute("loggedInPassenger") == null) {
            redirectAttributes.addFlashAttribute("error", "Please login first.");
            return "redirect:/passenger-login";
        }

        List<Flight> flights = flightService.getAllFlights();
        model.addAttribute("flightList", flights);
        return "view-flight";
    }

    @GetMapping("/book-ticket")
    public String showBookTicketPage(@RequestParam("flightId") Long flightId, Model model,
                                     HttpSession session, RedirectAttributes redirectAttributes) {
        if (session.getAttribute("loggedInPassenger") == null) {
            redirectAttributes.addFlashAttribute("error", "Please login to book a flight.");
            return "redirect:/passenger-login";
        }

        Flight flight = flightService.getFlightById(flightId);
        if (flight == null) {
            redirectAttributes.addFlashAttribute("error", "Flight not found.");
            return "redirect:/view-flights";
        }

        model.addAttribute("flight", flight);
        return "ticket-book";
    }

    @GetMapping("/my-tickets")
    public String showMyTickets(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        Passenger passenger = (Passenger) session.getAttribute("loggedInPassenger");
        if (passenger == null) {
            redirectAttributes.addFlashAttribute("error", "Please login to view your tickets.");
            return "redirect:/passenger-login";
        }

        List<Ticket> tickets = ticketService.getTicketsByPassengerId(passenger.getPassengerId());
        model.addAttribute("tickets", tickets);
        return "my-tickets";
    }

    @GetMapping("/view-profile")
    public String showProfile(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        Passenger passenger = (Passenger) session.getAttribute("loggedInPassenger");
        if (passenger == null) {
            redirectAttributes.addFlashAttribute("error", "Please login to view your profile.");
            return "redirect:/passenger-login";
        }

        model.addAttribute("passenger", passenger);
        return "view-profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("message", "You have been logged out.");
        return "redirect:/passenger-login";
    }

    // --------------------- POST MAPPINGS ---------------------

    @PostMapping("/registerPassenger")
    public String registerPassenger(@ModelAttribute Passenger passenger, RedirectAttributes redirectAttributes) {
        Passenger saved = passengerService.savePassenger(passenger);
        if (saved != null) {
            redirectAttributes.addFlashAttribute("message", "Registration successful! Please login.");
            return "redirect:/passenger-login";
        } else {
            redirectAttributes.addFlashAttribute("error", "Registration failed. Try again.");
            return "redirect:/passenger-register";
        }
    }

    @PostMapping("/loginPassenger")
    public String loginPassenger(@RequestParam String email,
                                 @RequestParam String password,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        Passenger passenger = passengerService.getPassengerByEmailAndPassword(email, password);
        if (passenger != null) {
            session.setAttribute("loggedInPassenger", passenger);
            return "redirect:/passenger-dashboard";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid email or password.");
            return "redirect:/passenger-login";
        }
    }

    @PostMapping("/confirmTicket")
    public String confirmTicket(@RequestParam("flight.flightId") Long flightId,
                                @RequestParam("seatNumber") String seat,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {

        Passenger passenger = (Passenger) session.getAttribute("loggedInPassenger");
        if (passenger == null) {
            redirectAttributes.addFlashAttribute("error", "Please login to book a ticket.");
            return "redirect:/passenger-login";
        }

        Flight flight = flightService.getFlightById(flightId);
        if (flight == null) {
            redirectAttributes.addFlashAttribute("error", "Flight not found.");
            return "redirect:/view-flights";
        }

        Ticket ticket = new Ticket();
        ticket.setFlight(flight);
        ticket.setPassenger(passenger);
        ticket.setSeatNumber(seat);
        ticket.setStatus("Booked");
        ticket.setTravelDate(LocalDate.now().toString());
        ticket.setPrice(flight.getPrice());

        Ticket saved = ticketService.saveTicket(ticket);
        if (saved != null) {
            redirectAttributes.addFlashAttribute("message", "Ticket booked successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to book ticket.");
        }

        return "redirect:/my-tickets";
    }

    @PostMapping("/cancelTicket")
    public String cancelTicket(@RequestParam("ticketId") Long ticketId,
                               RedirectAttributes redirectAttributes) {
        try {
            ticketService.deleteTicketById(ticketId);
            redirectAttributes.addFlashAttribute("message", "Ticket cancelled successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Unable to cancel ticket. Please try again.");
        }

        return "redirect:/my-tickets";
    }
}
