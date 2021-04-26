<%-- 
    Document   : custCartAction
    Created on : May 3, 2021, 8:58:25 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file = "custHeader.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="styleCust.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    </head>
    <body>
        <h2>Cart</h2>
        <br>
        <br>

        <h4>Black Stapler   $10.99</h4>
        
        <br>
        <br>
        <form action="Checkout.jsp">
            <button type="submit">Checkout as Guest</button>
        </form>

        <form action="custLogin.jsp">
            <button type="submit">Login for easy Checkout</button>
        </form>

    </body>
    <%@include file = "custFooter.jsp"%>
</html>
