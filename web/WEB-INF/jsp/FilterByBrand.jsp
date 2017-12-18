<%-- 
    Document   : FilterByBrand
    Created on : 17-Dec-2017, 21:46:02
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        
        
        <!--header-->
        <div id="header">
            <div class="container">
                <div id="welcomeLine" class="row">
                    <div class="span6">Welcome!</div>
                    <div class="span6">
                        <div class="pull-right">
                            <c:forEach var="pr" items="${sessionScope.cart.cartlist.values()}">
                                <c:set var="s" value="${s+ pr.product.productPrice * pr.quantity}"></c:set>
                            </c:forEach>

                            <span class="btn btn-mini">Rp. ${s}</span>
                            <a href="#cartList" role="button" data-toggle="modal"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ ${sessionScope.cart.cartlist.size()} ] Items in cart </span> </a> 
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
                        <form class="form-inline navbar-search" method="post" action="products.html" >
                            <input id="srchFld" class="srchTxt" type="text" />

                            <select class="srchTxt">
                                <option>All</option>
                                <option>HANDPHONE </option>
                                <option>KAMERA</option>
                            </select> 
                            <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
                        </form>
                        <ul id="topMenu" class="nav pull-right">
                            <c:if test="${empty sessionScope.user}">
                                <a href="${pageContext.request.contextPath}"><li class="btn btn-primary" style="margin-top: 5px;">Home</li></a>
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
        <!--end header-->
        
        
        
        
        
        <div id="mainBody">
                <div class="container">
                    <div class="row">
                    <jsp:include page="sidebar.jsp"></jsp:include>
                    <jsp:include page="content.jsp"></jsp:include>
                    </div>
                </div>
            </div>
    </body>
</html>
