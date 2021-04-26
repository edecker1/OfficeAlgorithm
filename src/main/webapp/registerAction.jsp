<%-- 
    Document   : registerAction
    Created on : May 4, 2021, 5:37:14 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file = "custHeader.jsp"%>
    </head>
    <body>
        <%
            String FirstName = request.getParameter("FirstName");
            String LastName = request.getParameter("LastName");
            String Email = request.getParameter("Email");
            String Password = request.getParameter("Password");
            String CardNum = request.getParameter("CardNum");
            String ExpDate = request.getParameter("ExpDate");
            String CCV = request.getParameter("CCV");
            String Address = request.getParameter("Address");
            String Zip = request.getParameter("Zip");

            String sql22 = "insert into customer values (0, '" + Email + "', '" + Password + "', '"
                    + FirstName + "','" + LastName + "','" + CardNum + "','" + ExpDate + "',"
                    + "'" + CCV + "', '" + Address + "', '" + Zip + "')";
            DBConnect dbConnect = new DBConnect();
        %> 
        <h2><%= dbConnect.updateDB(sql22, "Registration Sucessful")%></h2>
        <br>
        <br>
        <br>
        <br>
        <h3>    Registration Successful</h3>
        <br>
        <br>
        <br>
        <br>
    </body>
    <%@include file = "custFooter.jsp"%>
</html>
