<%@ page import="Clean_City_Connectivity.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page import="Clean_City_Connectivity.pojo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>View Municipality Officers</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

  <style>
    body {
      background-color: #f1f3f5;
      padding: 40px;
    }
    .container {
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    }
    h2 {
      font-weight: 600;
      margin-bottom: 25px;
    }
  </style>
</head>
<body>

<div class="container">
  <h2 class="text-center text-black mb-4">
    <i class="bi bi-person-gear me-2"></i>Municipality Officers List
  </h2>

  <table class="table table-striped table-bordered table-hover align-middle">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Zone</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Remove</th>
      </tr>
    </thead>
    <tbody>

    <%
    try {
      Connection con = ConnectDB.getConnect();
      PreparedStatement ps = con.prepareStatement("select * from municipality");
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
    %>
      <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
        <td>
          <a href="deleteOfficers.jsp?mid=<%= rs.getInt(1) %>" class="btn btn-danger btn-sm">
            <i class="bi bi-trash-fill"></i> Remove
          </a>
        </td>
      </tr>
    <%
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    %>

    </tbody>
  </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
