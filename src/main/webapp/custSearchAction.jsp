<%-- 
    Document   : custSearchAction
    Created on : May 4, 2021, 4:30:31 AM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
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
        <%
            String Name = request.getParameter("Name");
            String sql = "SELECT Name, Cost FROM `stock` WHERE Name = '" + Name + "' ";
            out.print(sql);
            DBConnect dbConnect = new DBConnect();
            out.print(dbConnect.search(sql, Name));
        %>

        
    </body>
    <%@include file = "custFooter.jsp"%>

</html>
