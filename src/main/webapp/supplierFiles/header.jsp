<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <head>
    <link rel="stylesheet" href="supplierCSS.css"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="registerJS.js"></script>
    <script src="eventHandling.js"></script>
    <script>
      function preventBack() {
        window.history.forward();
      }
      setTimeout("preventBack()", 0);
      window.onunload = function () {
        null
      };
    </script>    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <% // session control
      String logged = (String) session.getAttribute("logged");
      String id = (String) session.getAttribute("id");
      String approval = (String) session.getAttribute("approval");
    %>  
      
    <div class="jumbotron-fluid midLightToMidDark text-light">
      <h3 class='display-3'>Supplier Portal</h3>
      <br>
    </div>
  
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-darkest">
      <a class="navbar-brand" href="supplierPortalHome.jsp">Portal Home</a>
      
      <ul class="navbar-nav">
          <%
            // Login Check
            if (logged == null || logged.equals("supplierPortalLogin")){
              out.print("<li class='nav-item'>"
              + "<a class='nav-link' href='supplierPortalLogin.jsp'>Login</a>"
              + "</li>");
            } else {
              // If logged in
              out.print("<li class='nav-item'>"
              + "<a class='nav-link' href='supplierViewItems.jsp'>View Items</a></li>"
              + "<li class='nav-item'>"
              + "<a class='nav-link' href='supplierSetItem.jsp'>Add Item</a></li>"
              + "<li class='nav-item'>"
              + "<a class='nav-link' href='supplierSendShipment.jsp'>Send Stock</a></li>"
              + "<li class='nav-item'>"
              + "<a class='nav-link' href='supplierOrderHistory.jsp'>Order History</a></li>"
              + "<li class='nav-item'>"
              + "<a class='nav-link' href='supplierLogout.jsp'>Logout</a></li>");
            } 
            %>
      </ul>
    </nav>
    
    

  </body>
