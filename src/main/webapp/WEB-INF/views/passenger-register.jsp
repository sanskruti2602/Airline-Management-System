<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Passenger Registration</title>
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
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      z-index: 1;
    }

    .register-box {
      background-color: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(14px);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
      width: 100%;
      max-width: 480px;
      color: white;
      border: 1px solid rgba(255, 255, 255, 0.3);
    }

    h2 {
      text-align: center;
      font-weight: 700;
      margin-bottom: 30px;
    }

    .form-control,
    select.form-control {
      background-color: rgba(255, 255, 255, 0.3);
      color: #fff;
      border: none;
    }

    .form-control:focus,
    select.form-control:focus {
      background-color: rgba(255, 255, 255, 0.5);
      color: #fff;
      box-shadow: none;
    }

    ::placeholder {
      color: #eee;
    }

    .btn-submit {
      background-color: #0d6efd;
      color: #fff;
      border: none;
      padding: 12px;
      width: 100%;
      font-weight: 600;
      border-radius: 30px;
      transition: 0.3s ease;
    }

    .btn-submit:hover {
      background-color: #0b5ed7;
    }

    .text-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      color: #ddd;
      text-decoration: none;
    }

    .text-link:hover {
      color: #fff;
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="overlay"></div>

<div class="container">
  <div class="register-box">
    <h2><i class="bi bi-person-plus-fill me-2"></i>Passenger Registration</h2>

    <form action="registerPassenger" method="post">
      <div class="mb-3">
        <input type="text" name="name" class="form-control" placeholder="Full Name" required />
      </div>
      <div class="mb-3">
        <input type="email" name="email" class="form-control" placeholder="Email" required />
      </div>
      <div class="mb-3">
        <input type="text" name="phone" class="form-control" placeholder="Phone Number" required />
      </div>
      <div class="mb-3">
        <input type="password" name="password" class="form-control" placeholder="Password" required />
      </div>

      <!-- ✅ Seat Preference Dropdown (Clear Style) -->
      <div class="mb-3">
        <select name="seatPreference" class="form-control" required>
          <option value="">Select Seat Preference</option>
          <option>Window</option>
          <option>Aisle</option>
          <option>Middle</option>
        </select>
      </div>

      <!-- ✅ Gender Dropdown -->
      <div class="mb-3">
        <select name="gender" class="form-control" required>
          <option value="">Select Gender</option>
          <option>Female</option>
          <option>Male</option>
          <option>Other</option>
        </select>
      </div>

      <button type="submit" class="btn btn-submit">Register</button>
    </form>

    <a href="${pageContext.request.contextPath}/passenger-login" class="text-link">
      Already have an account? Login here →
    </a>
  </div>
</div>

</body>
</html>
