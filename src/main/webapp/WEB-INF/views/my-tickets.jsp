<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Booked Tickets</title>
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
            background-color: rgba(0, 0, 50, 0.7);
            z-index: 0;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 2;
        }

        .container, .ticket-table, .page-title {
            position: relative;
            z-index: 2;
        }

        .page-title {
            text-align: center;
            margin: 40px 0 20px;
            font-size: 2.5rem;
            font-weight: 600;
        }

        .ticket-table {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.3);
        }

        table {
            color: white;
        }

        th {
            background-color: rgba(13, 110, 253, 0.2);
        }

        .btn-cancel {
            background-color: #dc3545;
            color: white;
            border-radius: 30px;
            padding: 5px 15px;
            border: none;
        }

        .btn-cancel:hover {
            background-color: #bb2d3b;
        }

        .alert {
            margin: 20px auto;
            width: 90%;
            text-align: center;
            z-index: 2;
        }

        .text-center.fs-4 {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 20px;
        }
    </style>
</head>
<body>

<!-- Overlay -->
<div class="overlay"></div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark px-4">
    <a class="navbar-brand fw-bold" href="#">✈️ My Tickets</a>
    <div class="ms-auto">
        <a href="${pageContext.request.contextPath}/passenger-dashboard" class="btn btn-outline-light btn-sm">Back to Dashboard</a>
    </div>
</nav>

<!-- Title -->
<div class="page-title">My Booked Tickets</div>

<!-- Alert messages -->
<c:if test="${not empty message}">
    <div class="alert alert-success">${message}</div>
</c:if>

<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>

<!-- Ticket Table -->
<div class="container pb-5">
    <c:choose>
        <c:when test="${not empty tickets}">
            <div class="ticket-table">
                <table class="table table-hover table-borderless align-middle">
                    <thead class="text-uppercase">
                        <tr>
                            <th>Ticket ID</th>
                            <th>Flight</th>
                            <th>Date</th>
                            <th>Seat</th>
                            <th>Status</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="ticket" items="${tickets}">
                            <tr>
                                <td>${ticket.ticketId}</td>
                                <td>${ticket.flight.source} → ${ticket.flight.destination}</td>
                                <td>${ticket.travelDate}</td>
                                <td>${ticket.seatNumber}</td>
                                <td>${ticket.status}</td>
                                <td>₹${ticket.price}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cancelTicket" method="post">
                                        <input type="hidden" name="ticketId" value="${ticket.ticketId}">
                                        <button class="btn btn-cancel btn-sm" type="submit">Cancel</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <div class="text-center fs-4 mt-4">You have no tickets booked yet.</div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
