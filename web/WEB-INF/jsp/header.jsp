<%-- 
    Document   : header
    Created on : 17-Dec-2017, 12:01:46
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="v" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>OnCube Online Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
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
        <div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">
                    <c:if test="${sessionScope.user.levelUser == 1}">
                        <div class="span6">Welcome Admin !</div>
                    </c:if>
                    <c:if test="${sessionScope.user.levelUser == 2 }">
                            <div class="span6">Welcome!</div>
                    </c:if>
                    
                    <div class="span6">
                        <div class="pull-right">
                            <c:forEach var="pr" items="${sessionScope.cart.cartlist.values()}">
                                <c:set var="s" value="${s+ pr.product.productPrice * pr.quantity}"></c:set>
                                <c:set var="qw" value="${qw + pr.quantity}"></c:set>
                            </c:forEach>

                            <span class="btn btn-mini">Rp. <v:formatNumber value="${s}"/></span>
                            <a href="#cartList" role="button" data-toggle="modal"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ ${qw} ] Items in cart </span> </a> 
                        </div>
                    </div>
                </div>
                <!-- Navbar ================================================== -->
                <div id="logoArea" class="navbar">
                    <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="navbar-inner">
                        <a class="brand" href="${pageContext.request.contextPath}/welcome"><img src="<c:url value="/resourcess/themes/images/logo3.png"/>" alt="Bootsshop"/></a>
                        <form class="form-inline navbar-search" method="post" action="${pageContext.request.contextPath}/welcome/search" >
                            <input id="srchFld" class="srchTxt" type="text" name="keyword" />

                            <a href="${pageContext.request.contextPath}/search?"><button type="submit" id="submitButton" class="btn btn-primary">Go</button></a>
                        </form>
                        <ul id="topMenu" class="nav pull-right">
                            <c:if test="${empty sessionScope.user}">
                                <li class="">
                                    <a href="#regist" data-toggle="modal">Register</a>
                                    <div id="regist" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="regist" aria-hidden="false" >
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <center><h3>Register</h3></center>
                                        </div>
                                        <div class="modal-body">
                                            <center> 
                                                <form:form action="welcome/save" modelAttribute="registerBean" role="form" method="Post">
                                                    <div class="control-group">
                                                        <form:label path="firstName">First Name</form:label>
                                                        <form:input path="firstName" class="form-control" required="true"/>
                                                    </div>
                                                    <div class="control-group">
                                                        <form:label path="lastName">Last Name</form:label>
                                                        <form:input path="lastName" class="form-control" required="true"/>
                                                    </div>
                                                    <div class="control-group">
                                                        <form:label path="userName">Username</form:label>
                                                        <form:input path="userName" class="form-control" required="true"/>
                                                    </div>
                                                    <div class="control-group">
                                                        <form:label path="password">Password</form:label>
                                                        <form:password path="password" class="form-control" required="true"/>
                                                    </div>
                                                    <form:select path="levelUser" class="form-control" required="true">

                                                        <form:option label="Pedagang" value="1"></form:option>
                                                        <form:option label="Pembeli" value="2"></form:option>
                                                    </form:select>
                                                    <p>
                                                        <form:button name="submitButton" value="Submit" class="btn btn-md btn-primary">Submit</form:button>
                                                        </p>
                                                </form:form>



                                            </center>
                                        </div>
                                    </div>

                                </li>


                                <li class="">
                                   
                                    <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
                                    <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <center><h3>Login</h3></center>
                                        </div>
                                        <div class="modal-body">
                                            <center> 
                                                <form:form class="form-horizontal loginFrm" action="welcome/validation" modelAttribute="loginBean" role="form" method="Post">

                                                    <div class="control-group">								
                                                        <form:input path="username" class="form-control" required="true" placeholder="username"/>
                                                    </div>
                                                    <div class="control-group">
                                                        <form:password path="password" class="form-control" required="true" placeholder="password"/>
                                                    </div>
                                                    <div class="control-group">
                                                    </div>
                                                    <form:button name="submitButton" value="Submit" class="btn btn-md btn-success">Login</form:button>
                                                        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                                </form:form>
                                            </center>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                                <li class="dropdown">
                                <li><a href="${pageContext.request.contextPath}/profile/${user.id}" style="text-transform: capitalize"><span class="glyphicon glyphicon-user"></span> &nbsp;<b>${user.userName}</b></a></li>
                                <li><a href="${pageContext.request.contextPath}/welcome/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;<b>Logout</b></a></li>

                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End====================================================================== -->



        <div id="cartList" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <br/>
                <center><h3><Span class="icon-shopping-cart icon-white"></span> CartList</h3></center>
            </div>
            <div class="modal-body">
                <center> 
                    <table class="table table-responsive table-bordered table-striped table-hover">
                        <tr>
                            <th>No</th><th>Nama Barang</th><th>Qty</th><th>Harga Satuan</th><th>Sub Total</th><th>Opsi</th>
                        </tr>
                        <c:forEach var="cart" varStatus="i" items="${sessionScope.cart.cartlist.values()}">
                            <c:set var="z" value="${z+ cart.product.productPrice * cart.quantity}"></c:set>
                                <tr>
                                    <td>${i.count}</td><td>${cart.product.productName}</td><td>${cart.quantity}</td><td>${cart.product.productPrice}</td><td>${cart.product.productPrice * cart.quantity}</td><td><a href="${pageContext.request.contextPath}/shopcart/delete/${cart.product.id}"><button type="button">Remove</button></a></td>
                            </tr>

                        </c:forEach>
                        <tr>
                            <td colspan="4">Grand Total</td><td colspan="2">${z}</td>
                        </tr>
                    </table>
                            <c:if test="${empty sessionScope.user}">
                                <button class="btn btn-primary" onclick="alert('Anda harus Login untuk lanjut ke proses checkout');">Checkout</button>
                            </c:if>
                            <c:if test="${not empty sessionScope.user}">
                                <a href="${pageContext.request.contextPath}/checkout/check"><button class="btn btn-primary">Checkout</button></a>
                            </c:if>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>

                </center>
            </div>
        </div>






        <!---this the js to run animation-->
        <script src="<c:url value="/resourcess/themes/js/jquery.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resourcess/themes/js/bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resourcess/themes/js/google-code-prettify/prettify.js"/>"></script>
        <script src="<c:url value="/resourcess/themes/js/bootshop.js"/>"></script>
        <script src="<c:url value="/resourcess/themes/js/jquery.lightbox-0.5.js"/>"></script>
        <!--- end js blok---->
