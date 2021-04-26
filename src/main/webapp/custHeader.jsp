<%-- 
    Document   : custHeader
    Created on : May 3, 2021, 8:56:24 PM
    Author     : karis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styleCust.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <title>Header</title>
    </head>

    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <h3>Office Algorithm</h3>                
                </div>
                <nav>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="custProduct.jsp">Products</a></li>
                        <li>
                            <div class="dropdown">
                                <button class="dropbtn">Categories
                                    <i class="fa fa-caret-down"></i>
                                </button>
                                <div class="dropdown-content">
                                    <a href="basicsAction.jsp">Basics</a>
                                    <a href="writingAction.jsp">Writing</a>
                                    <a href="shippingAction.jsp">Shipping</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown">
                                <button class="dropbtn">Accounts
                                    <i class="fa fa-caret-down"></i>
                                </button>
                                <div class="dropdown-content">
                                    <a href="custRegister.jsp">Register</a>
                                    <a href="custLogin.jsp">Login</a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="match">
                                <form action="custSearchAction.jsp">
                                    <input type="text" class="Search" placeholder="Search Products..." name="Name">
                                    <button class="Searchbtn" type="submit">Submit</button>
                                </form>
                            </div>
                        </li>
                        <li>
                            <div class="match">
                                <form action="custCart.jsp">
                                    <button class="Searchbtn" type="submit">Cart</button>
                                </form>
                            </div>

                        </li>
                    </ul>

                </nav>


            </div>


        </div>

    </body>
</html>
