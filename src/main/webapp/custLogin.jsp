<%-- 
    Document   : custLogin
    Created on : May 3, 2021, 8:57:31 PM
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
            <h2>Customer Login</h2>
            <div class="content">
                <form action="loginAction.jsp">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="text" name="Email" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" name="Password" required>
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="Login">
                    </div>
                </form>
            </div>
        </div>
           </body>
        <%@include file = "custFooter.jsp"%>
</html>

