<%-- 
    Document   : invalid.jsp
    Created on : Jul 14, 2020, 2:20:42 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Muli:400" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Passion+One" rel="stylesheet">
        <link href="views/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="views/error.css" rel="stylesheet" type="text/css"/>
        <title>404 Page</title>
    </head>
    <body>
        <div id="notfound">
            <div class="notfound-bg"></div>
            <div class="notfound">
                <div class="notfound-404">
                    <h1>404</h1>
                </div>
                <h2>Oops! Page Not Found</h2>
                <form class="notfound-search">
                    <input type="text" placeholder="Search...">
                    <button type="button">Search</button>
                </form>
                <div class="notfound-social">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-pinterest"></i></a>
                    <a href="#"><i class="fa fa-google-plus"></i></a>
                </div>
                <a href="login.html">Back To Login</a>
            </div>
        </div>
    </body>
</html>
