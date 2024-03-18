<%-- 
    Document   : product
    Created on : Feb 19, 2024, 10:18:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bakery Shop</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
                padding: 0;
                position: fixed; /* Đặt vị trí là fixed */
                top: 0; /* Giữ phần header ở trên cùng của trang */
                width: 100%; /* Chiều rộng 100% */
                z-index: 1000; /* Đảm bảo nó nằm trên các phần tử khác */
            }

            nav {
                border: 1px whitesmoke;
                border-radius: 1px;
                background-color: antiquewhite;
                padding: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 60px;
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
                margin: 9px 5px;
            }

            .dropdown-content {
                width: 200px;
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                padding: 10px;
                z-index: 1;
                top: 100%; /* Hiển thị dropdown bên dưới icon user */
                right: 0; /* Hiển thị dropdown từ bên phải của icon user */
            }

            .dropdown-content a {
                font-size: 15px;
                display: block;
                padding: 8px 10px; /* Thêm khoảng cách giữa các mục */
                text-align: left;
                color: black; /* Màu chữ */
                text-decoration: none;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex; /* Use flexbox to create a flex container */
                padding-top: 80px; /* Adjust this value based on the height of your fixed header */
            }
            .left-section {
                /* Styles for the left section (search tools) */
                width: 200px;
                background-color: #e0e0e0;
                padding: 10px;
            }

            .right-section {
                /* Styles for the right section (product images) */
                flex: 1; /* The right section takes up the remaining space */
                padding: 10px;
                display: flex;
                flex-wrap: wrap; /* Allow images to wrap to the next line if needed */
            }

            .right-section a {
                color: black;
                text-decoration: none;
            }

            /* Additional styles for your product items (modify as needed) */
            .product-item {
                margin: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: calc(30% - 20px);
                display: flex;
                flex-direction: column;
                align-items: center; /* Center items horizontally */
                text-align: center; /* Center text within each product item */
            }

            .product-item img {
                width: 100%;
                height: 300px;
            }

            .product-item p {
                margin-top: 10px;
            }

            .add-new-product-btn {
                background-color: antiquewhite;
                text-decoration: none;
                display: flex;
                justify-content: center;
                align-items: center;
                align-items: center;
                color: black;
                border: none;
                cursor: pointer;
                border-radius: 3px;
                width: 200px;
                height: 40px;
                margin-top: 10px;
            }

            .add-new-product-btn:hover {
                background-color: #ffcc00;
                font-weight: 600;
            }

            .update-btn {
                background-color: antiquewhite;
                color: black;
                border: none;
                cursor: pointer;
                border-radius: 3px;
                width: 100px;
                height: 40px;
                margin-top: 10px;
            }

            .update-btn:hover {
                background-color: #ffcc00;
                font-weight: 600;
            }

            .add-to-cart-btn {
                background-color: antiquewhite;
                color: black;
                border: none;
                cursor: pointer;
                border-radius: 3px;
                width: 100px;
                height: 40px;
                margin-top: 10px;
            }

            .add-to-cart-btn:hover {
                background-color: #ffcc00;
                font-weight: 600;
            }
<<<<<<< HEAD
            .delete-btn {
                background-color: antiquewhite;
                color: black;
                border: none;
                cursor: pointer;
                border-radius: 3px;
                width: 100px;
                height: 40px;
                margin-top: 10px;
            }

            .delete-btn:hover {
                background-color: #ffcc00;
                font-weight: 600;
=======
            
            .badges:after {
                content: attr(data-count);
>>>>>>> 2f63517df5a0ccf0f10deaae881c3e3c257bc2d8
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
                    <a href="home" name>Home</a>
                    <div class="dropdown">
                        <span><a href="product?type=all">Products</a></span>
                        <div class="dropdown-content">
                            <c:forEach var="ct" items="${requestScope.categoryList}">
                                <a href="product?type=${ct}">${ct}</a> <br>
                            </c:forEach>
                        </div>
                    </div>
                    <a href="contact">Contact</a>
                </div>
                <div class="others">
                    <form action="search" method="post">
                        <div class="search-container">
                            <input type="text" name="search" id="searchInput" placeholder="Search">
                            <button type="submit"><i class="fas fa-search" id="searchIcon"></i></button>
                        </div>
                    </form>

                    <a id="cart" name="cart" value="cart" href="cart.jsp" class="badges" data-count="0">
                        <i class="fas fa-shopping-cart"></i>
                    </a>

                    <span class="dropdown">
                        <c:choose>
                            <c:when test="${empty requestScope.user}">
                                <i class="fas fa-user"></i>
                                <div class="dropdown-content">
                                    <a href="login.jsp">Login</a>
                                    <!-- Thêm các mục khác tại đây nếu cần -->
                                </div>
                            </c:when>
                            <c:otherwise>
                                ${requestScope.user}
                                <div class="dropdown-content">
                                    <a href="sighOut">Sign Out</a>
                                    <!-- Thêm các mục khác tại đây nếu cần -->
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </nav>
        </header>
        <%
         Cookie cookie = null;
         Cookie username = null;
         Cookie role = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         
        if(cookies!=null){  
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if(cookie.getName().equals("username")){
               username=cookie;
               }
               if(cookie.getName().equals("role")){
               role=cookie;
               }
            }
            }
        %>
        <div class="left-section">
            <% if (role != null && role.getValue().equals("admin")) { %>
            <a href="addNewProduct.jsp" class="add-new-product-btn">Add new Product</a>
            <% } %>


            <!-- Add your search tools and content for the left section here -->
            <form action="search" method="post">
                <div class="search-container">
                    <input type="text" name="search" id="searchInput" placeholder="Search">
                    <button type="submit"><i class="fas fa-search" id="searchIcon"></i></button>
                </div>
            </form>
            <!-- Add other search tools or content as needed -->
        </div>
        <div class="right-section">

            <c:forEach var="p" items="${requestScope.listProduct}">

                <a class="product-item" href="productDetail">

                    <img src="${p.proImage}" alt="${p.proName}">
                    <p>${p.proName}</p>
                    <p>${p.price} $</p>
                    <% if (role != null && role.getValue().equals("admin")) { %>
                    <form action="updateProduct" method="get">
                        <input type="hidden" name="id" value="${p.productID}">
                        <button class="update-btn" type="submit">Update</button>
                    </form>

                    <form action="deleteProduct" method="get">
                        <input type="hidden" name="id" value="${p.productID}">
                        <button class="delete-btn" type="submit">Delete</button>
                    </form>
                    <% } else { %>
                    <form action="addToCart" method="get">
                        <input type="hidden" name="id" value="${p.productID}">
                        <button class="add-to-cart-btn" type="submit">Add to Cart</button>
                    </form>
                    <% } %>

                </a>
            </c:forEach>
        </div>
    </body>
</html>
