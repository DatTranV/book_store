<%@page import="User.UserDTO"%>
<%@page import="Books.BooksDAO"%>
<%@page import="java.util.List"%>
<%@page import="Books.BooksDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"
            />
        <link rel="stylesheet" href="fonts/icomoon/style.css" />

        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/magnific-popup.css" />
        <link rel="stylesheet" href="css/jquery-ui.css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />
        <link rel="stylesheet" href="css/morestyle.css" />
        <link rel="stylesheet" href="css/aos.css" />
        <link rel="stylesheet" href="css/style.css" />

        <style>.btn-add-to-cart {
                color: black;
                background-color: transparent;
                border-color: black; /* Primary color for border */
            }

            .btn-add-to-cart:hover {
                background-color: red;
                color: white;
            }</style>

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

            <div>
                <img src="images/banner/singlebanner.jpg" width="100%" height="50%" />
                <h1
                    style="
                    position: absolute;
                    top: 45%;
                    left: 20%;
                    transform: translate(-50%, -50%);
                    color: white;
                    text-align: left;
                    font-size: 40px;
                    "
                    >
                    SHOP SINGLE<br /><span style="font-size: 25px"
                                           ><a href="home.jsp" style="color: white">Home </a>/Shop Single</span
                    >
                </h1>
            </div>
            <div class="bg-light" style="height: 50px"></div>



            <div class="site-section">
                <%
                    BooksDTO book = (BooksDTO) request.getAttribute("book");
                %>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">

                            <div class=" ">
                                <div class="">
                                    <div class="product">
                                        <div class="">
                                            <img src="<%=book.getImages()%> " alt="Product 1" style="width: 70%;">
                                            <% if (book.getDiscount() > 0) {%>
                                            <div class="product-discount"><%= Math.round(book.getDiscount())%>%</div>
                                            <% }%>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                  <div class="col-md-6">
    <form action="MainController" method="post">
        <input type="hidden" name="ID" value="<%= book.getBooksID() %>">
         <input type="hidden" name="image" value="<%= book.getImages()%>">
               <%  if (loginUser != null) { %>    
          <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>">
          <%}%>
                 <input type="hidden" name="invId" value="null">
                            <input type="hidden" name="quantity" value="1">

        <h2 class="text-black"><%= book.getBookName() %></h2>
        <h4 class="text-black"><%= book.getAuthorName() %> </h4>
        <h4 class="text-black"><%= book.getCategory() %> </h4>
        <p><%= book.getDescription() %></p>

        <% if (book.getDiscount() > 0) { %>
            <div class="product-price">
                $<%= book.getPrice()*(book.getPrice()*book.getDiscount()/100)%>
            </div>
            <div class="product-original-price">
                $<%= book.getPrice() %>
                    <input type="hidden" name="price" value="<%= book.getPrice()*(book.getPrice()*book.getDiscount()/100)%>">
            </div>
        <% } else { %>
            <div class="product-price">
                $<%= book.getPrice() %>
                    <input type="hidden" name="price" value="<%= book.getPrice()%>">
            </div>
        <% } %>
         
        <% if (loginUser != null) { %>
        <button type="submit" class="btn btn-primary btn-sm btn-add-to-cart"  name="action" value="Add to Cart">Add To Cart</button>
            <!-- Wishlist Button -->
            <button type="submit" class="btn btn-danger btn-sm" name="action" value="wishList">Wishlist</button>
        <% } else { %>
            <a href="login.jsp">
                <button type="button" class="btn btn-danger btn-sm">Login to buy</button>
            </a>
        <% } %>

     
    </form>
</div>

                    </div>
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