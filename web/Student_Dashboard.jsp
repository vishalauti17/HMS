<%-- 
    Document   : Student_Dashboard
    Created on : 05-Apr-2026, 5:01:35 pm
    Author     : user5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="in.HMS.DTO.AComplaint" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard - Hostel Management</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma;
        }

        body {
            background: #f4f6f9;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: #2c3e50;
            color: white;
            position: fixed;
            height: 100vh;
            padding: 20px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar h2 span {
            color: #3498db;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 12px;
            border-radius: 5px;
        }

        .sidebar ul li a:hover {
            background: #34495e;
        }

        .active {
            background: #3498db;
        }

        /* Main */
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .top-bar {
            background: white;
            padding: 20px;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
        }

        .logout-btn {
            background: #e74c3c;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
        }

        /* Cards */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px,1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
        }

        .card h3 {
            color: #666;
        }

        .number {
            font-size: 28px;
            font-weight: bold;
        }

        /* Table */
        .table-section {
            margin-top: 30px;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        .status {
            padding: 5px 10px;
            border-radius: 5px;
        }

        .paid {
            background: #d4edda;
            color: green;
        }

        .pending {
            background: #fff3cd;
            color: #856404;
        }

        button {
            padding: 8px 15px;
            background: #3498db;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .btn-container {
    margin-top: 15px;
}

.btn {
    display: inline-block;
    padding: 10px 18px;
    background: #3498db;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
    transition: 0.3s;
}

.btn:hover {
    background: #2980b9;
}

    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Student<span>Panel</span></h2>
    <ul>
        <li><a href="Student_Dashboard.jsp" class="active">Dashboard</a></li>
        <li><a href="AComplaintDAO.java">Complaints</a></li>
    </ul>
</div>

<!-- Main -->
<div class="main-content">

    <div class="top-bar">
        <h2>Welcome, Student</h2>
        <a href="index.jsp" class="logout-btn">Logout</a>
    </div>

    <!-- Cards -->
    <div class="cards">
        <div class="card">
            <h3>Room Number</h3>
            <div class="number">${roomNo}</div>
        </div>

        <div class="card">
            <h3>Fee Status</h3>
             <div class="number">
              ${sessionScope.fee}
             
       </div>
        </div>
    </div>

    <!-- Complaint Section -->
    <div class="table-section">
        <h3>My Complaints</h3>

        <table>
        <tr>
            <th>Complaint</th>
            <th>Status</th>
        </tr>

<%
    List<AComplaint> list = (List<AComplaint>) request.getAttribute("complaints");

    if (list != null && !list.isEmpty()) {
       
        for (AComplaint c : list) {
%>
        <tr>
            <td><%= c.getComplaint() %></td>

            <td>
                <span class="status <%= c.getStatus().equalsIgnoreCase("Pending") ? "pending" : "paid" %>">
                    <%= c.getStatus() %>
                </span>
            </td>
        </tr>
<%
        }
    } 
%>
       
    </table>
        <br>
        <div class="btn-container">
          <a href="AddComplaint.jsp" class="btn">Add Complaint</a>
        </div>  
    </div>

</div>

</body>
</html>

