<%-- 
    Document   : checkout
    Created on : 17-Dec-2017, 22:30:35
    Author     : user
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <!-- Bootstrap style --> 
        <link id="callCss" rel="stylesheet" href="<c:url value="/resourcess/themes/bootshop/bootstrap.min.css"/>" media="screen"/>
        <link href="<c:url value="/resourcess/themes/css/base.css"/>" rel="stylesheet" media="screen"/>
        <!-- Bootstrap style responsive -->	
        <link href="<c:url value="/resourcess/themes/css/bootstrap-responsive.min.css"/>" rel="stylesheet"/>
        <link href="<c:url value="/resourcess/themes/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
        <!-- Google-code-prettify -->	
        <link href="<c:url value="/resourcess/themes/js/google-code-prettify/prettify.css"/>" rel="stylesheet"/>
        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="<c:url value="/resourcess/themes/images/ico/favicon.ico"/>">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/resourcess/themes/images/ico/apple-touch-icon-144-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/resourcess/themes/images/ico/apple-touch-icon-114-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value="/resourcess/themes/images/ico/apple-touch-icon-72-precomposed.png"/>">
        <link rel="apple-touch-icon-precomposed" href="<c:url value="/resourcess/themes/images/ico/apple-touch-icon-57-precomposed.png"/>">
        <style type="text/css" id="enject"></style>


    </head>
    <body>
    <center class="container"> 
        <h2>TERIMAKASI TELAH BELANJA </h2>
        <table class="table table-responsive table-bordered table-striped table-hover">
            <tr>
                <th>No</th><th>Nama Barang</th><th>Qty</th><th>Harga Satuan</th><th>Sub Total</th>
            </tr>
            <c:forEach var="carts" varStatus="k" items="${sessionScope.cartlast.cartlist.values()}">
                <c:set var="z" value="${z+ carts.product.productPrice * carts.quantity}"></c:set>
                    <tr>
                        <td>${k.count}</td><td>${carts.product.productName}</td><td>${carts.quantity}</td><td>${carts.product.productPrice}</td><td>${carts.product.productPrice * carts.quantity}</td>
                </tr>

            </c:forEach>
            <tr>
                <td colspan="4">Grand Total</td><td colspan="2">${total}</td>
            </tr>
        </table>

        <c:forEach var="i" items="${data}">
            ${i.productName}
        </c:forEach>

        <a href="${pageContext.request.contextPath}/welcome"><button class="btn" data-dismiss="modal" aria-hidden="true">Lanjutkan Belanja</button></a>

    </center>
</body>
</html>
