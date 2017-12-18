<%-- 
    Document   : detailProduct
    Created on : 18-Dec-2017, 08:40:12
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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

<table class="table table-responsive table-bordered" style="margin-bottom: 150px;">
    <tr>
        <td><img src="<c:url value="/resourcess/themes/images/products/${product.productImg}"/>"/></td>
    </tr>
    <tr>
        <td>Nama Product</td><td>${product.productName}</td>
    </tr>
    <tr>
        <td>Deskripsi</td><td>${product.productDescription}</td>
    </tr>
    <tr>
        <td>Harga</td><td>${product.productPrice}</td>
    </tr>
    <tr>
        <td><a class="btn" href="${pageContext.request.contextPath}/shopcart/orderproduct/${product.id}">Add to <i class="icon-shopping-cart"></i></a></td>
    </tr>
</table>

<jsp:include page="footer.jsp"></jsp:include>