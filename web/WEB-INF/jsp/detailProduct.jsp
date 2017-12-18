<%-- 
    Document   : detailProduct
    Created on : 18-Dec-2017, 08:40:12
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
    <div id="mainBody">
        <div class="container">
            <div class="row">
            <jsp:include page="sidebar.jsp"></jsp:include>
            <table class="table table-responsive table-bordered">
                <tr>
                    <td>Nama Product</td><td>${product.productName}</td>
                </tr>
                <tr>
                    <td>Deskripsi</td><td>${product.productDescription}</td>
                </tr>
                <tr>
                    <td>Harga</td><td>${product.productPrice}</td>
                </tr>
            </div>
        </div>
    </div>

<jsp:include page="footer.jsp"></jsp:include>