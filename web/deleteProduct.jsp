<%-- 
    Document   : deleteProduct
    Created on : Mar 18, 2024, 2:31:57 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Delete Product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .confirm-message {
                margin-bottom: 20px;
            }

            .product-item {
                margin: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: calc(100% - 45px);
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
            .btn-group {
                margin-top: 20px;
                display: flex; /* Sử dụng flexbox để xếp nút ngang nhau */
                justify-content: center; /* Căn giữa các nút */
            }
            .btn {
                background-color: #ffcc00;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin: 0 5px; /* Khoảng cách giữa các nút */
            }
            .btn:hover {
                background-color: #ffa500;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:set var="p" value="${requestScope.p}"></c:set>
            <div class ="product-item">
            <img src="${p.proImage}" alt="${p.proName}">
            <p>${p.proName}</p>
            <p>${p.price} $</p>
            </div>
            <h2 class="confirm-message">Are you sure you want to delete this item?</h2>
            <div class="btn-group">
                <form action="deleteProduct" method="post">
                    <input type="hidden" name="id" value="${p.productID}">
                    <button type="submit" class="btn">Yes</button>
                </form>
                <form action="home" method="get">
                    <button type="submit" class="btn">No</button>
                </form>
            </div>
        </div>
    </body>
</html>
