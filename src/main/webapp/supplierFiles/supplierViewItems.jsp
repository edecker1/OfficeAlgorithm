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
      if (logged == null || logged.equals("index")) {
        response.sendRedirect("index.jsp");
      } else {
        // Check approval
        if (approval == null){
          // redirect if null
          response.sendRedirect("supplierPortalHome.jsp");
        } else if (approval.equals("Approved")){
          // pass if they are approved
        }else {
          // if not approved, redirect
          response.sendRedirect("supplierPortalHome.jsp");
        }

      }
    %>
    <br>
    <br>
    <div class='container boxedTitle lightToDarkBottom'>
      <br>
      <h3>Viewing Supplier Items</h3>
      <br>
    </div>
    <div class="container centered boxedWhite ">
      <br>
      <p>Here you can view the items that you are currently supplying the store.</p>
      <br>
      <p>You can see which ones are in need of more shipments.</p>
      <br>
      
    </div>
    <div class='boxedWhite container'>
      <br>
      <br>
    <%
      DBConnect dbConnect = new DBConnect();  
      out.print(dbConnect.createStockTable(id));
      %>
      <br>
      <br>
    </div>
      <br><br>
      

    <%@include file="footer.jsp" %>
  </body>
</html>

    
