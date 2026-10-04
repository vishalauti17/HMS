<%-- 
    Document   : AddStudent
    Created on : 03-Apr-2026, 12:27:21 pm
    Author     : user5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>

    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #4facfe;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #007bff;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
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

<div class="container">
    <h2>Student Registration</h2>
      
    <%
      String msg = (String) request.getAttribute("msg");
      if(msg != null){
   %>
      <p style="color:red;"><%= msg %></p>
   <%
     }
   %>
    
    <form action="AddStudentServlet" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="number" name="room" placeholder="Room Number" required>
        <input type="text" name="course" placeholder="Course" required>

        <button type="submit">Register</button>
        <div class="back-link">
                <a href="Admin_Dashboard.jsp">← Back to Home</a>
        </div>
    </form>
</div>

</body>
</html>