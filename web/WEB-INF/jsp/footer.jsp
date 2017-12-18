<%-- 
    Document   : footer
    Created on : 17-Dec-2017, 16:46:14
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Footer ================================================================== -->
<div  id="footerSection">
    <div class="container">
        <div class="row">
            <div class="span3">
                <h5>ACCOUNT</h5>
                <a href="#login">YOUR ACCOUNT</a>
                <a href="#login">PERSONAL INFORMATION</a>
                <a href="#login">ORDER HISTORY</a>
            </div>
            <div class="span3">
                <h5>INFORMATION</h5>
                <a href="#contact">CONTACT</a>  
                <a href="#regist">REGISTRATION</a>
            </div>
            <div class="span3">
                <h5>KATEGORI</h5> 
                <a href="#">HANDPHONE</a>  
                <a href="#">KAMERA</a> 
            </div>
            <div id="socialMedia" class="span3 pull-right">
                <h5>SOCIAL MEDIA </h5>
                <a href="#"><img width="60" height="60" src="<c:url value="/resourcess/themes/images/facebook.png"/>" title="facebook" alt="facebook"/></a>
                <a href="#"><img width="60" height="60" src="<c:url value="/resourcess/themes/images/twitter.png"/>" title="twitter" alt="twitter"/></a>
            </div> 
        </div>
        <p class="pull-right">&copy; OnCube</p>
    </div><!-- Container End -->
</div>
