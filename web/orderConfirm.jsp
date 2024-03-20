<%-- 
    Document   : addNewCustomer
    Created on : Mar 19, 2024, 10:00:00 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Customer</title>
      <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .container {
                max-width: 600px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #333;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"],
            input[type="number"],
            textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            textarea {
                height: 100px;
            }

            input[type="file"] {
                margin-top: 5px;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h1>Order Confirm</h1>
            <c:set var="c" value="${requestScope.acc}"></c:set>
                <form action="orderConfirm" method="POST">

                    <label for="customerName">Customer Name:</label>
                    <input type="text" name="customerName" value="${c.fullname}" required>

                <label for="cusAddress">Customer Address:</label>
                <input type="text" name="cusAddress" value="${c.address}" required>

                <label for="cusPhone">Customer Phone:</label>
                <input type="text" name="cusPhone" value="${c.phone}" required>

                <label for="username">Username:</label>
                <input type="text" name="username" value="${requestScope.username}" required>

                <input type="submit" value="Confirm">
            </form>
        </div>
    </body>
</html>

