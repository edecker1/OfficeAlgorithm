<%-- 
    Document   : index
    Created on : May 3, 2021, 8:53:35 PM
    Author     : karis
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Office Algorithm</title>
        <link rel="stylesheet" href="css/styleCust.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file = "custHeader.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <h2>Welcome to Office Algorithm</h2>
                    <p>Home to all your office supply needs!</p>
                </div>
                <div class="col-2">
                    <img src="images/pencils.png" alt="office desk"/>
                </div>
            </div>
        </div>

        <!------featured products-------->
        <div class="featured">
            <div class="small-container">
                <h3>Featured Products</h3>
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
                        <img src="images/smallStaplers.jpg" />
                        <h4>Small Stapler</h4>
                        <p>$5.99</p>
                        <button type="submit">Add to Cart</button>
                    </div>
                    <div class="col-3">
                        <img src="images/premStaples.jpg" />
                        <h4>Premium Staples</h4>
                        <p>$7.99</p>
                        <button type="submit">Add to Cart</button>
                    </div>

                </div>
            </div>
        </div>
    </body>
    <%@include file="custFooter.jsp" %>
</html>
