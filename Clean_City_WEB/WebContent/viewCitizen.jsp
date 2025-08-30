<%@ page import="Clean_City_Connectivity.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page import="Clean_City_Connectivity.pojo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>View All Citizens</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

  <style>
    body {
      background-color: #f8f9fa;
      padding: 40px;
    }
    .table-container {
      background-color: #ffffff;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
    }
  </style>
</head>
<body>

<div class="container table-container">
  <h2 class="text-center mb-4 text-black">
  <i class="bi bi-people-fill me-2"></i>Citizen Records
</h2>


  <table class="table table-bordered table-striped align-middle">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Contact</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>

    <%
      try {
        Connection con = ConnectDB.getConnect();
        PreparedStatement ps = con.prepareStatement("select * from citizen");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
    %>
      <tr>
        <td><%= rs.getString(1) %></td>
        <td><%= rs.getString(2) %></td>
        <td><%= rs.getString(3) %></td>
        <td><%= rs.getString(4) %></td>
        <td><%= rs.getString(5) %></td>
      </tr>
    <%
        }
      } catch(Exception e) {
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
