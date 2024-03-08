<%-- 
    Document   : home
    Created on : Feb 6, 2024, 3:20:06 PM
    Author     : Admin
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
                width: 100%;
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


        <div class="img_center">
            <img id="hero" src="img/COMBO IMG/ny24.jpg" alt="Hero Image"/>
            <img id="price" src="img/COMBO IMG/top10.jpg" alt=""/>
            <img id="banh" src="img/COMBO IMG/price.jpg" alt=""/>
        </div>

        <!-- chinh tiep phan ben duoi de chuyen trang sau khi hoan thanh phan tren -->

        <section>

            <h1 style="color: chocolate">Best Sellers</h1>
            <form action="home" method="post">
                <div class="product">
                    <h2>Rainbow Cake</h2>
                    <img src="img/PRODUCT/Special/Rainbow.png" alt="rainbow cake"/>
                    <p>Delicious rainbow cake for your sweet tooth.</p>
                    <p>Price: $20</p>
                    <button type="submit" name="button" value="rainbow">Add to Cart</button>
                </div>

                <div class="product">
                    <h2>Bunny cake</h2>
                    <img src="img/PRODUCT/Cake slice/Bunny.png" alt="bunny cake"/>
                    <p>Soft and moist muffins bursting with blueberries.</p>
                    <p>Price: $15</p>
                    <button type="submit" name="button" value="bunny">Add to Cart</button>
                </div>

                <div class="product">
                    <h2>Golden Lava</h2>
                    <img src="img/PRODUCT/Bread/Golden Lava Bun.png" alt="golden lava"/>
                    <p>Soft and moist muffins bursting with blueberries.</p>
                    <p>Price: $15</p>
                    <button type="submit" name="button" value="golden">Add to Cart</button>
                </div>


                <!-- Add more products as needed -->
            </form>
        </section>



        <section class="categories">
            <div class="category">
                <a href="product?cId=1">
                    <img src="img/PRODUCT/Bread/Gourment Fruit Loaf.png" alt="bread"/>
                    <h3>BREADS</h3>
                </a>
            </div>

            <div class="category">
                <a href="product?cId=2">
                    <img src="img/PRODUCT/Cake slice/Chocolate Peanut Mousse.png" alt="cake"/>
                    <h3>CAKE SLICES</h3>
                </a>
            </div>

            <div class="category">
                <a href="product?cId=3">
                    <img src="img/PRODUCT/Special/Snowy Fruity.png" alt="special"/>
                    <h3>SPECIAL ANNIVERSARY</h3>
                </a>
            </div>

            <div class="category">
                <a href="product?cId=4">
                    <img src="img/PRODUCT/Sweet/Chocolate Donut.png" alt="sweet"/>
                    <h3>SWEETS</h3>
                </a>
            </div>

            <!-- Add more categories as needed -->
        </section>



        <footer>
            <p>&copy; 2024 Bakery Shop. All rights reserved.</p> <br>

        </footer>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let images = document.querySelectorAll('.img_center img');
                let currentIndex = 0;

                function showNextImage() {
                    images[currentIndex].style.display = 'none';
                    currentIndex = (currentIndex + 1) % images.length;
                    images[currentIndex].style.display = 'block';
                }

                setInterval(showNextImage, 5000);
            });
        </script>

    </body>
</html>