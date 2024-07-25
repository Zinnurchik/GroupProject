<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event Form</title>
    <style>
        /* Body and form container */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        /* Form input and button styles */
        input[type="text"],
        textarea,
        select,
        input[type="number"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/event/add_event" method="post">
    <h2>Event Form</h2>
    <label for="title">Title:</label>
    <input type="text" name="title" id="title" required>

    <label for="eventType">Event Type:</label>
    <select name="eventType" id="eventType" required>
        <option value="" disabled selected>Select Event Type</option>
        <!-- Populate this with event type options -->
        <option value="CONCERT">
            CONCERT
        </option>
        <option value="THEATRE">
            THEATRE
        </option>
        <option value="CINEMA">
            CINEMA
        </option>
        <option value="FOOTBALL">
            FOOTBALL
        </option>
        <option value="OTHER">
            OTHER
        </option>

    </select>

    <label for="description">Description:</label>
    <textarea name="description" id="description" rows="4" required></textarea>
    <label for="location">Location:</label>
    <input type="text" name="location" id="location" required>

    <label for="ticketsCount">Tickets Count:</label>
    <input type="number" name="ticketsCount" id="ticketsCount" required>\
    <label for="ticketPrice">Ticket Price:</label>
    <input type="number" name="ticketPrice" id="ticketPrice" required>
    <label for="startTime">Start Time:</label>
    <input type="datetime-local" name="startTime" id="startTime" required>

    <button type="submit">Save Event</button>
</form>
</body>
</html>
