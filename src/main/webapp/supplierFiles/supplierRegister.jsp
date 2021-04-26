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
      if (logged == null || logged.equals("supplierRegister.jsp")) {
        // If not logged in, pass because they are in the right place
      } else {
        response.sendRedirect("supplierPortalHome.jsp");
        // send them to the portal home if already logged in
      }
    %>
      <br>
      <div class='container boxedTitle darkToLightBottom'>
        <br>
        <h2 class='display-2'>Please Register for an Account Below</h2>
        <br> 
        <br>
      </div>
      
      <div class="container boxedWhite">
        <form name='register' action='supplierRegisterAction.jsp' >
          <div>
            
            <br>
            <br>
            
            <p>
              <label class='inputLabel'>Business Name:</label>
              <input class='form-control' id='businessName' name='businessName' type="text" placeholder="Enter Business Name."required>
              <div class="invalid-feedback">Please fill out this field.</div>
              <div id='invalidName' class="text-danger" style='display: none'>
                <b>Please input your business name!</b>
              </div>
              <div id='validName' class="text-success" style='display: none'>
                <b>Valid Business Name</b>
              </div>
            </p>
            
            <p>
              <label class='inputLabel'>Email:</label>
              <input class='form-control' id='email' name='email' type="email" placeholder="Enter Valid Email Address."required>
              <div id='invalidEmail' class="text-danger" style='display: none'>
                <b>Not a valid email!</b>
              </div>
              <div id='validEmail' class="text-success" style='display: none'>
                <b>Valid Email</b>
              </div>
            </p>
            
            <p>
              <label class='inputLabel'>Confirm Email:</label>
              <input class='form-control' id='email2' name='email2' type="email" placeholder="Confirm your Email."required>
              <div id='invalidEmail2' class="text-danger" style='display: none'>
                <b>Emails do not match!</b>
              </div>
              <div id='validEmail2' class="text-success" style='display: none'>
                <b>Valid: Both Emails Match</b>
              </div>
            </p>
            
            <p>
              <label class='inputLabel'>Username:</label>
              <input class='form-control' id='username' name='username' type="text" placeholder="Usernames should be at least 6 characters long and have a number." required>
              <div id='invalidUsernameLength' class="text-danger" style='display: none'>
                <b>Username needs to be 6 characters or more!</b>
              </div>
              <div id='invalidUsernameNumber' class="text-danger" style='display: none'>
                <b>Username needs to have a number!</b>
              </div>
              <div id='validUsername' class="text-success" style='display: none'>
                <b>Valid Username</b>
              </div>
            </p>
            
            <p>
              <label class='inputLabel'>Password:</label>
              <input class='form-control' id='password' name='password' type="password" placeholder="Passwords should be at least 8 characters long, have a number, and have a special character."required>
              <div id='invalidPasswordLength' class="text-danger" style='display: none'>
                <b>Password needs to be 8 characters or more!</b>
              </div>
              <div id='invalidPasswordNumber' class="text-danger" style='display: none'>
                <b>Password needs to have a number!</b>
              </div>
              <div id='invalidPasswordCharacter' class="text-danger" style='display: none'>
                <b>Password needs to have a special character!</b>
              </div>
              <div id='validPassword' class="text-success" style='display: none'>
                <b>Valid Password</b>
              </div>
            </p>
            
            <p>
              <label class='inputLabel'>Confirm Password:</label>
              <input class='form-control' id='password2' name='password2' type="password" placeholder="Confirm Password."required>
              <div id='invalidPassword2' class="text-danger" style='display: none'>
                <b>Passwords do not match!</b>
              </div>
              <div id='validPassword2' class="text-success" style='display: none'>
                <b>Valid: Both Passwords Match</b>
              </div>
            </p>
            
          </div>
        
          <div class='container'>
            <button  type='submit' class='button submitButton' onclick='validate()'>Submit</button>
            <button type='reset' class='button resetButton'>Reset</button> 
          </div>
        </form>
        
        <br>
        <a href="supplierPortalLogin.jsp">Already have an account? Click here to log in.</a>
        <br><br>
        
      </div>
     
      
      
        <%@include file="footer.jsp" %>
    </body>
</html>
