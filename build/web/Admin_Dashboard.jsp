<%-- 
    Document   : Admin_Dashaboard
    Created on : 03-Apr-2026, 10:41:16 am
    Author     : user5
--%>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.*" %>
<%@ page import="in.HMS.DTO.AComplaint" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Hostel Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
            padding-bottom: 20px;
            border-bottom: 1px solid #34495e;
        }

        .sidebar h2 span {
            color: #3498db;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            padding: 12px 15px;
            display: block;
            border-radius: 5px;
            transition: 0.3s;
        }

        .sidebar ul li a:hover {
            background: #34495e;
        }

        .sidebar ul li a.active {
            background: #3498db;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        /* Top Bar */
        .top-bar {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .welcome h1 {
            color: #333;
            font-size: 24px;
        }

        .welcome p {
            color: #666;
            margin-top: 5px;
        }

        .logout-btn {
            background: #e74c3c;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        /* Cards */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .card h3 {
            color: #666;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .card .number {
            font-size: 32px;
            font-weight: bold;
            color: #2c3e50;
        }

        /* Tables */
        .table-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .table-section h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th {
            background: #f8f9fa;
            padding: 12px;
            text-align: left;
            color: #555;
        }

        table td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        .status {
            padding: 5px 10px;
            border-radius: 3px;
            font-size: 12px;
            font-weight: bold;
        }

        .status.paid {
            background: #d4edda;
            color: #155724;
        }

        .status.pending {
            background: #fff3cd;
            color: #856404;
        }

        .action-btn {
            background: #3498db;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
            margin-right: 5px;
        }

        .action-btn.delete {
            background: #e74c3c;
        }

        /* Quick Actions */
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .action-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .action-card .icon {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .action-card h3 {
            color: #333;
            margin-bottom: 10px;
        }

        .action-card p {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .action-card button {
            background: #3498db;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Hostel<span>Manager</span></h2>
        <ul>
            <li><a href="Admin_Dashboard" class="active">📊 Dashboard</a></li>
            <li><a href="StudentsServlet">👥 Students</a></li>
            <li><a href="AddFees.jsp">💰 Fees</a></li>
            <li><a href="Admin_Dashboard.jsp">📝 Complaints</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Bar -->
        <div class="top-bar">
            <div class="welcome">
                <h1>Welcome back, Admin 👋</h1>
            </div>
            <a href="index.jsp" class="logout-btn">Logout</a>
        </div>



        <!-- Quick Actions -->
        <div class="quick-actions">
            <div class="action-card">
                <div class="icon">➕</div>
                <h3>Add Student</h3>
                <p>Register new student in hostel</p>
                <a href="AddStudent.jsp"> <button>Add Now</button> </a>
            </div>
            <div class="action-card">
                <div class="icon">🛏️</div>
                <h3>Allocate Room</h3>
                <p>Assign room to student</p>
                <a href="room_Allocation.jsp"><button>Allocate</button> </a>
            </div>
            <div class="action-card">
                <div class="icon">💰</div>
                <h3>Collect Fee</h3>
                <p>Record fee payment</p>
                <a href="AddFees.jsp"> <button>Collect</button> </a>
            </div>
        </div>

      
        <!-- Recent Complaints -->
        <div class="table-section">
          
    <h2>📝 Complaints</h2>

    <table>
        <tr>
            <th>Complaint</th>
            <th>Status</th>
            <th>Action</th>
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

           <td>
    <!-- Resolve Button -->
    <form action="UpdateComplaintServlet" method="post" style="display:inline;">
        <input type="hidden" name="id" value="<%= c.getId() %>">
        <input type="hidden" name="status" value="Resolved">
        <button class="action-btn">Resolve</button>
    </form>

    <!-- Decline Button -->
    <form action="UpdateComplaintServlet" method="post" style="display:inline;">
        <input type="hidden" name="id" value="<%= c.getId() %>">
        <input type="hidden" name="status" value="Declined">
        <button class="action-btn delete">Decline</button>
    </form>
</td>
        </tr>
<%
        }
    } 
%>
       
    </table>
</div>
        
    </div>
</body>
</html>
