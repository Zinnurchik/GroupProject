<%--
  Created by IntelliJ IDEA.
  User: azinn
  Date: 7/11/2024
  Time: 11:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Library Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            color: white;
            padding: 10px 20px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        .navbar .logo {
            font-size: 24px;
        }
        .navbar .profile {
            font-size: 18px;
        }
        .menu {
            width: 200px;
            background-color: #444;
            color: white;
            position: fixed;
            top: 60px;
            left: 0;
            height: calc(100% - 60px);
            padding-top: 20px;
        }
        .menu a {
            display: block;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
        }
        .menu a:hover {
            background-color: #555;
        }
        .content {
            margin-left: 200px;
            padding: 20px;
            padding-top: 80px; /* Adjust for fixed navbar */
            flex: 1;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="logo">Online Library</div>
    <div class="profile">Welcome, User!</div>
</div>
<div class="menu">
    <a href="dashboard.jsp">Dashboard</a>
    <a href="${pageContext.request.contextPath}/customers">Customers</a>
    <a href="settings.jsp">Settings</a>
    <a href="logout.jsp">Logout</a>
</div>
<div class="content">
    <h1>Dashboard</h1>
    <p>Welcome to the Online Library Dashboard. Here you can manage your clients, settings, and more.</p>
</div>
<div class="footer">
    <p>© 2024 Online Library. All rights reserved.</p>
</div>
</body>
</html>

