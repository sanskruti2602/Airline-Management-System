<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cancel Flights - SkyNova</title>
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

    .topbar {
      position: relative;
      z-index: 2;
      display: flex;
      justify-content: flex-start;
      align-items: center;
      padding: 16px 30px;
    }

    .topbar .btn {
      border-radius: 30px;
      font-weight: 500;
    }

    .page-title, .container {
      position: relative;
      z-index: 2;
    }

    .page-title {
      text-align: center;
      margin: 30px 0;
      font-size: 2.5rem;
      font-weight: 700;
      color: #ffc107;
    }

    .glass-card {
      background: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(14px);
      -webkit-backdrop-filter: blur(14px);
      border-radius: 20px;
      padding: 30px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    }

    table {
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

    .btn-cancel {
      background-color: #dc3545;
      color: white;
      font-weight: 600;
    }

    .btn-cancel:hover {
      background-color: #bb2d3b;
    }

    .alert-success {
      background-color: rgba(25, 135, 84, 0.85);
      color: white;
      border: none;
      font-weight: 600;
      border-radius: 10px;
    }

    @media (max-width: 768px) {
      .glass-card {
        padding: 20px;
      }

      .page-title {
        font-size: 1.8rem;
      }

      .topbar {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }
    }
  </style>
</head>
<body>

<!-- Overlay -->
<div class="overlay"></div>

<!-- ✅ Top Bar: Only Back Button -->
<div class="topbar">
  <a href="${pageContext.request.contextPath}/admin-dashboard" class="btn btn-outline-light btn-sm">
    <i class="bi bi-arrow-left-circle me-1"></i> Back to Dashboard
  </a>
</div>

<!-- ✅ Page Title -->
<div class="page-title"><i class="bi bi-x-circle-fill me-2"></i>Cancel Flights</div>

<!-- ✅ Success Message -->
<c:if test="${not empty cancelSuccess}">
  <div class="container mb-4">
    <div class="alert alert-success text-center">
      ✈️ Flight Cancelled Successfully!
    </div>
  </div>
</c:if>

<!-- ✅ Flights Table -->
<div class="container pb-5">
  <div class="glass-card">
    <table class="table table-hover table-borderless align-middle">
      <thead class="text-uppercase">
        <tr>
          <th>ID</th>
          <th>Flight No.</th>
          <th>Airline</th>
          <th>From</th>
          <th>To</th>
          <th>Departure</th>
          <th>Arrival</th>
          <th>Seats</th>
          <th>Price (₹)</th>
          <th>Cancel</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="f" items="${flightList}">
          <tr>
            <td>${f.flightId}</td>
            <td>${f.flightNumber}</td>
            <td>${f.airlineName}</td>
            <td>${f.source}</td>
            <td>${f.destination}</td>
            <td>${f.departureTime}</td>
            <td>${f.arrivalTime}</td>
            <td>${f.seats}</td>
            <td>${f.price}</td>
            <td>
              <form action="cancelFlight" method="post">
                <input type="hidden" name="flightId" value="${f.flightId}" />
                <button type="submit" class="btn btn-sm btn-cancel">
                  <i class="bi bi-x-circle"></i> Cancel
                </button>
              </form>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty flightList}">
          <tr>
            <td colspan="10" class="text-center">No flights available to cancel.</td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
