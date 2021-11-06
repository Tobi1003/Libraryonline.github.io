<%-- 
    Document   : addBook
    Created on : Jul 2, 2020, 12:54:22 PM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="views/admin.css" rel="stylesheet" type="text/css"/>
        <link href="views/addbook.css" rel="stylesheet" type="text/css"/>
        <title>Add Book Page</title>
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
            <form action="MainController" method="POST">
                <div class="row">
                    <div class="col-25">
                        <label>Book ID</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtBookID" placeholder="Book ID"/></br>
                        <p style="color: red">${requestScope.ERROR.bookIDError}</p> &nbsp;
                    </div>  
                </div>

                <div class="row">
                    <div class="col-25">
                        <label>Book Name</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtBookName" placeholder="Book Name"/></br>            
                        <p style="color: red">${requestScope.ERROR.bookNameError}</p> &nbsp;
                    </div>  
                </div>

                <div class="row">
                    <div class="col-25">
                        <label>Price</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtPrice" placeholder="Price"/></br> 
                        <p style="color: red">${requestScope.ERROR.priceError}</p> &nbsp;
                    </div>  
                </div>

                <div class="row">
                    <div class="col-25">
                        <label>Quantity</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtQuantity" placeholder="Quantity"/></br> 
                        <p style="color: red">${requestScope.ERROR.quantityError}</p> &nbsp;
                    </div>  
                </div>

                <div class="row">
                    <div class="col-25">
                        <label>Description</label>
                    </div> 
                    <div class="col-75">
                        <input type="text" name="txtDescription" placeholder="Description"/></br>
                        <p style="color: red">${requestScope.ERROR.descriptionError}</p> &nbsp;
                    </div>  
                </div>    
                </br>
                <input type="submit" name="btnAction" value="Create"/>
            </form>
        </div>
        <a href="admin.jsp">Back to book management!</a>
    </body>
</html>
