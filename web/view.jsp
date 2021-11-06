<%-- 
    Document   : view
    Created on : Jul 5, 2020, 2:01:38 PM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="views/update.css" rel="stylesheet" type="text/css"/>
        <link href="views/bookmanage.css" rel="stylesheet" type="text/css"/>
        <link href="views/user.css" rel="stylesheet" type="text/css"/>
        <title>Cart View</title>
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

        <h1>Your Selected Book: </h1>
        <c:set var="total" value="0"></c:set>
        <c:set var="cart" value="${sessionScope.CART}"></c:set>

        <c:if test="${cart != null}"> 
            <table border="1" id="customers">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Book ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" varStatus="counter" items="${cart.cart.values()}">

                    <input type="hidden" name="" value="${total = total + dto.price * dto.quantity}" />
                    <form action="MainController">
                        <tr>
                            <td>
                                ${counter.count}
                            </td>
                            <td>
                                ${dto.bookID}
                            </td>
                            <td>
                                ${dto.bookName}
                            </td>
                            <td>
                                ${dto.price}
                            </td>
                            <td>
                                <input type="number" name="txtQuantity" value="${dto.quantity}" />
                            </td>
                            <td>
                                ${dto.price * dto.quantity}
                            </td>
                            <td>
                                <input type="hidden" name="txtBookID" value="${dto.bookID}" />
                                <input type="submit" value="Delete Book" name="btnAction"/>
                            </td>
                            <td>                            
                                <input type="submit" value="Update Book Cart" name="btnAction"/>
                            </td>
                        </tr>
                    </form>
                </c:forEach>

            </tbody>
        </table>
        <h1>Total: ${total}</h1>  
        <div id="cus" >
            <form action="MainController">
                <input type="hidden" name="txtTotal" value="${total}" />
                <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                <input type="submit" name="btnAction" value="Checkout"/>
            </form>
        </div>
    </c:if>   
    <c:if test="${cart == null}">
        <h1 style="color: red">"Your cart is empty.. Please borrow book first!"</h1>
    </c:if>

    <div id="cus">
        <a href="search.jsp">Back to Library</a>
    </div>
    <div>
        <h1>${requestScope.MESSAGE}</h1>
    </div>
</body>
</html>
