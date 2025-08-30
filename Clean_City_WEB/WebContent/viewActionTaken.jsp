<%@ page import="java.sql.*" %>
<%@ page import="Clean_City_Connectivity.ConnectDB" %>
<%@ page import="Clean_City_Connectivity.pojo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>All Waste Report Status - Municipality View</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            padding: 40px;
        }
        .table-container {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container table-container">
    <h2 class="mb-4 text-center text-primary">
        <i class="bi bi-clipboard2-data-fill me-2"></i>All Waste Reports & Actions (Municipality View)
    </h2>

<%
    String wname = pojo.getWname();  // Get the name to filter by
    out.println("<p class='text-muted'><strong>Debug:</strong> wname from pojo = '" + wname + "'</p>");

    if (wname == null || wname.trim().isEmpty()) {
        out.println("<div class='alert alert-danger'>Error: 'wname' is null or empty.</div>");
    } else {
%>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th>Report ID</th>
                    <th>Citizen ID</th>
                    <th>Location</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>

<%
        boolean found = false;
        try (Connection con = ConnectDB.getConnect();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM waste_reports WHERE wname = ?")) {

            ps.setString(1, wname);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                found = true;
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

            if (!found) {
%>
                <tr><td colspan="6" class="text-center text-danger">No records found for: <%= wname %></td></tr>
<%
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger'>Error fetching data: " + e.getMessage() + "</div>");
        }
    } // End of else block
%>
            </tbody>
        </table>
    </div>

    <div class="text-center btn-back">
        <a href="citizenDashboard.html" class="btn btn-secondary">
            <i class="bi bi-arrow-left-circle me-1"></i>Back to Dashboard
        </a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
