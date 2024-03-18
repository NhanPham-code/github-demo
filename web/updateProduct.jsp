<%-- 
    Document   : updateProduct
    Created on : Mar 18, 2024, 3:25:10 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Product</title>
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

            input[type="submit"],
            .btn-back {
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
                margin-right: 10px;
                text-decoration: none;
                display: inline-block;
            }

            input[type="submit"]:hover,
            .btn-back:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <br>

        <div class="container">
            <h1>Update Product</h1>
            <c:set var="p" value="${Product}"></c:set>
                <form action="updateProduct" method="POST" enctype="multipart/form-data">
                    <label for="productID">Product ID: </label>
                    <input type="text" name="productID" value ="${p.productID}" readonly>

                <label for="proName">Product Name:</label>
                <input type="text" name="proName" value="${p.proName}" required>

                <label for="price">Price:</label>
                <input type="number" name="price" min="0" step="0.01" value ="${p.price}" required>

                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" min="0" value="${p.quantity}" required>

                <label for="proImage">Image:</label>
                <input type="file" name="proImage" required>

                <label for="describe">Description:</label>
                <textarea name="describe" required>${p.describe}</textarea>

                <label for="typeName">Type Name:</label>
                <input type="text" name="typeName" value="${p.typeName}" required>

                <input type="submit" value="Update Product">
                <a href="product?type=all" class="btn-back">Back</a>
            </form>
        </div>
    </body>
</html>
