<%-- 
    Document   : bookmanage
    Created on : Jun 30, 2020, 3:44:02 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Management Page</title>
        <link href="views/bookmanage.css" rel="stylesheet" type="text/css"/>
        <link href="views/admin.css" rel="stylesheet" type="text/css"/>
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
        <c:if test="${not empty requestScope.LISTBOOK}">
            <c:if test="${not empty requestScope.LISTBOOK}">
                <table border='1' id="customers">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>BookID</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Description</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" varStatus="counter" items="${requestScope.LISTBOOK}">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${list.bookID}</td>
                                <td>${list.bookName}</td>
                                <td>${list.price}</td>
                                <td>${list.quantity}</td>
                                <td>${list.description}</td>
                                <td>
                                    <form action="MainController">
                                        <input type="hidden" name="txtBookID" value="${list.bookID}" />
                                        <input type="hidden" name="txtBookName" value="${list.bookName}" />
                                        <input type="hidden" name="txtPrice" value="${list.price}" />
                                        <input type="hidden" name="txtQuantity" value="${list.quantity}"/>
                                        <input type="hidden" name="txtDescription" value="${list.description}"/>
                                        <input type="submit" name="btnAction" value="Update Book" />
                                    </form>
                                </td>
                                <td>
                                    <c:url var="delete" value="MainController">
                                        <c:param name="btnAction" value="Delete"></c:param>
                                        <c:param name="txtBookID" value="${list.bookID}"></c:param>
                                    </c:url>
                                    <a href="${delete}">Delete</a>                                    
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </c:if>
    </body>
</html>
