<%-- 
    Document   : content
    Created on : 17-Dec-2017, 16:38:30
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="nx" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>




<div class="span9">		
    <div class="well well-small">
        <h4>Featured Products <small class="pull-right">${listproduct.size()} &nbsp;featured products</small></h4>
        <div class="row-fluid">
            <div id="featured" class="carousel slide">
                <div class="carousel-inner">
                    <div class="item active">
                        <ul class="thumbnails">
                            <c:forEach var="p" begin="1" end="4" step="1" items="${listproduct}">
                                <li class="span3">
                                    <div class="thumbnail">
                                        <i class="tag"></i>
                                        <a  href="${pageContext.request.contextPath}/Product/detail/${p.id}"><img src="<c:url value="/resourcess/themes/images/products/${p.productImg}"/>" alt=""/></a>
                                        <div class="caption">
                                            <h5>${p.productName}</h5>
                                            <h4><a class="btn" href="${pageContext.request.contextPath}/Product/detail/${p.id}">VIEW</a> <span class="pull-right">Rp. <nx:formatNumber value="${p.productPrice}"/></span></h4>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    
                    <div class="item">
                        <ul class="thumbnails">
                            <c:forEach var="p" begin="4" end="8" items="${listproduct}" step="1">
                                <li class="span3">
                                    <div class="thumbnail">
                                        <i class="tag"></i>
                                        <a  href="${pageContext.request.contextPath}/Product/detail/${p.id}"><img src="<c:url value="/resourcess/themes/images/products/${p.productImg}"/>" alt=""/></a>
                                        <div class="caption">
                                            <h5>${p.productName}</h5>
                                            <h4><a class="btn" href="${pageContext.request.contextPath}/Product/detail/${p.id}">VIEW</a> <span class="pull-right">Rp. <nx:formatNumber value="${p.productPrice}"/></span></h4>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    
                    
                    
                </div>
                <a class="left carousel-control" href="#featured" data-slide="prev">‹</a>
                <a class="right carousel-control" href="#featured" data-slide="next">›</a>
            </div>
        </div>
    </div>    
</div>







    <h4>Latest Products </h4>
    <ul class="thumbnails">

        <c:forEach var="p" items="${listproduct}">
            <li class="span3">
                <div class="thumbnail">

                    <!--this is the section to show data from database-->

                    <a  href="${pageContext.request.contextPath}/Product/detail/${p.id}"><img src="<c:url value="/resourcess/themes/images/products/${p.productImg}"/>" alt=""/></a>

                    <!--end sec show-->

                    <!--  href="product_details.html"><img src=""themes/images/products/6.jpg"/>" alt=""/></a-->
                    <div class="caption">
                        <h5>${p.productName}</h5>
                        <p> 
                            ${p.productDescription} 
                        </p>

                        <h4 style="text-align:center"><a class="btn" href="${pageContext.request.contextPath}/Product/detail/${p.id}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="${pageContext.request.contextPath}/shopcart/orderproduct/${p.id}">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">Rp. <nx:formatNumber value="${p.productPrice}"/></a></h4>
                    </div>
                </div>
            </li>
        </c:forEach>

    </ul>	

</div>