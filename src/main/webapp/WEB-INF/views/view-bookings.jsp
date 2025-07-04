<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>View Bookings - Admin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet" />
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Quicksand', sans-serif;
      background: url('https://wallpaperaccess.com/full/254381.jpg') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
    }

    .overlay {
      position: absolute;
      inset: 0;
      background-color: rgba(0, 0, 50, 0.6);
      z-index: 0;
    }

    .container {
      position: relative;
      z-index: 1;
      padding: 60px 20px;
    }

    .card-glass {
      background-color: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(14px);
      padding: 20px;
      border-radius: 20px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
      color: white;
      border: 1px solid rgba(255, 255, 255, 0.3);
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-weight: 700;
      color: white;
    }

    table {
      color: white;
    }

    th {
      background-color: rgba(13, 110, 253, 0.8);
      color: #fff;
    }

    tr td {
      background-color: rgba(255, 255, 255, 0.1);
    }

    .btn-cancel {
      background-color: #dc3545;
      color: white;
      border: none;
      padding: 6px 12px;
      border-radius: 8px;
      font-size: 14px;
    }

    .btn-cancel:hover {
      background-color: #c82333;
    }
  </style>
</head>
<body>

<div class="overlay"></div>

<div class="container">
  <div class="card-glass">
    <h2><i class="bi bi-ticket-detailed me-2"></i>All Bookings</h2>

    <c:if test="${not empty message}">
      <div class="alert alert-success">${message}</div>
    </c:if>
    <c:if test="${not empty error}">
      <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="table-responsive">
      <table class="table table-hover table-bordered align-middle text-center">
        <thead>
          <tr>
            <th>Booking ID</th>
            <th>Passenger</th>
            <th>Flight</th>
            <th>Seat</th>
            <th>Date</th>
            <th>Status</th>
            <th>Price</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="ticket" items="${ticketList}">
          <tr>
            <td>${ticket.ticketId}</td>
            <td>${ticket.passenger.name}</td>
            <td>${ticket.flight.flightNumber} (${ticket.flight.source} → ${ticket.flight.destination})</td>
            <td>${ticket.seatNumber}</td>
            <td>${ticket.travelDate}</td>
            <td>${ticket.status}</td>
            <td>₹${ticket.price}</td>
            <td>
              <a href="cancel-booking?ticketId=${ticket.ticketId}" class="btn btn-cancel" onclick="return confirm('Cancel this booking?');">
                Cancel
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

</body>
</html>
