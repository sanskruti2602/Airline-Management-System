<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Delete Passengers - SkyNova</title>
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
      margin: 40px 0 30px;
      font-size: 2.5rem;
      font-weight: 700;
      color: #ffc107;
    }

    .glass-table {
      background: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 16px;
      padding: 30px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
      margin-bottom: 40px;
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

    .btn-delete {
      background-color: #dc3545;
      color: white;
      font-weight: 600;
      border-radius: 30px;
      padding: 6px 16px;
      border: none;
    }

    .btn-delete:hover {
      background-color: #bb2d3b;
    }

    @media (max-width: 768px) {
      .glass-table {
        padding: 15px;
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

<!-- ✅ Top Bar -->
<div class="topbar">
  <a href="${pageContext.request.contextPath}/admin-dashboard" class="btn btn-outline-light btn-sm">
    <i class="bi bi-arrow-left-circle me-1"></i> Back to Dashboard
  </a>
</div>

<!-- Page Title -->
<div class="page-title"><i class="bi bi-person-x-fill me-2"></i>Delete Passengers</div>

<!-- Passenger Table -->
<div class="container">
  <div class="glass-table">
    <table class="table table-hover table-borderless align-middle">
      <thead class="text-uppercase">
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Mobile</th>
          <th>Gender</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="p" items="${passengerList}">
          <tr>
            <td>${p.passengerId}</td>
            <td>${p.name}</td>
            <td>${p.email}</td>
            <td>${p.phone}</td>
            <td>${p.gender}</td>
            <td>
              <a href="delete-passenger?id=${p.passengerId}" class="btn btn-sm btn-delete">
                <i class="bi bi-trash-fill"></i> Delete
              </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
