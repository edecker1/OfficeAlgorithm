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
      if (logged == null || logged.equals("supplierPortalLogin")) {
        response.sendRedirect("supplierPortalLogin.jsp");
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
        <h2 class='display-2'>Please Input the Item Information Below</h2>
        <br> 
        <br>
      </div>
      
      <div class="container boxedWhite">
        <form name='itemRegister' action='supplierSetItemAction.jsp' >
          <div>
            
            <br>
            <br>
            
            <p>
              <label class='inputLabel'>Item Name:</label>
              <input class='form-control' id='itemName' name='itemName' type="text" placeholder="Enter Item Name."required>
            </p>
            
            <p>
              <label class='inputLabel'>Category:</label>
              <select class='form-control' id='itemCategory' name='itemCategory' required>
                <option value="Basics">Basics</option>
                <option value="Paper">Paper</option>
                <option value="Writing">Writing</option>
                <option value="Organization">Organization</option>
                <option value="Storage">Storage</option>
                <option value="Mailing & Shipping">Mailing & Shipping</option>
              </select>
            </p>
            
            <p>
              <label class='inputLabel'>Item Cost:</label>
              <input class='form-control' id='itemCost' name='itemCost' type="number" placeholder="Enter Item Cost."required min="0.01" step='any'>
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
