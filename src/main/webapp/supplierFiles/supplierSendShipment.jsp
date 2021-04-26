<%@page import="myBeans.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
      <%@include file="header.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supplier Portal</title>
    </head>
    <body>
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
      <div class='container boxedTitle darkToLightBottom'>
        <br>
        <h2 class='display-2'>Please Input the Shipping Information Below</h2>
        <br> 
        <br>
      </div>
      
      <div class="container boxedWhite">
        <form name='itemRegister' action='supplierSendShipmentAction.jsp' >
          <div>
            
            <br>
            <br>
            
            <p>
              <label class='inputLabel'>Choose Item:</label>
              <%
                DBConnect dbConnect = new DBConnect();
                out.print(dbConnect.createShipmentDropdown(id));
                
                %>
            </p>
            
            <br>
            
            <p>
              <label class="inputLabel">Amount:</label>
              <input name="quant" id="quant" type="number" min="1" value="1">
            </p>
            
            <br>
            
            <p>
              <label class="inputLabel">Shipment Date:</label>
              <input name="date" id="date" type="date" value="2021-04-25">
            </p>
            
          </div>
        
          <div class='container'>
            <button  type='submit' class='button submitButton'>Submit</button>
            <button type='reset' class='button resetButton'>Reset</button> 
          </div>
          <br>
        </form>
        
      </div>
     
      
      
        <%@include file="footer.jsp" %>
    </body>
</html>
