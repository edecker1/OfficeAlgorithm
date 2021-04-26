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
    <% 
      String name = request.getParameter("itemName");
      String category = request.getParameter("itemCategory"); 
      String cost = request.getParameter("itemCost");
      String price = "$" + cost;
      
      // Insert item into stock table
      String sql = "INSERT INTO `stock` VALUES (0, '"+name+"', '"+price+"', 0, '"+category+"')";
      DBConnect dbConnect = new DBConnect();
      dbConnect.updateDB(sql, "yes");
      
      // Insert into supplier stock table
      String stockID = dbConnect.returnStockID(name);
      String sql2 = "INSERT INTO `supplierstock` VALUES (0, '"+id+"', '"+stockID+"')";
      dbConnect.updateDB(sql2, "yes");
      

      
    %>
    <br>
    <br>
    <div class='container boxedTitle lightToDarkBottom centered'>
      <br><br>
      <h2 class='display-3'>Your Item Has Been Added to the System!</h2>
      <br>
      <br>
    </div>
    <div class="container boxedWhite centered">
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
