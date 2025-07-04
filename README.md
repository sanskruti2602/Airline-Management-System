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

## Steps to Run the Project Locally

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/airline-management-system.git
   ```

2. **Open the project in your IDE**
   - Use Eclipse or IntelliJ IDEA
   - Import the project as a **Maven Project**

3. **Install dependencies**
   - IntelliJ: Maven dependencies will auto-download
   - Eclipse: Right-click the project → Maven → Update Project

4. **Create the MySQL database**
   Open MySQL and run the following command:
   ```sql
   CREATE DATABASE airline_db;
   ```

5. **Update database configuration**

   File path: `src/main/resources/application.properties`

   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/airline_db
   spring.datasource.username=your_mysql_username
   spring.datasource.password=your_mysql_password

   spring.jpa.hibernate.ddl-auto=update
   spring.jpa.show-sql=true
   spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
   ```

6. **Run the Spring Boot application**
   - Open the main class: `AirlineManagementSystemApplication.java`
   - Right-click → Run As → Java Application

7. **Open the browser and access the application**
   ```
   http://localhost:8080
   ```

8. **Test the application**
   - Register as a passenger and book flights
   - Login as admin to manage flights, view bookings, and passengers

### Optional: Default Admin Credentials (for testing)

```txt
Username: admin  
Password: admin123
```

