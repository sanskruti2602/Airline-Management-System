<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Passenger Dashboard - SkyNova</title>
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
      min-height: 100vh;
      position: relative;
      color: white;
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

    .container, .dashboard-title {
      position: relative;
      z-index: 2;
    }

    .dashboard-title {
      font-size: 2.5rem;
      font-weight: bold;
      color: #ffc107;
      margin: 50px 0 30px;
      text-align: center;
    }

    .card {
      background: rgba(255, 255, 255, 0.12);
      backdrop-filter: blur(12px);
      color: white;
      border: 1px solid rgba(255, 255, 255, 0.2);
      border-radius: 20px;
      padding: 30px 20px;
      transition: 0.3s ease;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
    }

    .card:hover {
      transform: translateY(-6px);
      background-color: rgba(255, 255, 255, 0.18);
    }

    .card i {
      font-size: 2.5rem;
      margin-bottom: 15px;
      color: #ffffff;
    }

    .card-title {
      font-size: 1.3rem;
      font-weight: 600;
    }

    a.card-link {
      text-decoration: none;
    }

    .btn-logout, .btn-home {
      border-radius: 30px;
      font-weight: 500;
      margin-left: 10px;
    }
  </style>
</head>
<body>

<!-- Background Overlay -->
<div class="overlay"></div>

<!-- ✅ Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
  <a class="navbar-brand fw-bold" href="#">✈️ Passenger Dashboard</a>
  <div class="ms-auto d-flex">
    <a href="${pageContext.request.contextPath}/index.html" class="btn btn-outline-light btn-sm btn-home">
      <i class="bi bi-house-door-fill me-1"></i>Home
    </a>
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm btn-logout">
      Logout
    </a>
  </div>
</nav>

<!-- Dashboard Title -->
<div class="dashboard-title"><i class="bi bi-person-circle me-2"></i>Passenger Dashboard</div>

<!-- Dashboard Cards -->
<div class="container pb-5">
  <div class="row g-4 justify-content-center">

    <!-- View Available Flights -->
    <div class="col-md-4">
      <a href="${pageContext.request.contextPath}/view-flights" class="card-link">
        <div class="card text-center">
          <i class="bi bi-airplane-engines"></i>
          <div class="card-title">View Flights</div>
        </div>
      </a>
    </div>

    <!-- My Tickets -->
    <div class="col-md-4">
      <a href="${pageContext.request.contextPath}/my-tickets" class="card-link">
        <div class="card text-center">
          <i class="bi bi-journal-text"></i>
          <div class="card-title">My Tickets</div>
        </div>
      </a>
    </div>

    <!-- View Profile -->
    <div class="col-md-4">
      <a href="${pageContext.request.contextPath}/view-profile" class="card-link">
        <div class="card text-center">
          <i class="bi bi-person-circle"></i>
          <div class="card-title">My Profile</div>
        </div>
      </a>
    </div>

  </div>
</div>

</body>
</html>
