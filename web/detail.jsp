<%-- 
    Document   : detail
    Created on : Mar 18, 2024, 2:31:21 PM
    Author     : ADMIN
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
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
                display: flex; /* Use flexbox to create a flex container */
                padding-top: 80px; /* Adjust this value based on the height of your fixed header */
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

            .grid-container{
                max-width: 80rem;
            }

            .product-detail-inner{
                display: flex;
                position: relative;
                flex-flow: row wrap;
                justify-content: space-evenly;
                padding-bottom: 40px;
            }


            .product-detail-img {
                display: inline-block;
                width: 40%;
                height: auto;
                margin: 10px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .product-detail-img img{
                width: 100%;
                height: 100%;
            }
            .product_title{
                width: 100%;
                font-weight: 600;
                font-size: 32px;
                line-height: 42px;
            }
            .summary{
                text-align: left;
            }
            .screen-reader-text{
                border: 0;
                clip: rect(0, 0, 0, 0);
                height: 1px;
                margin: -1px;
                overflow: hidden;
                padding: 0;
                position: absolute;
                top: -10000em;
                width: 1px;
            }

            p{
                width: 100%;
                margin-top: 0;
                padding: 5px 0;
                margin-bottom: 10px;
                align-items: flex-end;
            }

            .hb_quantis{
                display: inline-flex;
                border: 0.7px solid #000;
            }

            .add-to-cart{
                display: flex;
                margin-top: 30px;
            }

            .qty_button{
                background: #ffffff;
                width: 50px;
                height: 40px;
                font-size: 30px;
                color: #000;
                border: none;
                cursor: pointer;
            }

            .input-text {
                width: 3em;
                background: #ffffff;
                border: none;
                box-shadow: none;
                border-right: 0.7px solid #000;
                border-left: 0.7px solid #000;
            }
            button{
                border-radius: 0;
                font-weight: 600;
                font-size: 16px;
                line-height: 20px;
                text-align: center;
                color: white;
                font-family: "Barlow Condensed", sans-serif;
                background-color: #CD9B33;
                text-transform: uppercase;
                letter-spacing: 1px;
                border: 1px solid transparent;
                padding: 0 30px;
                position: relative;
                overflow: hidden;
                cursor: pointer;
                margin-left: 30px;
            }
            .product_meta{
                width: 100%;
                margin-top: 30px;
                padding: 5px 0;
                display: flex;
                align-items: flex-end;
            }
            .product_describe{
                width: 100%;
                font-weight: 600;
                font-size: 32px;
                line-height: 42px;
                color: #CD9B33;
            }
            
            .posted_in{
                text-decoration: none;
            }

            footer {
                margin-top: 20px;
                background-color: burlywood;
                color: #f9f9f9;
                text-align: center;
                padding: 1em;
                /* position: fixed; */
                /* bottom: 0; */
                width: 100%;
            }

            .badge:after {
                content: attr(data-count);
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
                        <span>Products</span>
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

                    <a id="cart" name="cart" value="cart" href="cart.jsp" class="badge" data-count="0">
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

        <section class="section single-product single-section">
            <div class="grid-container">
                <div class="product-detail-inner">
                    <div class="product-detail-img">
                      <!-- <img src="${p.proImage}" alt="${p.proName}"> -->
                        <img src="img/PRODUCT/Cake slice/Bunny.png" alt="bunny cake"/>
                    </div>   
                    <div class="summary">
                        <h1 class="product_title">Bunny Cake</h1>
                        <p>100d</p>
                        <!--<p>${p.proName}</p>
                        <p>${p.price} $</p>
                        -->

                        <a class="cart" action="cart" method="get">
                            <div class="add-to-cart">
                                <div class="quantity">
                                    <label class="screen-reader-text" for="8">Quantity</label>
                                    <div class="hb_quantis">
                                        <input type="button" value="-" class="qty_button minus">
                                        <input type="number" id="8" class="input-text qty text" step="1" min="1" max="" name="quantity" value="1" title="Quan" size="4" pattern="[0-9]*" inputmode="numeric">
                                        <input type="button" value="+" class="qty_button plus">
                                    </div>
                                </div>

                                <button type="submit" name="add-to-cart" value="" class="single_add_to_cart_button button alt">Add to cart</button>
                            </div>
                            <div class="product_meta">
                                <span class="posted_in">Catalogue:  <a href="" rel="tag">Bread</a></span>
                            </div>
                    </div>
                </div>
                <div class="product_summary">
                    <div class="product-description-inner">
                        <h3 class="product_describe">Describe</h3>
                        <p>Bread with mushroom and cheese</p>
                    </div>			
                </div>
            </div>   
        </section>
    </body>
</html>

