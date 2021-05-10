<%-- 
    Document   : custProduct
    Created on : May 3, 2021, 8:59:49 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Products</title>
        <link rel="stylesheet" href="css/styleCust.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file = "custHeader.jsp"%>
        <div class="featured">

            <div class="small-container">
                <h2>All Products</h2>
                <br>
                <div class="row">

                    <div class="col-3">
                        <img src="images/blackStapler.jpg" />
                        <h4>Black Stapler</h4>
                        <p>$10.99</p>
                        <form action="custCart.jsp">
                            <button id="1" type="submit">Add to Cart</button>
                        </form>

                    </div>
                    <div class="col-3">
                        <img src="images/blueStapler.jpg" />
                        <h4>Blue Stapler</h4>
                        <p>$10.99</p>
                        <button id="7" type="submit">Add to Cart</button>
                    </div>
                    <div class="col-3">
                        <img src="images/greenStapler.jpg" />
                        <h4>Green Stapler</h4>
                        <p>$10.99</p>
                        <button id="8" type="submit">Add to Cart</button>
                    </div>

                    <div class="col-3">
                        <img src="images/premStaples.jpg" />
                        <h4>Premium Staples</h4>
                        <p>$7.99</p>
                        <button id="5" type="submit">Add to Cart</button>
                    </div>
                    <div class="col-3">
                        <img src="images/regStaples.jpg" />
                        <h4>Regular Staples</h4>
                        <p>$4.99</p>
                        <button id="6" type="submit">Add to Cart</button>
                    </div>
                    <div class="col-3">
                        <img src="images/smallStaplers.jpg" />
                        <h4>Small Stapler</h4>
                        <p>$5.99</p>
                        <button id="4" type="submit">Add to Cart</button>
                    </div>


                    <div class="col-3">
                        <img src="images/binder.jpg" />
                        <h4>1 inch Binder</h4>
                        <p>$5.99</p>
                        <button id="3" type="submit">Add to Cart</button>
                    </div>
                    <div class="col-3">
                        <img src="images/pencils12.jpg" />
                        <h4>12 pack Pencils</h4>
                        <p>$5.99</p>
                        <button id="2" type="submit">Add to Cart</button>
                    </div>
                    <div class="col-3">
                        <img src="images/envelope.jpg" />
                        <h4>100 pack Envelope</h4>
                        <p>$11.99</p>
                        <button id="9" type="submit">Add to Cart</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file = "custFooter.jsp"%>
</html>

