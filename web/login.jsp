<%-- 
    Document   : login
    Created on : Feb 14, 2024, 4:57:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Page</title>
        <!-- Thêm vào phần head của trang -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
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

            .password-container {
                position: relative;
            }

            .show-password {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
                color: #ccc;
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
        
        <script>
            function togglePasswordVisibility() {
                var passwordField = document.getElementById('password');
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    document.querySelector('.show-password').classList.remove('far', 'fa-eye');
                    document.querySelector('.show-password').classList.add('fas', 'fa-eye-slash');
                } else {
                    passwordField.type = 'password';
                    document.querySelector('.show-password').classList.remove('fas', 'fa-eye-slash');
                    document.querySelector('.show-password').classList.add('far', 'fa-eye');
                }
            }
        </script>
    </head>
    <body>
        <h2>Login Page</h2>
        
        <h3 style="color: red">${requestScope.error}</h3>
        
        <c:set var="ac" value="${requestScope.ac}"></c:set>
        
        <form action="login" method="post">
            Username: <input type="text" name="username" value="${ac.getUsername()}" required><br>
            Password: 
            <div class="password-container">
                <input type="password" id="password" name="password" value="${requestScope.pass}" required>
                <i class="far fa-eye show-password" onclick="togglePasswordVisibility()"></i>
            </div>
            <input type="submit" value="Login">
        </form>

        <p>Don't have an account? <a href="register.jsp">Register</a></p>

    </body>
</html>
