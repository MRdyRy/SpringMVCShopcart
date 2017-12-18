<%-- 
    Document   : FilterByBrand
    Created on : 17-Dec-2017, 21:46:02
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <jsp:include page="sidebar.jsp"></jsp:include>
                    <jsp:include page="content.jsp"></jsp:include>
                    </div>
                </div>
            </div>
    </body>
</html>
