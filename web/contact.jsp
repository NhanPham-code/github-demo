<%-- 
    Document   : Contact
    Created on : Feb 15, 2024, 10:05:54 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bakery Shop</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
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
                height: 80px;
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
                text-decoration: none;
            }

            nav span {
                font-size: 20px;
            }
            .search-container {
                align-items: center;
                padding-top: 8.5px;
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
                width: 255px;
                height: 26px;
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
                height: autopx;
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
            }

            .img_center img {
                display: none;
                max-width: 100%;
                height: auto;
            }
            .img_logo img{
                width: 200px;
                height: 30%;
            }
            .grid-container{
                padding-right: 0.925rem;
                padding-left: 0.925rem;
                margin-left: 15px;
                margin-right: 15px;
                margin-top: 70px;
            }
            .container-fluid{
                flex-flow: row wrap;
                flex-direction: row-reverse;
                justify-content: space-between;
                position: static;
            }
            .img{
                margin-top: 80px;
            }
            .about_desc {
                font-size: 17px;
                margin-left: 30px;
                margin-top: 40px
            }
            .img_us img{
                height: 70%;
                width: 70%
            }
            .sub_title{
                text-align: left;
                font-weight: 400;
                font-size: 38px;
                line-height: 80px;
                color: var(--color1);
                font-family: "Great Vibes", cursive;
                margin-bottom: 21px;
                transition-delay: 0.5s;
                margin-top: 20px;
                color: #D9A569;
            }
            .infomation li {
                display: unset;
            }
            .infomation_inner{
                display: flex;
            }
            .infomation_text{
                margin-left: 10px;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
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

            .badges:after {
                content: attr(data-count);
            }


        </style>
    </head>
    <body>

        <header>
            <nav>
                <div>
                     <img src="img/LOGO/logo.png" width="150px" height="150px" alt="logo">
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

        <div class="grid-container">
            <!--information airblade 160cc-->
            <div class="row">
                <div class="col-md-6">
                    <h3 class="sub_title" data-wow-duration="0.7s" data-wow-delay="0.5s"> About us </h3>
                    <div class="about_desc">
                        <p>Experience amazing bread cuisine at Caky Word!</p>
                        <p>
                            "“We are confident of leading with prestige and quality,"
                            <br>
                            " We understand Vietnamese cuisine and taste,"
                            <br>
                            " We are constantly innovating and creating“."
                            <br>
                        <p>Experience amazing bakery cuisine at the bread brand today!</p> 
                        </p>
                    </div>
                </div>
                <div class="col-md-6 img">
                    <div class="col-md-4 img_us">
                        <img
                            class="img-responsive img-sub"
                            src="img/CONTACT/US/dhp.png"
                            alt=""
                            />
                        <img
                            class="img-responsive img-sub"
                            src="img/CONTACT/US/hnt.png"
                            alt=""
                            />
                    </div>

                    <div class="col-md-4 img_us">
                        <img
                            class="img-responsive img-sub"
                            src="img/CONTACT/US/phn.png"
                            alt=""
                            />
                        <img
                            class="img-responsive img-sub"
                            src="img/CONTACT/US/tcun.png"
                            alt=""
                            />
                    </div>
                    <div class="col-md-4 img_us">
                        <img
                            class="img-responsive img-sub"
                            src="img/CONTACT/US/vhd.png"
                            alt=""
                            />
                        <img
                            class="img-responsive img-sub"
                            src="img/CONTACT/US/bread.png"
                            alt=""
                            />
                    </div>
                </div>
            </div>

        </div>
        <div class="grid-container">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="sub_title" data-wow-duration="0.7s" data-wow-delay="0.5s"> Contact </h3>
                    <form>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Fullname</label>
                            <input
                                type="text"
                                class="form-control"
                                id="exampleFormControlInput1"
                                placeholder="Enter Fullname"
                                />
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlInput2">Email address</label>
                            <input
                                type="email"
                                class="form-control"
                                id="exampleFormControlInput2"
                                placeholder="name@example.com"
                                />
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlInput3">Phone number</label>
                            <input
                                type="text"
                                class="form-control"
                                id="exampleFormControlInput3"
                                placeholder="0xxxxxxxxxx"
                                />
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Your suggestion</label>
                            <textarea
                                class="form-control"
                                id="exampleFormControlTextarea1"
                                rows="3"
                                ></textarea>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>


                <div class="col-md-6 img">
                    <ul class="infomation">
                        <li>
                            <div class="img_logo">
                                <img id="logo" src="img/LOGO/logo.png" alt="logo"/>
                            </div>
                            <div class="infomation_list">
                                <div class="infomation_inner">
                                    <div class="infomation_svg">
                                        <i class="fa fa-location-arrow"></i>                                            </div>
                                    <div class="infomation_text">
                                        600, đường Nguyễn Văn Cừ (nối dài), phường An Bình, quận Ninh Kiều, TP. Cần Thơ                                           </div>
                                </div>
                                <a href="mailto:info@breadtalkvietnam.com">
                                    <div class="infomation_inner">
                                        <div class="infomation_svg">
                                            <i class="fa fa-envelope-open"></i>                                            </div>

                                        <div class="infomation_text">
                                            cakywordvietnam@gmail.com                                          </div>
                                    </div>
                                </a>
                                <a href="tel:02837751727">
                                    <div class="infomation_inner">
                                        <div class="infomation_svg">
                                            <i class="fa fa-phone"></i>                                            </div>
                                        <div class="infomation_text">
                                            093 974 0742 (08h00 – 17h00); 091 575 1200  (07h00 – 22h00)                                            </div>
                                    </div>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
    </body>
</html>








