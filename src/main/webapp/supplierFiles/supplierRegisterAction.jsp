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
      String bName = request.getParameter("businessName");
      String username = request.getParameter("username"); 
      String email = request.getParameter("email"); 
      String pwd = request.getParameter("password"); 
      
      String sql = "INSERT INTO `supplier` values (0, '"+email+"', '"+username+"', '"+pwd+"', '"+bName+"', 'Pending')";
      DBConnect dbConnect = new DBConnect();
      dbConnect.updateDB(sql, "no");
      
      String sql1 = "SELECT SupplierID, Name FROM `supplier` where email = ? and password = ?";
      String[] result = dbConnect.isPwdValid(sql1, email, pwd);
      if (result[0].length() >= 6 && result[0].substring(0, 6).equals("Error:")) {
        session.setAttribute("logged", "supplierPortalLogin");
        response.sendRedirect("supplierRegister.jsp?error='" + result[0] + "'");
        out.print("Invalid login credentials!");
      } else {
        String supplierID = result[0];
        String businessName = result[1];
        session.setAttribute("logged", "supplier");
        session.setAttribute("id", supplierID);
        out.print("<div class='container boxedTitle darkToLightBottom'><h2 class='display-2'>Welcome, " + businessName + "!</h2></div>");
      }
      
    %>

    <div class='container boxedWhite centered'>
      <br><br>
      <h2 class='display-3'>Thank you for signing up!</h3>
      <br>
      <a href='supplierPortalHome.jsp'>Click Here to go to the Supplier Portal</a>
      <br>
    </div>
    <%@include file="footer.jsp" %>
  </body>
</html>
