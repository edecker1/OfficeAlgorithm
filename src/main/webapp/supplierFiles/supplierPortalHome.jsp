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
    <% // session control
      if (logged == null || logged.equals("supplierPortalLogin")) {
        // If not logged in, send them to login screen
        response.sendRedirect("supplierPortalLogin.jsp");
      } 
    %>
    
    <%
      String sql = "SELECT `Approval` FROM `supplier` WHERE SupplierID = '"+id+"' ";
      DBConnect dbConnect = new DBConnect();
      String status = dbConnect.returnSupplierStatus(sql);
      
      if (status.equals("Pending")){
        out.print("<br><br><div class='container boxedBig darkToLightRight text-light'>"
        + "<br><h3>Welcome to the Supplier Portal</h3><br><br>"
        + "<h4>Sorry, but the admin has not approved your account just yet.</h4>"
        + "<br><br>"
        + "</div>");
      } else if (status.equals("Approved")){
        out.print("<br><br><div class='container boxedBig darkToLightRight text-light'>"
        + "<br><h3>Welcome to the Supplier Portal</h3><br><br>"
        + "<h4>Your supplier account has been approved!</h4>"
        + "<br><br>"
        + "</div>"
        + "<div class='container boxedWhite centered'>"
        + "<br><br><h4>Using the Navigation menu above, you can carry out actions such as:</h4><br>"
        + "<p>Add items into the system</p><br>"
        + "<p>Process shipments of stock</p><br>"
        + "<p>View the current status of stock in stores</p>"
        + "<br><br>"
        + "</div><br><br>");
      } else if (status.equals("Rejected")){
        out.print("<br><br><div class='container boxedBig darkToLightRight text-light'>"
        + "<br><h3>Welcome to the Supplier Portal</h3><br><br>"
        + "<h4>Sorry, but the admin has rejected your account!</h4>"
        + "<br><br>"
        + "</div>");
      } else {
        out.print("<br><br><div class='container boxedBig darkToLightRight text-light'>"
        + "<br><h3>There is an error</h3><br><br>"
        + "<h4>The status this function recieved is: "+status+"</h4>"
        + "<br><br>"
        + "</div>");
      }
      
      
      %>

    <%@include file="footer.jsp" %>
  </body>
</html>

    
