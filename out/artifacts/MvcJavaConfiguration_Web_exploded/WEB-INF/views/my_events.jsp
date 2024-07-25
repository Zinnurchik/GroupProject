<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: azinn
  Date: 7/12/2024
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Events</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        form {
            margin-bottom: 10px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input, select, textarea, button {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 15px;
            margin-top: 10px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>My Events</h2>
<c:choose>
    <c:when test="${events.size() > 0}">
        <table>
            <thead>
            <tr>
                <th>#No</th>
                <th>Name</th>
                <th>Location</th>
                <th>Start</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <jsp:useBean id="events" scope="request" type="java.util.List"/>
            <c:forEach var="event" items="${events}" varStatus="num">
                <tr>
                    <td>${num.index + 1}</td>
                    <td>${event.title}</td>
                    <td>${event.location}</td>
                    <td>${event.description}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/event/update" method="post">
                            <input type="hidden" value="${event.id}" name="eventId">
                            <button type="submit">Update</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/event/delete" method="post">
                            <input type="hidden" value="${event.id}" name="eventId">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <h3>You don't have any events yet</h3>
    </c:otherwise>
</c:choose>
</body>
</html>