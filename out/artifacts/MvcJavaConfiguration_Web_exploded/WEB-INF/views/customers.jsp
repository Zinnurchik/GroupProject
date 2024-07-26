<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: azinn
  Date: 7/25/2024
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.CustomerEntity" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }

        h1 {
            color: #333;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
            display: inline-block;
        }

        .search-form {
            margin-bottom: 20px;
        }

        .search-form input[type="text"] {
            padding: 10px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-form input[type="submit"] {
            padding: 10px;
            border: none;
            background-color: #333;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .customer-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .customer-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 250px;
        }

        .customer-card h2 {
            margin: 0 0 10px 0;
            font-size: 20px;
        }

        .customer-card p {
            margin: 5px 0;
            color: #666;
        }

        .customer-card .actions {
            margin-top: 15px;
        }

        .customer-card .actions a {
            text-decoration: none;
            color: #007BFF;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<h1>Customers</h1>
<a href="${pageContext.request.contextPath}/customers/add" class="button">Add Customer</a>
<form action="${pageContext.request.contextPath}/customers/search" method="GET" class="search-form">
    <label>
        <input type="text" name="query" placeholder="Search...">
    </label>
    <input type="submit" value="Search">
</form>
<div class="customer-cards">
    <!-- Assuming you have a list of customers in the request attribute named "customers" -->
    <c:forEach var="customer" items="${customers}">
        <div class="customer-card">
            <h2>${customer.name}</h2>
            <p>Phone 1: ${customer.phone1}</p>
            <p>Phone 2: ${customer.phone2}</p>
            <p>Address: ${customer.address}</p>
            <p>Source: ${customer.source}</p>
            <p>Language: ${customer.language}</p>
            <div class="actions">
                <a href="${pageContext.request.contextPath}/customers/view?id=${customer.id}">View</a>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
