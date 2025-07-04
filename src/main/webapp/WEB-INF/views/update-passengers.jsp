<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update Passengers - SkyNova</title>
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

    .passenger-table, .form-section {
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

    .btn-edit {
      background-color: #ffc107;
      color: black;
      font-weight: 600;
      border-radius: 30px;
      padding: 5px 16px;
    }

    .btn-edit:hover {
      background-color: #e0a800;
    }

    .btn-update {
      background-color: #198754;
      color: white;
      font-weight: 600;
      margin-top: 15px;
      border-radius: 30px;
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

    @media (max-width: 768px) {
      .page-title {
        font-size: 1.8rem;
      }

      .passenger-table, .form-section {
        padding: 15px;
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

<!-- ✅ Topbar with Back to Dashboard -->
<div class="topbar">
  <a href="${pageContext.request.contextPath}/admin-dashboard" class="btn btn-outline-light btn-sm">
    <i class="bi bi-arrow-left-circle me-1"></i> Back to Dashboard
  </a>
</div>

<!-- Page Title -->
<div class="page-title"><i class="bi bi-person-lines-fill me-2"></i>Manage Passengers</div>

<!-- 📋 Passenger Table -->
<div class="container">
  <div class="passenger-table">
    <table class="table table-hover table-borderless align-middle">
      <thead class="text-uppercase">
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Mobile</th>
          <th>Gender</th>
          <th>Action</th>
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
              <a href="update-passenger?id=${p.passengerId}" class="btn btn-sm btn-edit">
                <i class="bi bi-pencil-square"></i> Edit
              </a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- ✏️ Edit Passenger Form -->
  <c:if test="${not empty selectedPassenger}">
    <div class="form-section">
      <h4>Edit Passenger Details</h4>
      <form action="${pageContext.request.contextPath}/update-passenger" method="post">
        <input type="hidden" name="passengerId" value="${selectedPassenger.passengerId}" />

        <div class="row">
          <div class="col-md-6">
            <label>Name</label>
            <input type="text" name="name" class="form-control" value="${selectedPassenger.name}" required />
          </div>
          <div class="col-md-6">
            <label>Email</label>
            <input type="email" name="email" class="form-control" value="${selectedPassenger.email}" required />
          </div>
        </div>

        <div class="row">
          <div class="col-md-6">
            <label>Mobile</label>
            <input type="text" name="phone" class="form-control" value="${selectedPassenger.phone}" required />
          </div>
          <div class="col-md-6">
            <label>Gender</label>
            <input type="text" name="gender" class="form-control" value="${selectedPassenger.gender}" required />
          </div>
        </div>

        <button type="submit" class="btn btn-update">Update Passenger</button>
      </form>
    </div>
  </c:if>
</div>

</body>
</html>
