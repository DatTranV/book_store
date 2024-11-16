<%@page import="User.UserDTO"%>
<%@page import="Cart.CartDTO"%>
<%@page import="java.util.List"%>

<%@page import="Invoice.InvoiceDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/morestyle.css" />

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
  </head>
  <body>
                       
    <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
           
        %>    
   <div class="user-bar" style="background-color: rgb(202, 44, 44); display: flex; justify-content: space-between; padding: 0 10px;">
       <%  if (loginUser!=null) { %>         
          
       <div class="username" style="color: white;"><%= loginUser.getFullName()%></div>
       <form action="MainController" method="POST">
        <input type="hidden" />
        <button value="Logout" name="action" type="submit" class="logout-link" style="background: none; border: none; color: white; text-decoration: none; cursor: pointer;" >Logout</button>
    </form>
       <%}%>
    </div>
  <div class="site-wrap">
    <header class="site-navbar" role="banner">
      
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
            
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="HeadTitle">
                <h1 style="color: black;">BOOK STORE</h1>
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
                     <%  if (loginUser==null) { %>    
                  <li><a href="login.jsp"><span class="icon icon-person"style="color: black;" ></span></a></li>
                         <%}else{%>
                  <%
    Integer bookCount = (Integer) session.getAttribute("bookCount");
  
        String displayCount;
    if (bookCount == null) {
        displayCount = "new";
    } else {
        displayCount = bookCount.toString();
    }

%>
                            <%
    Integer cart = (Integer) session.getAttribute("cartCount");
  
        String displayCountcart;
    if (cart == null) {
        displayCountcart = "new";
    } else {
        displayCountcart = cart.toString();
    }

%>

                     <li>
                    <a href="wishlist.jsp" class="site-cart">
                      <span class="icon icon-heart-o"style="color: black;"></span>
                        
                      <span class="count"><%= displayCount  %></span>
                   
                    </a>
                  </li> 
                  <li>
                    <a href="cart.jsp" class="site-cart">
                      <span class="icon icon-shopping_cart"style="color: black;"></span>
                        
                      <span class="count"><%= displayCountcart  %></span>
                   
                    </a>
                  </li> 
                      <%}%>
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            
              <li><a href="home.jsp">Home</a></li>
            <li><a href="shopall.jsp">Shop</a></li>
                   <li><a href="about.jsp">About</a></li>
                             <%  if ((loginUser!=null) && (loginUser.getRoleId()!=0)) { %>    
                   
                  
                        <li><a href="update.jsp">Update Product</a></li>
                           <li><a href="addproduct.jsp">Add New Product</a></li>
                            <% if( loginUser.getRoleId() ==2) { %> 
                              <li><a href="invoice.jsp">Invoice Manage</a></li>
                                      <li><a href="user.jsp">User Manage</a></li>
                           <%}%>
                     <%}%>
<!--            <li><a href="#">Catalogue</a></li>
            <li><a href="#">New Arrivals</a></li>
            <li><a href="contact.html">Contact</a></li>-->
          </ul>
        </div>
      </nav>
    </header>


    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="home.jsp">Home</a> <span class="mx-2 mb-0">/</span><a href="shop.jsp">Shop</a> <span class="mx-2 mb-0">/</span> <a href="cart.jsp">Cart</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <%
            InvoiceDTO invoice = (InvoiceDTO) session.getAttribute("invoice");
            
        %>
        <form action="MainController" method="POST">
        <div class="row">
          
          <div class="col-md-6 mb-5 mb-md-0">
            <h2 class="h3 mb-3 text-black">Billing Details</h2>
            <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                    <div class="col-md-12">
                        <label for="c_invId" class="text-black">Invoice ID</label>
                        <input type="text" class="form-control" id="c_invId" name="invId" value="<%=invoice.getInvId()%>" readonly>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-12">
                        <label for="c_userID" class="text-black">User ID</label>
                        <input type="text" class="form-control" id="c_userID" name="userID" value="<%=loginUser.getUserID()%>" readonly>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-12">
                        <label for="c_dateBuy" class="text-black">Date of Purchase <span class="text-danger">*</span></label>
                        <input type="datetime-local" class="form-control" id="c_dateBuy" name="dateBuy" value="06">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-12">
                        <label for="c_gmail" class="text-black">Email <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_gmail" name="gmail" value="@gmail.com" placeholder="Enter email">
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-md-12">
                        <label for="c_address" class="text-black">Address <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="c_address" name="address" value="xxx"placeholder="Enter address">
                    </div>
                </div>

                <!-- Rest of your form here -->
            </div>
          </div>
                    
                    
          <div class="col-md-6">
            <div class="row mb-5">
            <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">Your Order</h2>
                <div class="p-3 p-lg-5 border">
                    <table class="table site-block-order-table mb-5">
                        <thead>
                            <th>Product</th>
                            <th>Total</th>
                        </thead>
                        <tbody>
                            <% 
                            List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
                            float totalCost = 0;
                            for (CartDTO cart : cartList) { 
                                totalCost += cart.getTotalPrice();
                            %>
                                <tr>
                                    <td><%=cart.getBooksID()%> <strong class="mx-2">x</strong> <%=cart.getQuantity()%></td>
                                    <td>$<%=cart.getTotalPrice()%></td>
                                </tr>
                            <% 
                            } 
                            %>
                            <tr>
                                <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                <td class="text-black font-weight-bold"><strong>$<%=totalCost%></strong></td>
                            </tr>
                            
                        </tbody>
                    </table>
                    <div class="form-group">
                        <input type="hidden" name="total" value="<%=Math.round(totalCost)%>">
                        <button type="submit"name="action" value="createinvoice" class="btn btn-outline-danger btn-lg py-3 btn-block">Place Order</button>
                      </div>
                </div>
            </div>
        </div>


          </div>
        </div>
        </form>
        <!-- </form> -->
      </div>
    </div>

            <footer class="footer border-top">
                <div class="d-flex justify-content-center flex-column align-items-center py-3">
                    <p>&copy; 2024 Copyright</p>
                    <p>
                        Contact:  (+84) 190057xxx | Email: xx24@gmail.com
                    </p>
                </div>
            </footer>
  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>