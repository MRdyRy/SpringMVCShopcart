<%-- 
    Document   : profile
    Created on : 17-Dec-2017, 16:52:54
    Author     : user
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <style>
                        tr,td{padding: 10px;margin: 10px;}
                    </style>

                    <section id="profile" class="container" style="margin-left: auto; padding-left: 0px;">
                            <div class="panel panel-default panel-danger">
                                <h2 style="margin-left: 300px;">Profile</h2>
                                <hr/>
                                <table class="" style="margin-left: 300px;">
                                    <tr>
                                        <td colspan="3"><img height="100px" width="100px" src="<c:url value="/resourcess/person-flat.png"/>"/></td>
                                    </tr>
                                    
                                <tr>
                                        <td>Nama</td><td>:</td><td>${user.firstName}&nbsp;${user.lastName}</td>
                                </tr>
                                <tr>
                                    <td>UserName</td><td>:</td><td>${user.userName}</td>
                                </tr>
                                <tr><td>Password</td><td>:</td><td>${user.password}</td></tr>
                                <tr>
                                    <td><a href="${pageContext.request.contextPath}/profile/edit/${user.id}"><button>Edit Profile</button></a></td><td></td><td></td>
                                </tr>
                            </table>
                        </div>
                    </section>

                </div>
            </div>
        </div>
    </body>
</html>
