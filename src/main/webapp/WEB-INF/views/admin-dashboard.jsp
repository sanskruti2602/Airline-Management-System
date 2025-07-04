<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin Dashboard - SkyNova</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Google Font -->
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

    .navbar {
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 2;
    }

    .dashboard-container {
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      position: relative;
      z-index: 1;
      padding: 40px 15px;
    }

    .dashboard-title {
      font-size: 2.5rem;
      font-weight: bold;
      color: #ffc107;
      margin-bottom: 40px;
      text-align: center;
    }

    .section-grid {
      display: flex;
      gap: 40px;
      flex-wrap: wrap;
      justify-content: center;
      max-width: 1100px;
      width: 100%;
    }

    .section-card {
      flex: 1 1 450px;
      background-color: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      padding: 30px;
      border-radius: 20px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
      color: white;
      text-align: center;
      border: 1px solid rgba(255, 255, 255, 0.2);
      max-width: 500px;
    }

    .section-card h4 {
      margin-bottom: 20px;
      font-size: 1.6rem;
      color: #0d6efd;
    }

    .section-card i {
      font-size: 2.2rem;
      margin-bottom: 15px;
      color: #ffc107;
    }

    .btn-sub {
      background-color: #dee2e6;
      color: #000;
      font-weight: 600;
      border-radius: 30px;
      padding: 10px 20px;
      margin: 6px 0;
      border: none;
      width: 100%;
      transition: 0.3s ease;
    }

    .btn-sub:hover {
      background-color: #ced4da;
    }

    @media (max-width: 768px) {
      .section-card {
        flex: 1 1 100%;
      }
    }
  </style>
</head>
<body>

<div class="overlay"></div>

<!-- ✅ Navbar with Back to Home -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
  <a class="navbar-brand fw-bold" href="#">🛠 Admin Dashboard</a>
  <div class="ms-auto">
    <a href="${pageContext.request.contextPath}/index.html" class="btn btn-outline-light btn-sm">
      <i class="bi bi-house-door-fill me-1"></i>Back to Home
    </a>
  </div>
</nav>

<!-- ✅ Main Dashboard Content -->
<div class="dashboard-container">
  <div class="dashboard-title"><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</div>

  <div class="section-grid">
    <!-- Flight Management -->
    <div class="section-card">
      <i class="bi bi-airplane-engines"></i>
      <h4>Flight Management</h4>
      <a href="add-flight" class="btn btn-sub">Add New Flight</a>
      <a href="update-flights" class="btn btn-sub">Update Flights</a>
      <a href="cancel-flight" class="btn btn-sub">Cancel Flights</a>
    </div>

    <!-- Passenger Management -->
    <div class="section-card">
      <i class="bi bi-people-fill"></i>
      <h4>Passenger Management</h4>
      <a href="/view-passengers" class="btn btn-sub">View Passengers</a>
      <a href="/update-passengers" class="btn btn-sub">Update Passenger</a>
      <a href="/delete-passengers" class="btn btn-sub">Delete Passenger</a>
    </div>

    <!-- ✅ Booking Management -->
    <div class="section-card">
      <i class="bi bi-ticket-detailed-fill"></i>
      <h4>Booking Management</h4>
      <a href="/view-bookings" class="btn btn-sub">View Bookings</a>
      <a href="/cancel-booking" class="btn btn-sub">Cancel Bookings</a>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
