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
      String orderID = request.getParameter("id"); 
      String status = request.getParameter("fulfill"); 
      String date = request.getParameter("newDate"); 
      // Update Stock
      DBConnect dbConnect = new DBConnect();
      String sql = "UPDATE supplierorder SET status='"+status+"', shipmentDate='"+date+"'  WHERE sOrderID='"+orderID+"'";
      out.print(dbConnect.updateDB(sql, "yes"));
      
      response.sendRedirect("supplierOrderHistory.jsp");


    %>

    <%@include file="footer.jsp" %>
  </body>
</html>
