<%-- 
    Document   : header
    Created on : Feb 16, 2024, 8:18:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            header {
                background-color: whitesmoke;
                text-align: center;
                padding: 1em;
            }

            nav {
                border: 1px whitesmoke;
                border-radius: 1px;
                background-color: antiquewhite;
                padding: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 50px;
            }



            nav a {
                color: black;
                text-decoration: none;
                padding: 10px;
                margin: 0 10px;
                transition: color 0.3s;
                font-size: 20px;
            }

            nav a:hover {
                color: #ffcc00; /* Màu chữ khi di chuột vào */
            }

            nav span {
                font-size: 20px;
            }

            .search-container {
                align-items: center;
                padding-top: 6px;
            }

            .search-container input {
                height: 30px;
            }

            .search-container button {
                font-size: 20px;
            }

            .search-container button:hover {
                color: #ffcc00; /* Màu chữ khi di chuột vào */
            }

            .others {
                display: flex;
                justify-content: center;
            }

            .others button {
                background-color: transparent; /* Đặt màu nền của button thành trong suốt */
                border: none; /* Loại bỏ đường viền của button */
                cursor: pointer; /* Biến con trỏ thành hình tay khi di chuột qua button */
                width: 60px;
                height: 30px;
            }


            .others input {
                width: 250px;
                height: 25px;
                border: #fff;
                border-radius: 4px;
            }

            .dropdown {
                display: inline-block;
                position: relative;
            }

            .dropdown-content {
                width: 200px;
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                padding: 10px;
                z-index: 1;
            }

            .dropdown-content a {
                font-size: 15px;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }
        </style>
    </head>
    <body>
        <header>
            <nav>
                <div>
                    <img src="img/LOGO/logo.png" width="150px" height="150px" alt="logo"/>
                </div>
                <div class="menu">
                    <a href="home.jsp" name>Home</a>
                    <div class="dropdown">
                        <span>Products</span>
                        <div class="dropdown-content">
                            <c:forEach var="ct" items="${requestScope.categoryList}">
                                <a href="product?cId=${ct.categoryId}">${ct.categoryName}</a> 
                            </c:forEach>
                        </div>
                    </div>
                    <a href="contact.jsp">Contact</a> <!<!-- check -->
                </div>
                <div class="others">

                    <form action="search" method="post">
                        <div class="search-container">
                            <input type="text" name="search" id="searchInput" placeholder="Search">
                            <button type="submit"><i class="fas fa-search" id="searchIcon"></i></button>
                        </div>
                    </form>

                    <a id="cart" name="cart" value="cart" href="cart.jsp">
                        <i class="fas fa-shopping-cart"></i>
                    </a>

                    <a id="login" name="login" value="login" href="login.jsp">
                        <i class="fas fa-user"></i>
                    </a>

                </div>
            </nav>
        </header>
    </body>
</html>
