<%-- 
    Document   : Checkout
    Created on : May 9, 2021, 6:34:17 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Office Algorithm</title>
        <link rel="stylesheet" href="css/styleCust.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file = "custHeader.jsp"%>
        <div class="container2">
            <h2>Checkout</h2>
            <div class="content">
                <form action="registerAction.jsp">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">First Name</span>
                            <input type="text" placeholder="Jane" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Last Name</span>
                            <input type="text" placeholder="Doe" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="text" placeholder="jdoe@gmail.com" required>
                            <div id='invalidEmail' class="text-danger" style='display: none'>
                                <b>Not a valid email!</b>
                            </div>
                            <div id='validEmail' class="text-success" style='display: none'>
                                <b>Valid Email</b>
                            </div>
                        </div>

                        <div class="input-box" >
                            <span class="details">Card Number</span>
                            <input type="text" placeholder="1111-2222-3333-4444" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Exp Date</span>
                            <input type="text" placeholder="01/22" required>
                        </div>
                        <div class="input-box">
                            <span class="details">CCV</span>
                            <input type="text" placeholder="123" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input type="text" placeholder="123 Street Rd." required>
                        </div>
                        <div class="input-box">
                            <span class="details">Zip Code</span>
                            <input type="text" placeholder="12345" required>
                        </div>
                    </div>
                </form>
                <form action="Order.jsp">
                    <div class="button">
                        <input type="submit" value="Continue"> 
                    </div>
                </form>
            </div>
        </div>    
    </body>
    <%@include file = "custFooter.jsp"%>
</html>
