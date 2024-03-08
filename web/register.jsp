<%-- 
    Document   : register
    Created on : Feb 14, 2024, 5:41:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registration Page</title>

        <style>

            body {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                width: 300px;
                text-align: center;
                margin: 5% auto;
            }

            form {
                margin-top: 20px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #ffcc00;
            }

            a {
                color: #007bff;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
                color: #ffcc00;
            }

        </style>
    </head>
    <body>
        <h2>Registration Page</h2>

        <form action="register" method="post">
            Name: <input type="text" name="name" required><br>
            Phone: <input type="text" name="phone" required><br>
            Address: <input type="text" name="address" required><br>
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Register">
        </form>

        <p>Already have an account? <a href="login.jsp">Login</a></p>
    </body>
</html>
