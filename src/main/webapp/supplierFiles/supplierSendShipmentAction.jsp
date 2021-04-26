<%-- 
    Document   : myFormAction
    Created on : Oct 28, 2020, 4:11:51 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  </head>
  <body>
    <%@include file="header.jsp" %>
    <br>
    <br>
    <div class='container boxedTitle lightToDarkBottom centered'>
      <br><br>
      <h2 class='display-3'>Your shipment has been recorded and the stock number has been updated!</h2>
      <br>
      <br>
    </div>
    <div class="container boxedWhite centered">
      <br>
    <% 
      String stock = request.getParameter("stockSelect"); 
      String quant = request.getParameter("quant"); 
      String date = request.getParameter("date"); 
      // Update Stock
      DBConnect dbConnect = new DBConnect();
      out.print(dbConnect.createShipment(stock, quant, date, id));

    %>
      <br>
      <a href='supplierPortalHome.jsp'>Click Here to go to the Supplier Portal</a>
      <br>
      <br>
    </div>
    <br>
    <br>
    <%@include file="footer.jsp" %>
  </body>
</html>
