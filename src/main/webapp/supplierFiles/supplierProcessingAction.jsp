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
      String orderID = request.getParameter("orderSelect"); 
      String status = request.getParameter("statusSelect"); 
      // Update Stock
      DBConnect dbConnect = new DBConnect();
      String sql = "UPDATE supplierorder SET status='"+status+"' WHERE sOrderID='"+orderID+"'";
      dbConnect.updateDB(sql, "no");
      
      response.sendRedirect("supplierOrderHistory.jsp");


    %>

    <%@include file="footer.jsp" %>
  </body>
</html>
