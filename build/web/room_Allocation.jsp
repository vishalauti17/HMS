<%-- 
    Document   : room_Allocation
    Created on : 10-Apr-2026, 9:05:19 pm
    Author     : user5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Room Student Count</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
        }

        .container {
            width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #3498db;
            color: white;
        }

        .back {
            margin-top: 15px;
            text-align: center;
        }
        
         .AddStd {
            margin-top: 15px;
            text-align: left;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>🏠 Room-wise Student</h2>

    <table>
        <tr>
            <th>Students</th>
            <th>Room No</th>
        </tr>

         <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/HMS06","root","");

               String sql = "SELECT name, roomNo FROM students";
               PreparedStatement ps = con.prepareStatement(sql);
               ResultSet rs = ps.executeQuery();

              while(rs.next()){
             %>

        <tr>
          <td><%= rs.getString("name") %></td>
          <td><%= rs.getInt("roomNo") %></td>
       </tr>

        <%
            }

                rs.close();
                ps.close();
                con.close();

            } catch(Exception e){
                e.printStackTrace();
            }
        %>

    </table>

    <div class="back">
        <a href="Admin_Dashboard.jsp">⬅ Back</a>
    </div>
    
       <div class="addStd">
          <a href="AddStudent.jsp">Add Student </a>
       </div
</div>

</body>
</html>
