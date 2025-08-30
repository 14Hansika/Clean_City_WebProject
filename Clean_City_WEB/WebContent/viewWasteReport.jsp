<%@ page import="Clean_City_Connectivity.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page import="Clean_City_Connectivity.gettersetter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>My Waste Reports</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

  <style>
    body {
      background-color: #f8f9fa;
      padding: 40px;
    }
    .container {
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
    }
    h2 {
      font-weight: 600;
    }
  </style>
</head>
<body>

<div class="container">
  <h2 class="text-center text-black mb-4">
    <i class="bi bi-file-earmark-text me-2"></i>My Submitted Waste Reports
  </h2>

  <table class="table table-bordered table-striped table-hover align-middle">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Citizen ID</th>
        <th>Location</th>
        <th>Description</th>
        <th>Date</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>

    <%
    try {
      int cid = gettersetter.getCid();
      Connection con = ConnectDB.getConnect();
      PreparedStatement ps = con.prepareStatement("select * from waste_reports where cid= ?");
      ps.setInt(1, cid);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
    %>
      <tr>
        <td><%= rs.getInt("wid") %></td>
        <td><%= rs.getInt("cid") %></td>
        <td><%= rs.getString("wlocation") %></td>
        <td><%= rs.getString("wdesc") %></td>
        <td><%= rs.getDate("wdate") %></td>
        <td><%= rs.getString("wstatus") %></td>
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
