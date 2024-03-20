<%-- 
    Document   : addNewProduct
    Created on : Mar 18, 2024, 12:51:23 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Product</title>
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

            input[type="file"] {
                margin-top: 5px;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        
        <div class="container">
            <h1>Add New Product</h1>

            <form action="addNewProduct" method="POST" enctype="multipart/form-data">
                <br>
                <% String error3 = (String) request.getAttribute("error3"); %>
                <% if (error3 != null) { %>
                <div style="color: red;"><%= error3 %></div>
                <% } %>
                <label for="productID">Product ID:</label>
                <input type="text" name="productID" required>

                <label for="proName">Product Name:</label>
                <input type="text" name="proName" required>

                <label for="price">Price:</label>
                <input type="number" name="price" min="0" step="0.01" required>

                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" min="0" required>

                <label for="proImage">Image:</label>
                <input type="file" name="proImage" required>

                <label for="describe">Description:</label>
                <textarea name="describe" required></textarea>

                <label for="typeName">Type Name:</label>
                <input type="text" name="typeName" required>

                <input type="submit" value="Add Product">
            </form>
        </div>
    </body>
</html>
