<%-- 
    Document   : sidebar
    Created on : 17-Dec-2017, 16:17:11
    Author     : user
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="q" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Sidebar ================================================== -->
<div id="sidebar" class="span3">
    <div class="well well-small">
        <c:forEach var="pr" items="${sessionScope.cart.cartlist.values()}">
            <c:set var="s" value="${s+ pr.product.productPrice * pr.quantity}"></c:set>
            <c:set var="mn" value="${mn+ pr.quantity}"></c:set>
        </c:forEach>
        <a id="myCart" href="#"><a href="#cartList" role="button" data-toggle="modal"><img src="<c:url value="/resourcess/themes/images/ico-cart.png"/>" alt="cart">&nbsp;${mn} Items   
                <span class="badge badge-warning pull-right">

                    Rp. <q:formatNumber value="${s}"/>
                </span>
            </a>
        </a>
    </div>

    <ul id="sideManu" class="nav nav-tabs nav-stacked">
        <li class="subMenu open"><a> Handphone </a>
            <ul>
                <li><a class="active" href="${pageContext.request.contextPath}/Product/showAll/sony"><i class="icon-chevron-right"></i>Sony </a></li>
                <li><a href="${pageContext.request.contextPath}/Product/showAll/lenovo"><i class="icon-chevron-right"></i>Lenovo</a></li>
            </ul>
        </li>
        <li class="subMenu"><a> Kamera </a>
            <ul style="display:none">
                <li><a href="${pageContext.request.contextPath}/Product/showAll/canoncam"><i class="icon-chevron-right"></i>Canon</a></li>
                <li><a href="${pageContext.request.contextPath}/Product/showAll/panasoniccam"><i class="icon-chevron-right"></i>Panasonic</a></li>											
            </ul>
        </li>

        <li><a href="${pageContext.request.contextPath}">All Products</a></li>
    </ul>
    <br/>
    <c:forEach var="i" begin="0" end="2" step="1" items="${listproduct}">
        <div class="thumbnail">
            <img src="<c:url value="/resourcess/themes/images/products/${i.productImg}"/>" alt="${i.productDescription}"/>
            <div class="caption">
                <h5>${i.productName}</h5>
                <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/Product/detail/${i.id}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/shopcart/orderproduct/${i.id}">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">Rp. <q:formatNumber value="${i.productPrice}"/></a></h4>
            </div>
        </div><br/>
    </c:forEach>


    <div class="thumbnail">
        <img src="<c:url value="/resourcess/themes/images/payment_methods.png"/>" title="Bootshop Payment Methods" alt="Payments Methods">
        <div class="caption">
            <h5>Payment Methods</h5>
        </div>
    </div>
</div>
<!-- Sidebar end=============================================== -->
