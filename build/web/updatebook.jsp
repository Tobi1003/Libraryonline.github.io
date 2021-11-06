<%-- 
    Document   : updatebook
    Created on : Jul 1, 2020, 1:36:54 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="views/addbook.css" rel="stylesheet" type="text/css"/>
        <link href="views/admin.css" rel="stylesheet" type="text/css"/>
        <link href="views/update.css" rel="stylesheet" type="text/css"/>
        <title>Update Page</title>
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
        <div class="container">
            <form action="MainController">
                <div class="row">
                    <div class="col-25">
                        <label>Book ID</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtBookID" value="${param.txtBookID}" readonly="true" /></br>
                    </div>  
                </div>

                <div class="row">
                    <div class="col-25">
                        <label>Book Name</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtBookName" value="${param.txtBookName}" /></br>            
                    </div>  
                </div>

                <div class="row">
                    <div class="col-25">
                        <label>Price</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtPrice" value="${param.txtPrice}" /></br> 
                    </div>  
                </div>

                <div class="row">
                    <div class="col-25">
                        <label>Quantity</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtQuantity" value="${param.txtQuantity}" /></br> 
                    </div>  
                </div>

                <div class="row">
                    <div class="col-25">
                        <label>Description</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtDescription" value="${param.txtDescription}" /></br>
                    </div>  
                </div>    
                </br>

                <input type="submit" name="btnAction" value="Update"/>
            </form>
        </div>
        <div id="cus">
            <a href="admin.jsp" >Back To Book Management</a>
        </div>
    </body>
</html>
