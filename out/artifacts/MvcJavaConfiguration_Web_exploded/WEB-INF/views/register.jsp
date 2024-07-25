<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
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
            width: 300px;
        }

        input[type="text"],
        input[type="password"],
        textarea,
        select,
        a,
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
<form action="${pageContext.request.contextPath}/auth/register" method="post">
    <h2>Register</h2>
    <label>
        <input type="text" name="name" placeholder="Name" required>
    </label>
    <label>
        <input type="text" name="username" placeholder="Username" required>
    </label>
    <label>
        <input type="password" name="password" placeholder="Password" required>
    </label>
    <br>
    <label for="role"></label>
    <select name="role" id="role" required>
        <option value="" disabled selected>Select Role</option>
        <!-- Populate this with event type options -->
        <option value="ADMIN">
            ADMIN
        </option>
        <option value="USER">
            USER
        </option>
    </select>

    <button type="submit">Register</button> <a href="${pageContext.request.contextPath}/">   Back</a>
</form>
<br>

</body>
</html>
