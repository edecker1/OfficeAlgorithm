<%-- 
    Document   : custRegister
    Created on : May 3, 2021, 8:57:44 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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
            <h2>Register to save Payment and Shipping Info:</h2>
            <div class="content">
                <form action="registerAction.jsp">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">First Name</span>
                            <input type="text" placeholder="Jane" name="FirstName" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Last Name</span>
                            <input type="text" placeholder="Doe" name="LastName" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="text" placeholder="jdoe@gmail.com" name="Email" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password"  name="Password" required>
                        </div>
                        <div class="input-box" >
                            <span class="details">Card Number</span>
                            <input type="type" placeholder="1111-2222-3333-4444" name="CardNum" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Exp Date</span>
                            <input type="text" placeholder="01/22" name="ExpDate" required>
                        </div>
                        <div class="input-box">
                            <span class="details">CCV</span>
                            <input type="text" placeholder="123" name="CCV" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input type="text" placeholder="123 Street Rd." name="Address" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Zip Code</span>
                            <input type="text" placeholder="12345" name="Zip" required>
                        </div>
                    </div>

                    <div class="button">
                        <input type="submit" value="Register">
                    </div>
                </form>
            </div>
        </div>
    </body>
    <%@include file = "custFooter.jsp"%>
</html>
