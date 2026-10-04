

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: white;
            width: 350px;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
            font-size: 14px;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
        }

        .input-group input:focus {
            outline: none;
            border-color: #667eea;
        }

        .options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            font-size: 14px;
        }

        .remember {
            display: flex;
            align-items: center;
            gap: 5px;
            color: #666;
        }


        .login-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-btn:hover {
            opacity: 0.9;
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

        .demo {
            margin-top: 25px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 6px;
            font-size: 13px;
            border-left: 3px solid #667eea;
        }

        .demo p {
            color: #555;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .demo span {
            display: block;
            color: #666;
            padding: 3px 0;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Admin Login</h2>
        <% 
          String msg = (String) request.getAttribute("msg");
          if(msg != null){
        %>
        <hr> <p style="color:red"><%=  msg %></p>
        <%}%>
        
        <div class="subtitle">Enter your credentials</div>

        <form action="ALoginServlet" action="UpdateComplaintServlet" method="post">
            <div class="input-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter username" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>

            <button type="submit" class="login-btn">Login</button>

            <div class="back-link">
                <a href="index.jsp">← Back to Home</a>
            </div>
        </form>
    </div>
</body>
</html>