<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Update Flights - SkyNova</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap & Fonts -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

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

    label {
      font-weight: 600;
      margin-top: 10px;
    }

    .form-control {
      background-color: rgba(255, 255, 255, 0.1);
      color: white;
      border: none;
    }

    .form-control:focus {
      background-color: rgba(255, 255, 255, 0.15);
      color: white;
    }

    .btn-edit {
      background-color: #ffc107;
      color: #000;
      font-weight: 600;
    }

    .btn-edit:hover {
      background-color: #e0a800;
    }

    .btn-update {
      background-color: #198754;
      color: white;
      font-weight: 600;
      margin-top: 15px;
    }

    .btn-update:hover {
      background-color: #157347;
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
        gap: 10px;
      }
    }
  </style>
</head>
<body>

<!-- Overlay -->
<div class="overlay"></div>

<!-- ✅ Top Bar with only Back -->
<div class="topbar">
  <a href="${pageContext.request.contextPath}/admin-dashboard" class="btn btn-outline-light btn-sm">
    <i class="bi bi-arrow-left-circle me-1"></i> Back to Dashboard
  </a>
</div>

<!-- Page Title -->
<div class="page-title"><i class="bi bi-pencil-square me-2"></i>Update Flights</div>

<!-- Flights Table -->
<div class="container pb-5">
  <div class="glass-card mb-5">
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
          <th>Action</th>
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
              <a href="edit-flight?id=${f.flightId}" class="btn btn-sm btn-edit">
                <i class="bi bi-pencil-square"></i> Edit
              </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Edit Form Section -->
  <c:if test="${not empty selectedFlight}">
    <div class="glass-card">
      <h4 class="mb-4 text-warning"><i class="bi bi-pen"></i> Edit Flight Details</h4>
      <form action="updateFlight" method="post">
        <input type="hidden" name="flightId" value="${selectedFlight.flightId}" />

        <div class="row">
          <div class="col-md-6">
            <label>Flight Number</label>
            <input type="text" class="form-control" name="flightNumber" value="${selectedFlight.flightNumber}" required />
          </div>
          <div class="col-md-6">
            <label>Airline Name</label>
            <input type="text" class="form-control" name="airlineName" value="${selectedFlight.airlineName}" required />
          </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <label>Source</label>
            <input type="text" class="form-control" name="source" value="${selectedFlight.source}" required />
          </div>
          <div class="col-md-6">
            <label>Destination</label>
            <input type="text" class="form-control" name="destination" value="${selectedFlight.destination}" required />
          </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <label>Departure Time</label>
            <input type="datetime-local" class="form-control" name="departureTime" value="${selectedFlight.departureTime}" required />
          </div>
          <div class="col-md-6">
            <label>Arrival Time</label>
            <input type="datetime-local" class="form-control" name="arrivalTime" value="${selectedFlight.arrivalTime}" required />
          </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <label>Total Seats</label>
            <input type="number" class="form-control" name="seats" value="${selectedFlight.seats}" min="10" required />
          </div>
          <div class="col-md-6">
            <label>Price (₹)</label>
            <input type="number" class="form-control" name="price" value="${selectedFlight.price}" min="0" step="0.01" required />
          </div>
        </div>

        <button type="submit" class="btn btn-update mt-3">Update Flight</button>
      </form>
    </div>
  </c:if>
</div>

</body>
</html>
