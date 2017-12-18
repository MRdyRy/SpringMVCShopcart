<%-- 
    Document   : editProfile
    Created on : 18-Dec-2017, 17:03:02
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

    <form:form action="profile/edit" modelAttribute="registerBean" role="form" method="Post">
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


</body>
</html>
