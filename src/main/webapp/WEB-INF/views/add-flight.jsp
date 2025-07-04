<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add New Flight - SkyNova</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

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

    .topbar {
      position: relative;
      z-index: 2;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 16px 30px;
    }

    .topbar .btn {
      border-radius: 30px;
      font-weight: 500;
    }

    .form-container {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px 15px 60px;
      position: relative;
      z-index: 1;
    }

    .form-box {
      background-color: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(14px);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
      width: 100%;
      max-width: 600px;
      color: white;
      border: 1px solid rgba(255, 255, 255, 0.3);
    }

    h2 {
      text-align: center;
      font-weight: bold;
      margin-bottom: 30px;
      color: #ffc107;
    }

    label {
      font-weight: 600;
      margin-bottom: 5px;
    }

    .form-control {
      background-color: rgba(255, 255, 255, 0.2);
      border: none;
      color: #fff;
    }

    .form-control:focus {
      background-color: rgba(255, 255, 255, 0.35);
      color: #fff;
      box-shadow: none;
    }

    ::placeholder {
      color: #eee;
    }

    .btn-submit {
      background-color: #0d6efd;
      color: white;
      font-weight: 600;
      border: none;
      border-radius: 30px;
      padding: 12px;
      width: 100%;
      margin-top: 20px;
    }

    .btn-submit:hover {
      background-color: #0b5ed7;
    }

    @media (max-width: 768px) {
      .topbar {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }
    }
  </style>
</head>
<body>

<!-- Background Overlay -->
<div class="overlay"></div>

<!-- ✅ Topbar with only Back button -->
<div class="topbar">
  <a href="${pageContext.request.contextPath}/admin-dashboard" class="btn btn-outline-light btn-sm">
    <i class="bi bi-arrow-left-circle me-1"></i> Back to Dashboard
  </a>
</div>

<!-- ✅ Flight Form -->
<div class="form-container">
  <div class="form-box">
    <h2><i class="bi bi-plus-circle me-2"></i>Add New Flight</h2>

    <!-- ✅ SUCCESS MESSAGE ALERT -->
    <c:if test="${not empty successMessage}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    </c:if>

    <form action="saveFlight" method="post">
      <div class="mb-3">
        <label for="flightNumber">Flight Number</label>
        <input type="text" class="form-control" id="flightNumber" name="flightNumber" required>
      </div>

      <div class="mb-3">
        <label for="airlineName">Airline Name</label>
        <input type="text" class="form-control" id="airlineName" name="airlineName" required>
      </div>

      <div class="mb-3">
        <label for="source">Source City</label>
        <input type="text" class="form-control" id="source" name="source" required>
      </div>

      <div class="mb-3">
        <label for="destination">Destination City</label>
        <input type="text" class="form-control" id="destination" name="destination" required>
      </div>

      <div class="mb-3">
        <label for="departureTime">Departure Date & Time</label>
        <input type="datetime-local" class="form-control" id="departureTime" name="departureTime" required>
      </div>

      <div class="mb-3">
        <label for="arrivalTime">Arrival Date & Time</label>
        <input type="datetime-local" class="form-control" id="arrivalTime" name="arrivalTime" required>
      </div>

      <div class="mb-3">
        <label for="seats">Total Seats</label>
        <input type="number" class="form-control" id="seats" name="seats" min="10" required>
      </div>

      <div class="mb-3">
        <label for="price">Ticket Price (₹)</label>
        <input type="number" class="form-control" id="price" name="price" min="0" step="0.01" required>
      </div>

      <button type="submit" class="btn btn-submit">Add Flight</button>
    </form>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
