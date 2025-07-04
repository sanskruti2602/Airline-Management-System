<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap & Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

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
            background-color: rgba(0, 0, 50, 0.6);
            z-index: 0;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 2;
        }

        .container, .profile-box, .profile-title {
            position: relative;
            z-index: 2;
        }

        .profile-box {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.3);
            margin-top: 50px;
            color: white;
        }

        .profile-title {
            text-align: center;
            font-size: 2.2rem;
            font-weight: 600;
            margin-bottom: 25px;
        }

        .info-label {
            font-weight: 500;
            font-size: 1.1rem;
            margin-top: 10px;
            color: #ddd;
        }

        .info-value {
            font-size: 1.1rem;
            margin-bottom: 15px;
        }

        .icon {
            color: #ffc107;
            margin-right: 8px;
        }

        .btn-back {
            background-color: #ffc107;
            color: black;
            font-weight: 500;
            padding: 8px 25px;
            border-radius: 30px;
        }

        .btn-back:hover {
            background-color: #e0a800;
        }
    </style>
</head>
<body>

<!-- Background Overlay -->
<div class="overlay"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand fw-bold" href="#">✈️ My Profile</a>
    <div class="ms-auto">
        <a href="${pageContext.request.contextPath}/passenger-dashboard" class="btn btn-outline-light btn-sm">Back to Dashboard</a>
    </div>
</nav>

<!-- Profile Section -->
<div class="container d-flex justify-content-center">
    <div class="col-md-6 profile-box">
        <div class="profile-title">Passenger Profile</div>

        <div class="info-label"><i class="bi bi-person-circle icon"></i>Full Name</div>
        <div class="info-value">${passenger.name}</div>

        <div class="info-label"><i class="bi bi-envelope icon"></i>Email</div>
        <div class="info-value">${passenger.email}</div>

        <div class="info-label"><i class="bi bi-telephone icon"></i>Phone</div>
        <div class="info-value">${passenger.phone}</div>

		<div class="info-label"><i class="bi bi-easel2-fill icon"></i>Seat Preference</div>
        <div class="info-value">${passenger.seatPreference}</div>
    </div>
</div>

</body>
</html>
