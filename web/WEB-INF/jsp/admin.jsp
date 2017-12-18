<%-- 
    Document   : admin
    Created on : 17-Dec-2017, 20:42:50
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="mainBody">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <a href="#inputProduct"><button class="btn btn-lg btn-primary">Input Data Barang</button></a>
                            <a href="#showProduct" role="button" data-toggle="modal"><button class="btn btn-lg btn-primary">Show Data Barang</button></a>
                            <a href="#saleProduct"><button class="btn btn-lg btn-primary">Penjualan product</button></a>

                        </div>
                        <hr/>
                        <div class="container" style="height: 500px">

                            <div id="showProduct" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <br/>
                                    <center><h3><Span class="icon-shopping-cart icon-white"></span> CartList</h3></center>
                                </div>
                                <div class="modal-body">
                                    <center> 
                                        <table class="table table-responsive table-bordered table-striped table-hover">
                                            <tr>
                                                <th>No</th><th>Nama Barang</th><th>Qty</th><th>Harga Satuan</th><th>Opsi</th>
                                            </tr>
                                            <c:forEach var="cart" varStatus="i" items="${sessionScope.cart.cartlist.values()}">
                                            <c:set var="z" value="${z+ cart.product.productPrice * cart.quantity}"></c:set>
                                            <tr>
                                                <td>${i.count}</td><td>${cart.product.productName}</td><td>${cart.quantity}</td><td>${cart.product.productPrice}</td><td><a href="${pageContext.request.contextPath}/shopcart/delete/${cart.product.id}"><button type="button">Remove</button></a></td>
                                            </tr>

                                        </c:forEach>
                                        <tr>
                                            <td colspan="3">Grand Total</td><td colspan="2">${z}</td>
                                        </tr>
                                    </table>

                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>

                                </center>
                            </div>
                        </div>







                        <div id="showProduct" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <br/>
                                <center><h3><Span class="icon-shopping-cart icon-white"></span> CartList</h3></center>
                            </div>
                            <div class="modal-body">
                                <center> 
                                    <table class="table table-responsive table-bordered table-striped table-hover">
                                        <tr>
                                            <td>Nama Barang </td><td><form:input path="productName" name=""></form:input></td>
                                        </tr>
                                        <tr>
                                            <td>Harga Barang </td><td><form:input path="productPrice" name=""></form:input></td>
                                        </tr>
                                        <tr>
                                            <td>Deskripsi</td><td><form:input path="productDescription" name=""></form:input></td>
                                        </tr>
                                        <tr>
                                            <td>Image Product </td><td></td>
                                        </tr>
                                    </table>

                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>

                                </center>
                            </div>
                        </div>




                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
