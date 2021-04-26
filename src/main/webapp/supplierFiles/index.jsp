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
        // if not logged in pass, because you are in the right place
      } else {
        response.sendRedirect("supplierLogout.jsp");
        // if already logged in, send to portal home
      }
    %>
      <br>
      <br>
      <div class='container boxedTitle lightToDarkBottom'>
        <h2 class='display-2'>Please Login Below</h2>
        <br> 
      </div>
      
      <div class="container boxedWhite">
        <form name='supplierLogin' action='supplierLoginAction.jsp'>
          <div>
            <br>
            <br>
            <br>
            
            <p>
              <label class='inputLabel'>Username:</label>
              <input class='form-control' id='username' name='username' type="text" placeholder="Enter Username"required>
            </p>
            
            <p>
              <label class='inputLabel'>Password:</label>
              <input class='form-control' id='password' name='password' type="password" placeholder="Enter Password"required>
            </p>
            
          </div>
        
          <div class='container'>
            <button type='btnSubmit' class='button submitButton'>Submit</button>
            <button type='reset' class='button resetButton'>Reset</button> 
          </div>
        </form>
     
        <br>
        
        <a href="supplierRegister.jsp">Don't have a supplier account? Click here to register</a>
        <br>
        <br>
        
      </div>

      
        <%@include file="footer.jsp" %>
    </body>
</html>
