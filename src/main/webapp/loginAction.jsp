<%-- 
    Document   : loginAction
    Created on : May 8, 2021, 7:11:04 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Status</title>
        <%@include file = "custHeader.jsp"%>
    </head>
    <body>
        <br>
        <br>
        <br>
        <%
            String Email = request.getParameter("Email");
            String Password = request.getParameter("Password");
            DBConnect dbConnect = new DBConnect();

            String sql7 = "SELECT FirstName, LastName, Address, Zip, ExpDate FROM `customer` WHERE Email = ? and Password = ?";
            String[] result = dbConnect.isPwdValid(sql7, Email, Password);
            if (result[0].length() >= 6 && result[0].substring(0, 6).equals("Error:")) {
                out.print("Invalid login credentials!");
            } else {
                String FirstName = result[0];
                String Address = result[2];
                String Zip = result[3];
                String ExpDate = result[4];
                
                out.println("Welcome, " + FirstName + "! You have successfully logged in. ");

                out.println("Address on File: " + Address + ", " + Zip + ". ");

                out.println("Card with Exp: " + ExpDate + ". ");
            }
        %>
        <br>
        <br>
        <br>
        <br>
        <br>
        <form action="Order.jsp">
                <input type="submit" value="Continue"> 
        </form>

        <br>
        <br>
        <br>
        <br>
    </body>
    <%@include file = "custFooter.jsp"%>
</html>
