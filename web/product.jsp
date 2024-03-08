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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <c:forEach var="p" items="${requestScope.listProduct}">
            <h1>${p.proName}</h1>
        </c:forEach>
    </body>
</html>
