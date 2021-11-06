<%-- 
    Document   : admin
    Created on : Jun 29, 2020, 4:57:32 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="views/admin.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <div class="header">
            <c:if test="${sessionScope.LOGIN_USER.roleID != 'AD' }">
                <c:redirect url="login.html"></c:redirect>
            </c:if>
            <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
                <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1></br>
                <p>Book Management System</p>
            </c:if>
        </div>
        <c:url var="Logout" value="MainController">
            <c:param name="btnAction" value="Logout"></c:param>
        </c:url>
        <c:url var="BookManage" value="MainController">
            <c:param name="btnAction" value="Book Manage"></c:param>
        </c:url>
        <c:url var="AddNewBook" value="MainController">
            <c:param name="btnAction" value="Add New Book"></c:param>
        </c:url>
        
        <div class="navbar">
            <a href="${BookManage}">Book Manage</a>
            <a href="${AddNewBook}">Add New Book</a>
            <a href="${Logout}" class="right">Logout</a>
        </div>
    </body>
</html>
