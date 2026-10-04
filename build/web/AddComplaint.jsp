<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complaint Page</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma;
            background: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 380px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        textarea {
            width: 100%;
            padding: 10px;
            height: 100px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            resize: none;
            outline: none;
            transition: 0.3s;
        }

        textarea:focus {
            border-color: #3498db;
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
            transition: 0.3s;
        }

        button:hover {
            background: #2980b9;
        }

        .back-link {
            margin-top: 15px;
        }

        .back-link a {
            text-decoration: none;
            color: #555;
            font-size: 14px;
        }

        .back-link a:hover {
            color: #3498db;
        }

        .msg {
            margin-bottom: 10px;
            color: green;
            font-size: 14px;
        }

    </style>
</head>

<body>

    <div class="container">
        <h2>📝 Add Complaint</h2>

        <!-- Optional Success Message -->
        <%
            String msg = request.getParameter("msg");
            if ("success".equals(msg)) {
        %>
            <div class="msg">Complaint submitted successfully ✔</div>
        <%
            }
        %>

        <form action="AddComplaintServlet" method="post">
            <textarea name="complaint" placeholder="Enter your complaint..." required minlength="5"></textarea>
            <button type="submit">Submit Complaint</button>
        </form>

        <div class="back-link">
            <a href="Student_Dashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>

</body>
</html>