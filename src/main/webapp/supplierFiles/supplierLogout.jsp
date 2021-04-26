<%-- 
    Document   : customer
    Created on : Feb 16, 2021, 2:07:19 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
<!DOCTYPE html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="header.jsp" %>
    <title>Log Out</title>
  </head>
  <body>
    <br>
    <div class='container boxedTitle darkToLightBottom'>
      <h3>Are you sure you want to log out?</h3>
      <br>
    </div>
    <div class='container boxedWhite centered'>
      <br>
      <form action='supplierLogoutAction.jsp'>
        <button type='submit' class='button submitButton'>Log Out</button>
      </form>
      <br>
    </div>
      
    
    <%@include file="footer.jsp" %>