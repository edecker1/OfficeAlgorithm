<%-- 
    Document   : myFormAction
    Created on : Oct 28, 2020, 4:11:51 PM
    Author     : super computer 2.0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect, java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  </head>
  
    <%@include file="header.jsp" %>
    <%
      String username = request.getParameter("username"); 
      String pwd = request.getParameter("password"); 
      DBConnect dbConnect = new DBConnect();
      
      String sql1 = "SELECT SupplierID, Name, Approval FROM `supplier` WHERE UserName = ? and Password = ?";
      String[] result = dbConnect.isPwdValid(sql1, username, pwd);
      if (result[0].length() >= 6 && result[0].substring(0, 6).equals("Error:")) {
        session.setAttribute("logged", "index");
        response.sendRedirect("index.jsp?error='" + result[0] + "'%%InvalidLogin");
        out.print("Invalid login credentials!");
      } else {
        String supplierID = result[0];
        String businessName = result[1];
        String approved = result[2];
        session.setAttribute("logged", "supplier");
        session.setAttribute("id", supplierID);
        session.setAttribute("approval", approved);
        out.print("<br><br><div class='container boxedTitle lightToDarkBottom'>"
        + "<h2 class='display-2'>Welcome, " + businessName + "!</h2><br><br>"
        + "<h4>You have successfully logged in.</h4><br></div>"
        + "<div class='container boxedWhite centered'><br><a href='supplierPortalHome.jsp'><i>Click Here</i> to go to the <b>Supplier Portal</b></a>"
        + "<br><br>"
        + "</div>");
      }
    %>

   
    
 
    <%@include file="footer.jsp" %>
  
</html>
