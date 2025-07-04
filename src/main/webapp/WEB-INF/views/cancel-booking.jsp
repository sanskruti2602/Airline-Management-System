<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Cancel Bookings - Admin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap 5 -->
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
      padding-top: 50px;
      padding-bottom: 50px;
    }

    .card-glass {
      background-color: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      color: #fff;
      border-radius: 20px;
      padding: 30px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    }

    table {
      color: #fff;
    }

    thead {
      background-color: rgba(13, 110, 253, 0.6);
    }

    .btn-cancel {
      background-color: #dc3545;
      color: white;
      border: none;
      padding: 6px 14px;
      border-radius: 20px;
      font-weight: 500;
    }

    .btn-cancel:hover {
      background-color: #bb2d3b;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-weight: bold;
    }
  </style>
</head>
<body>

<div class="overlay"></div>

<div class="container">
  <div class="card-glass">
    <h2><i class="bi bi-x-circle me-2"></i>Cancel Bookings</h2>

    <c:if test="${not empty cancelMessage}">
      <div class="alert alert-success text-center">${cancelMessage}</div>
    </c:if>

    <div class="table-responsive">
      <table class="table table-bordered table-hover align-middle text-center">
        <thead>
          <tr>
            <th>#</th>
            <th>Passenger</th>
            <th>Flight No.</th>
            <th>Route</th>
            <th>Seat</th>
            <th>Date</th>
            <th>Status</th>
            <th>Price</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="ticket" items="${ticketList}" varStatus="loop">
            <tr>
              <td>${loop.index + 1}</td>
              <td>${ticket.passenger.name}</td>
              <td>${ticket.flight.flightNumber}</td>
              <td>${ticket.flight.source} → ${ticket.flight.destination}</td>
              <td>${ticket.seatNumber}</td>
              <td>${ticket.travelDate}</td>
              <td>${ticket.status}</td>
              <td>₹${ticket.price}</td>
              <td>
                <form action="cancel-booking" method="post" onsubmit="return confirm('Are you sure you want to cancel this ticket?');">
                  <input type="hidden" name="ticketId" value="${ticket.ticketId}" />
                  <button type="submit" class="btn btn-cancel btn-sm">Cancel</button>
                </form>
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
