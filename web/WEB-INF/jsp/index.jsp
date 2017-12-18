<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>

        <h1>Katalog Product</h1>
        <table class="table table-responsive table-striped table-hover">
            <tr><th>no</th><th>name product</th><th>Price</th><th>Quantity</th></tr>
            <c:forEach var="i" items="${listproduct}">
                <tr>
                    <td>${i.productName}</td>
                    <td>${i.productPrice}</td>
                    <td>${i.productQuantity}</td>
                    <td><a href="${pageContext.request.contextPath}/shopcart/orderproduct/${i.id}"><button type="button" class="btn btn-primary">order</button></a></td>
                </tr>
            </c:forEach>

        </table>




        <a href="${pageContext.request.contextPath}/Product">Shopping</a>
    </body>
</html>
