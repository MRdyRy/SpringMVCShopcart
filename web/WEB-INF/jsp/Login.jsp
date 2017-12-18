<%-- 
    Document   : Login
    Created on : 17-Dec-2017, 10:52:00
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
    <form:form action="Login/validation" modelAttribute="loginBean" role="form" method="Post">
        <form:input path="username" class="form-control" required="true" placeholder="username"/><br/>
        <form:password path="password" class="form-control" required="true" placeholder="password"/><br/>
        <p>
        <form:button name="submitButton" value="Submit" class="btn btn-md btn-primary">Login</form:button>
    </p>
</form:form>
</body>
</html>
