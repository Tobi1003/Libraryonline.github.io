<%-- 
    Document   : search
    Created on : Jul 4, 2020, 1:10:07 PM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="views/user.css" rel="stylesheet" type="text/css"/>
        <link href="views/bookmanage.css" rel="stylesheet" type="text/css"/>
        <link href="views/search.css" rel="stylesheet" type="text/css"/>
        <title>Library Online</title>
    </head>
    <body>

        <div class="header">
            <c:if test="${sessionScope.LOGIN_USER.roleID != 'US' }">
                <c:redirect url="login.html"></c:redirect>
            </c:if>
            <c:if test="${sessionScope.LOGIN_USER.roleID == 'US'}">
                <h1>Welcome: ${sessionScope.LOGIN_USER.fullName}</h1></br>
                <p>Library Online</p>
            </c:if>
        </div>
        <c:url var="Logout" value="MainController">
            <c:param name="btnAction" value="Logout"></c:param>
        </c:url>
        <c:url var="View" value="MainController">
            <c:param name="btnAction" value="View"></c:param>
        </c:url>
        <div class="navbar">
            <div class="search">
                <form action="MainController">
                    <input type="text" name="txtSearch" value="${param.txtSearch}" />
                    <input type="submit" name="btnAction" value="Search Book" />
                </form>
            </div>

            <a href="${View}" class="left">View Your Cart</a>
            <a href="${Logout}" class="right">Logout</a>
        </div>

        <c:if test="${requestScope.LIST_BOOKS != null}">
            <c:if test="${not empty requestScope.LIST_BOOKS}">
                <table border='1' id="customers">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Book ID</th>
                            <th>Book Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Description</th>
                            <th>Shopping</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" varStatus="counter" items="${requestScope.LIST_BOOKS}">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${list.bookID}</td>
                                <td>${list.bookName}</td>
                                <td>${list.price}</td>
                                <td>${list.quantity}</td>
                                <td>${list.description}</td>
                                <td>
                                    <form action="MainController">
                                        <input type="hidden" name="txtBookID" value="${list.bookID}"  />
                                        <input type="hidden" name="txtBookName" value="${list.bookName}"  />
                                        <input type="hidden" name="txtPrice" value="${list.price}"  />
                                        <input type="hidden" name="txtQuantity" value="${list.quantity}"  />
                                        <input type="hidden" name="txtDescription" value="${list.description}"  />
                                        <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                        <input type="submit" name="btnAction" value="Add To Cart" />
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </c:if>

        <h1>${requestScope.MESSAGE}</h1>
    </body>
</html>
