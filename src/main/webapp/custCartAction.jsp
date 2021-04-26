<%-- 
    Document   : custCartAction
    Created on : May 4, 2021, 6:15:33 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%       
            String Name = request.getParameter("Name");
            String sql9 = "SELECT * FROM `stock` WHERE Name='"+Name+"'";

            
            
        %>
    </body>
</html>
