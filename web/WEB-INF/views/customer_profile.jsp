<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        .form-container table {
            width: 100%;
        }
        .form-container td {
            padding: 10px;
        }
        .form-container input, .form-container textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-container input[type="submit"], .form-container button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 4px;
        }
        .form-container input[type="submit"]:hover, .form-container button:hover {
            background-color: #45a049;
        }
        .form-container .danger {
            background-color: #f44336;
        }
        .form-container .danger:hover {
            background-color: #e31b0c;
        }
    </style>
    <script type="text/javascript">
        function confirmUpdate() {
            return confirm("Are you sure you want to update the customer information?");
        }
        function confirmDelete() {
            return confirm("Are you sure you want to delete this customer?");
        }
    </script>
</head>
<body>
<div class="form-container">
    <h1>Customer Profile</h1>
    <%--@elvariable id="customer" type="org.example.model.CustomerEntity"--%>
    <form:form method="POST" action="${pageContext.request.contextPath}/customers/update" modelAttribute="customer" onsubmit="return confirmUpdate();">
        <table>
            <tr>
                <td>ID:</td>
                <td><form:input path="id" readonly="true"/></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><form:input path="name"/></td>
            </tr>
            <tr>
                <td>Phone 1:</td>
                <td><form:input path="phone1"/></td>
            </tr>
            <tr>
                <td>Phone 2:</td>
                <td><form:input path="phone2"/></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><form:input path="address"/></td>
            </tr>
            <tr>
                <td>Source:</td>
                <td><form:input path="source"/></td>
            </tr>
            <tr>
                <td>Language:</td>
                <td><form:input path="language"/></td>
            </tr>
            <tr>
                <td>Type:</td>
                <td><form:input path="type"/></td>
            </tr>
            <tr>
                <td>About:</td>
                <td><form:textarea path="about" rows="4" cols="50"></form:textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"/></td>
            </tr>
        </table>
    </form:form>

    <form method="POST" action="${pageContext.request.contextPath}/customers/delete" onsubmit="return confirmDelete();">
        <input type="hidden" name="id" value="${customer.id}"/>
        <button class="danger">DELETE CUSTOMER</button>
    </form>
    <form method="POST" action="${pageContext.request.contextPath}/orders/add">
        <input type="hidden" name="id" value="${customer.id}"/>
        <button>ADD ORDER</button>
    </form>

</div>
</body>
</html>

