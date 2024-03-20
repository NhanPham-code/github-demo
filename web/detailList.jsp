<%-- 
    Document   : cart
    Created on : Feb 14, 2024, 4:55:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f7f7f7;
                margin: 0;
                padding: 0;
            }
            h1 {
                text-align: center;
                margin-top: 20px;
            }
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #fff;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            img {
                display: block;
                margin: auto;
            }
            a {
                color: #007bff;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            .total {
                text-align: left;
                padding: 10px;
            }

            .place-order {
                margin-top: 10px;
                text-align: left;
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
                text-align: center;
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



            section {
                padding: 20px;
                text-align: center;
            }

            .product {
                display: inline-block;
                width: 25%;
                height: auto;
                margin: 10px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .product img {
                width: 100%;
            }

            .product button {
                background-color: antiquewhite;
                color: black;
                border: none; /* Loại bỏ đường viền của button */
                cursor: pointer; /* Biến con trỏ thành hình tay khi di chuột qua button */
                border-radius: 3px;
                width: 100px;
                height: 40px;

            }

            .product button:hover {
                background-color: #ffcc00; /* Màu nền khi hover */
                font-weight: 600;
            }

            /* CSS Style for Categories */
            .categories {
                display: flex;
                justify-content: space-around;
                background-image: url('img/PRODUCT/Background/Bakery.jpg'); /* Hình ảnh nền */
                background-size: cover;
                padding: 20px;
                height: 500px;
                align-items: center;
            }

            .category {
                text-align: center;
                color: white;
            }

            .category img {
                width: 100%;
                max-width: 200px; /* Đảm bảo hình ảnh không quá rộng */
                border-radius: 10px; /* Bo tròn góc hình ảnh */
            }

            .category h3 {
                margin-top: 10px;
            }

            .category a {
                color: white;
                text-decoration: none;
            }

            /* Hover effect */
            .category:hover a {
                transform: scale(1.1); /* Phóng to chữ khi di chuột vào */
            }


            .category:hover img {
                transform: scale(1.1); /* Phóng to hình ảnh khi di chuột vào */
            }

            /* Hover effect for the entire category */
            .category:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Hiệu ứng đổ bóng khi di chuột vào */
            }

            .img_center {
                text-align: center;
                margin-top: 30px;
            }

            .img_center img {
                display: none;
                max-width: 100%;
                height: auto;
            }
            .badges:after {
                content: attr(data-count);
            }
            .btn-place-order {
                text-decoration: none;
                display: inline-block;
                padding: 10px 20px;
                background-color: #ff7f50; /* Màu cam nhạt */
                color: #fff; /* Màu chữ trắng */
                text-decoration: none;
                border-radius: 5px;
            }

            .btn-place-order:hover {
                text-decoration: none;
                background-color: #ff6347; /* Màu cam nhạt khi hover */
            }


        </style>
    </head>
    <body>
        <h1>Cart</h1>
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
                    <a href="contact">Contact</a> <!<!-- check -->
                </div>

                <div class="others">

                    <form action="search" method="post">
                        <div class="search-container">
                            <input type="text" name="search" id="searchInput" placeholder="Search with name product">
                            <button type="submit"><i class="fas fa-search" id="searchIcon"></i></button>
                        </div>
                    </form>

                    <%
                        Cookie[] cookies = request.getCookies();
                         String role = null;
                         if (cookies != null) {
                           for (Cookie cookie : cookies) {
                              if (cookie.getName().equals("role")) {
                                 role = cookie.getValue();
                                 }
                              }
                    }
                    if(role=="admin"){%>
                    <a id="cart" name="cart" value="cart" href="invoiceList" class="badges" data-count="${requestScope.size}">
                        <i class="fas fa-shopping-cart"></i>
                    </a>
                    <%} else {%>
                    <a id="cart" name="cart" value="cart" href="cartList" class="badges" data-count="${requestScope.size}">
                        <i class="fas fa-shopping-cart"></i>
                    </a><%}%>

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
        <table>
            <thead>
                <tr>
                    <th>InvoiceID</th>
                    <th>ProductID</th>
                    <th>Product Image</th>
                    <th>Product Name</th>
                    <th>Price</th>    
                    <th>Quantity</th>  
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${requestScope.listPro}">
                    <tr>
                        <td>${requestScope.id}</td>


                        <td>${p.productID}</td>
                        <td><img src="${p.proImage}" width="80px" height="80px"></td>
                        <td>${p.proName}</td>
                        <td>${p.price}$</td>                      
                        <td>${p.quantity}</td>

                    </tr>
                </c:forEach>


            </tbody>
        </table>
    </body>
</html>
