<%-- 
    Document   : AddFees
    Created on : 05-Apr-2026, 5:22:39 pm
    Author     : user5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Fees</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #3498db;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #2980b9;
        }

        .back {
            text-align: center;
            margin-top: 10px;
        }

        .back a {
            text-decoration: none;
            color: #3498db;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>💰 Add Fees</h2>
    <% 
       String msg =request.getParameter("msg");
       if(msg != null){
    %>
    <p style="color:red"><%=msg%></p>
    <%}%>

    <!-- FORM -->
    <form action="AddFeesServlet" method="post">

        <label>Room Number</label>
        <input type="number" name="room" required>
     
        <label>Fees Amount</label>
        <input type="number" name="fees" required>

        <button type="submit">Submit</button>
    </form>

    <div class="back">
        <a href="Admin_Dashboard.jsp">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>