<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Book Your Ticket</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap & Fonts -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet" />

  <style>
    body {
      font-family: 'Quicksand', sans-serif;
      background: url('https://wallpaperaccess.com/full/254381.jpg') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      color: white;
      position: relative;
    }

    .overlay {
      position: absolute;
      inset: 0;
      background-color: rgba(0, 0, 50, 0.7);
      z-index: 0;
    }

    .navbar {
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 2;
    }

    .container, .booking-box {
      position: relative;
      z-index: 2;
    }

    .booking-box {
      background: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(12px);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.3);
      color: white;
      margin-top: 50px;
      width: 100%;
    }

    .flight-info {
      background: rgba(255, 255, 255, 0.1);
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 30px;
      font-size: 1rem;
      line-height: 1.6;
    }

    .form-control {
      background-color: rgba(255, 255, 255, 0.2);
      color: white;
      border: none;
    }

    .form-control:focus {
      background-color: rgba(255, 255, 255, 0.3);
      color: white;
      box-shadow: none;
    }

    ::placeholder {
      color: #eee;
    }

    .btn-custom {
      background-color: #adb5bd;
      color: black;
      font-weight: 600;
      padding: 10px 25px;
      border-radius: 30px;
      width: 100%;
      border: none;
    }

    .btn-custom:hover {
      background-color: #6c757d;
      color: white;
    }

    @media (max-width: 768px) {
      .booking-box {
        padding: 25px;
      }
    }
  </style>
</head>
<body>

<!-- Overlay -->
<div class="overlay"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
  <a class="navbar-brand fw-bold" href="#">✈️ Book Ticket</a>
  <div class="ms-auto">
    <a href="${pageContext.request.contextPath}/view-flights" class="btn btn-outline-light btn-sm rounded-pill">Back</a>
  </div>
</nav>

<!-- Booking Form -->
<div class="container d-flex justify-content-center">
  <div class="col-md-8 booking-box">
    <h2 class="text-center mb-4">Flight Booking</h2>

    <!-- Flight Info -->
    <div class="flight-info">
      <p><strong>Flight:</strong> ${flight.source} → ${flight.destination}</p>
      <p><strong>Airline:</strong> ${flight.airlineName} &nbsp; | &nbsp; <strong>Flight No.:</strong> ${flight.flightNumber}</p>
      <p><strong>Departure:</strong> ${flight.departureTime} &nbsp; | &nbsp; <strong>Arrival:</strong> ${flight.arrivalTime}</p>
      <p><strong>Price:</strong> ₹${flight.price}</p>
    </div>

    <!-- Booking Form -->
    <form action="${pageContext.request.contextPath}/confirmTicket" method="post">
      <input type="hidden" name="flight.flightId" value="${flight.flightId}" />

      <div class="mb-3">
        <select class="form-control" name="seatNumber" required>
          <option value="">Select Seat Preference</option>
          <option>Window</option>
          <option>Aisle</option>
          <option>Middle</option>
        </select>
      </div>

      <button type="submit" class="btn btn-custom mt-3">Confirm Booking</button>
    </form>
  </div>
</div>

</body>
</html>
