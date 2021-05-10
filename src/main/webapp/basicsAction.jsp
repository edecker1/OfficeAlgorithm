<%-- 
    Document   : basicsAction
    Created on : May 4, 2021, 4:11:35 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Basics</title>
        <link rel="stylesheet" href="css/styleCust.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file = "custHeader.jsp"%>
        <div class="featured">
            <div class="small-container">
                <h2>Basics</h2>
                <br>
                <div class="row">
                    <div class="col-3">
                        <img src="images/blackStapler.jpg" />
                        <h4>Black Stapler</h4>
                        <p>$10.99</p>
                        <form action="custCart.jsp">
                            <button id="1" type="submit">Add to Cart</button>
                        </form>                    </div>
                    <div class="col-3">
                        <img src="images/premStaples.jpg" />
                        <h4>Premium Staples</h4>
                        <p>$7.99</p>
                        <button id="5" type="submit">Add to Cart</button>
                    </div>
                    <div class="col-3">
                        <img src="images/smallStaplers.jpg" />
                        <h4>Small Stapler</h4>
                        <p>$5.99</p>
                        <button id="4" type="submit">Add to Cart</button>
                    </div>
                </div>

                <div class="row">

                    <div class="col-3">
                        <img src="images/regStaples.jpg" />
                        <h4>Regular Staples</h4>
                        <p>$4.99</p>
                        <button id="6" type="submit">Add to Cart</button>
                    </div>
                    <div class="col-3">
                    </div>
                    <div class="col-3">
                    </div>

                </div>
            </div>
        </div>
    </body>
    <%@include file = "custFooter.jsp"%>
</html>
