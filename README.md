# Airline Management System - SkyNova

The Airline Management System (SkyNova) is a full-stack web application built using Spring Boot, JSP, and MySQL. It allows passengers to search and book flights, and administrators to manage flights, bookings, and passengers through a secure dashboard.

---

## Technologies Used

- **Backend**: Spring Boot, Spring MVC
- **Frontend**: JSP, HTML, CSS, Bootstrap
- **Database**: MySQL
- **ORM**: Hibernate / JPA
- **Build Tool**: Maven
- **IDE**: Eclipse / IntelliJ

---

## Features

### Admin Functionalities

- Admin login authentication
- Add new flights with detailed information
- Edit or delete existing flights
- View all flights in the system
- View all registered passengers
- View all bookings with current status (Confirmed, Pending, Cancelled)

### Passenger Functionalities

- Passenger registration and login
- Search flights by source, destination, and date
- Book flight tickets
- View personal bookings
- Cancel bookings with real-time status update

---

## Booking Workflow

1. Passenger registers or logs in.
2. Searches flights by source, destination, and date.
3. Selects a flight and books a ticket.
4. Booking is stored with default status.
5. Admin can view or update the booking status.
6. Passenger may cancel the booking, which updates the status and shows a confirmation message.

---

## Database Schema

- **Admin**: Stores admin credentials
- **Passenger**: Stores passenger registration details
- **Flight**: Flight information including source, destination, and timings
- **Booking**: Booking details with status and relation to passenger and flight

---

## JSP Pages Included

### Passenger Pages

- `index.html` – Landing page with links to login/register/admin access
- `passenger-register.jsp` – Form for passenger signup
- `passenger-login.jsp` – Form for passenger login
- `search-flights.jsp` – Search for flights
- `my-bookings.jsp` – View bookings of logged-in passenger
- `cancel-booking.jsp` – Cancel a booking with confirmation message

### Admin Pages

- `admin-login.jsp` – Login form for admin
- `admin-dashboard.jsp` – Admin dashboard with navigation
- `add-flight.jsp` – Add a new flight to the system
- `view-flights.jsp` – View and manage all flights
- `edit-flight.jsp` – Update flight details
- `view-passengers.jsp` – View list of all passengers
- `view-bookings.jsp` – View all bookings with their status

---

## UI and Design

- Built with Bootstrap for responsive and clean UI
- Google Fonts (Quicksand) used for modern typography
- Consistent blue and white theme across all pages
- Cards and buttons styled for a professional look
- Navigation bar with clear module links

---

## How to Run the Project

1. Clone the repository:
