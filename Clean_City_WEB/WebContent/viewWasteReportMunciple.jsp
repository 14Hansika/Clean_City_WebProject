<%@ page import="Clean_City_Connectivity.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page import="Clean_City_Connectivity.pojo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Waste Reports</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

  <style>
    body {
      background: linear-gradient(to right, #f1f2f6, #dcdde1);
      padding: 40px;
      font-family: 'Segoe UI', sans-serif;
    }

    .container {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-weight: 600;
      color: #2c3e50;
    }

    .btn-approve {
      background-color: #28a745;
      color: white;
    }

    .btn-disapprove {
      background-color: #dc3545;
      color: white;
    }

    .table th, .table td {
      vertical-align: middle;
    }

    a.btn-back {
      margin-top: 20px;
    }
  </style>
</head>
<body>

<div class="container">
  <h2><i class="bi bi-folder-check"></i> All Waste Reports</h2>

  <table class="table table-bordered table-hover table-striped">
    <thead class="table-dark">
      <tr>
        <th>ID</th>
        <th>Citizen ID</th>
        <th>Location</th>
        <th>Description</th>
        <th>Date</th>
        <th>Status</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <%
        try {
            Connection con = ConnectDB.getConnect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM waste_reports");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int wid = rs.getInt("wid");
                String status = rs.getString("wstatus");
      %>
      <tr>
        <td><%= wid %></td>
        <td><%= rs.getInt("cid") %></td>
        <td><%= rs.getString("wlocation") %></td>
        <td><%= rs.getString("wdesc") %></td>
        <td><%= rs.getDate("wdate") %></td>
        <td><%= status %></td>
        <td>
          <% if ("Pending".equalsIgnoreCase(status)) { %>
            <form action="UpdateStatusServlet" method="post" style="display:inline;">
                <input type="hidden" name="wid" value="<%= wid %>" />
                <input type="hidden" name="action" value="Approved" />
                <button type="submit" class="btn btn-sm btn-approve me-1">
                  <i class="bi bi-check-circle-fill"></i> Approve
                </button>
            </form>
            <form action="UpdateStatusServlet" method="post" style="display:inline;">
                <input type="hidden" name="wid" value="<%= wid %>" />
                <input type="hidden" name="action" value="Disapproved" />
                <button type="submit" class="btn btn-sm btn-disapprove">
                  <i class="bi bi-x-circle-fill"></i> Disapprove
                </button>
            </form>
          <% } else { %>
            <span class="text-muted"><i class="bi bi-check2-square"></i> Action Taken</span>
          <% } %>
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

  <a href="index.html" class="btn btn-secondary btn-back">
    <i class="bi bi-arrow-left-circle"></i> Go Back
  </a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
