<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Available Flights</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap & Fonts -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Quicksand', sans-serif;
      margin: 0;
      padding: 0;
      background: url('https://wallpaperaccess.com/full/254381.jpg') no-repeat center center fixed;
      background-size: cover;
      color: white;
      min-height: 100vh;
      position: relative;
    }

    .overlay {
      position: absolute;
      inset: 0;
      background-color: rgba(0, 0, 50, 0.7);
      z-index: 0;
    }

    .navbar {
      background-color: rgba(0, 0, 0, 0.7);
      z-index: 2;
    }

    .page-title, .container {
      position: relative;
      z-index: 2;
    }

    .page-title {
      text-align: center;
      margin: 50px 0 30px;
      font-size: 2.5rem;
      font-weight: 700;
    }

    .flight-table {
      background: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 16px;
      padding: 30px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    }

    table {
      background: transparent !important;
      color: white;
    }

    th {
      background-color: rgba(255, 255, 255, 0.15);
      font-weight: 600;
      color: #ffc107;
    }

    tbody tr:hover {
      background-color: rgba(255, 255, 255, 0.07);
    }

    .btn-book {
      background-color: #adb5bd; /* grey button */
      color: black;
      font-weight: 600;
      border-radius: 30px;
      padding: 6px 18px;
      border: none;
    }

    .btn-book:hover {
      background-color: #6c757d;
      color: white;
    }

    .btn-back {
      border-radius: 30px;
      font-weight: 500;
    }

    @media (max-width: 768px) {
      .flight-table {
        padding: 15px;
      }

      .page-title {
        font-size: 1.8rem;
      }
    }
  </style>
</head>
<body>

<!-- Overlay -->
<div class="overlay"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
  <a class="navbar-brand fw-bold" href="#">✈️ Available Flights</a>
  <div class="ms-auto">
    <a href="${pageContext.request.contextPath}/passenger-dashboard" class="btn btn-outline-light btn-sm btn-back">Back to Dashboard</a>
  </div>
</nav>

<!-- Page Title -->
<div class="page-title">Explore Flights</div>

<!-- Flight Table -->
<div class="container pb-5">
  <div class="flight-table">
    <table class="table table-hover table-borderless align-middle">
      <thead class="text-uppercase">
        <tr>
          <th>Flight No.</th>
          <th>From → To</th>
          <th>Departure</th>
          <th>Arrival</th>
          <th>Price (₹)</th>
          <th>Book</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="flight" items="${flightList}">
          <tr>
            <td>${flight.flightNumber}</td>
            <td>${flight.source} → ${flight.destination}</td>
            <td>${flight.departureTime}</td>
            <td>${flight.arrivalTime}</td>
            <td><strong>₹${flight.price}</strong></td>
            <td>
              <form action="${pageContext.request.contextPath}/book-ticket" method="get">
                <input type="hidden" name="flightId" value="${flight.flightId}" />
                <button type="submit" class="btn btn-book btn-sm">Book</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
