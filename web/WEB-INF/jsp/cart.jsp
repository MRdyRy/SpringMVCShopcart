<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Cart</title>
    </head>
    <body>

        <div align="center">
            <h1>Perkakas</h1>
            <table border="2" >
                <tr>
                    <th>Options</th>
                    <th >Id</th>
                    <th>Photo</th>
                    <th >Name</th>
                    <th >Price</th>
                    <th >Quantity</th>
                    <th >Sub Total</th>


                </tr>

                <c:set var="s" value="0"></c:set>
                <c:forEach var="pr" items="${sessionScope.cart.cartlist.values()}">
                    <c:set var="s" value="${s+ pr.product.productPrice * pr.quantity}"></c:set>
                        <tr>
                        <td><a href="${pageContext.request.contextPath}/shopcart/delete/${pr.product.id }" >Remove</a></td>
                        <td>${pr.product.id }</td>
                        <td>${pr.product.productImg}</td>
                        <td>${pr.product.productName }</td>
                        <td>${pr.product.productPrice }</td>
                        <td>${pr.quantity}</td>
                        <td>${pr.product.productPrice * pr.quantity}</td>
                    </tr>






                </c:forEach>

                <tr><td colspan="6" align="right">Sum</td>
                    <td>${s}</td>

                </tr>
            </table>
            <a href="${pageContext.request.contextPath}">Shoping</a>  <br>

        </div>



    </body>
</html>