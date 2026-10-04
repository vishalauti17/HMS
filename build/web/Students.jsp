<%-- 
    Document   : Students
    Created on : 03-Apr-2026, 12:22:09 pm
    Author     : user5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="in.HMS.DTO.Student" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Students - HMS</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            padding: 20px;
        }

        h1 {
            margin-bottom: 20px;
        }

        .btn {
            background: #3498db;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        th {
            background: #3498db;
            color: white;
        }

        .delete {
            background: red;
            color: white;
            padding: 5px 10px;
            border: none;
        }

        .edit {
            background: green;
            color: white;
            padding: 5px 10px;
            border: none;
        }
        .back-link {
            text-align: right;
            margin-top: 0px;
        }

        .back-link a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link a:hover {
            color: #667eea;
        }

    </style>
</head>
<body>

    <h1>👥 Students List</h1>

    <a href="AddStudent.jsp" class="btn">➕ Add Student</a>
    <div class="back-link">
                <a href="Admin_Dashboard.jsp">← Back to Home</a>
        </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Room</th>
            <th>Course</th>
            <th>Action</th>
        </tr>
        
        <%
    List<Student> list = (List<Student>) request.getAttribute("students");

    if (list != null) {
        for (Student s : list) {
%>
<tr>
    <td><%= s.getId() %></td>
    <td><%= s.getName() %></td>
    <td><%= s.getRoomNo() %></td>
    <td><%= s.getCourse() %></td>
    <td>

    <form action="DeleteStudentServlet" method="post" style="display:inline;">
        <input type="hidden" name="id" value="<%= s.getId() %>">
        <button class="delete" onclick="return confirm('Are you sure?')">Delete</button>
    </form>

</td>
</tr>
<%
        }
    }
%>
    </table>

</body>
</html>
