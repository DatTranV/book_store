<%@page import="User.UserDTO"%>
<%@page import="Books.BooksDTO"%>
<%@page import="Books.BooksDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

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
     <style>
      .cate:hover{
        color: red !important; 
       
      }
       select.form-select {
    color: black;
    border-color: red;
  }

  /* To change the dropdown arrow color */
  select.form-select::-ms-expand {
    color: black;
  }
    </style>
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
        <img src="images/banner/2.jpg" width="100%" height="50%" />
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
          SHOP ALL<br /><span style="font-size: 25px"
            ><a href="home.jsp" style="color: white">Home </a>/Shop All</span
          >
        </h1>
      </div>
      <div class="bg-light" style="height: 50px"></div>

      <div class="site-section">
        <div class="container">
          <div class="row mb-5">
            <div class="col-md-9 order-2">
              <div class="row">
                <div class="col-md-12 mb-5">
                       <% if (request.getAttribute("message") != null) { %>
            <h3 style="color: red"><%= request.getAttribute("message") %></h3>
        <% } %>
                  <div class="float-md-left mb-4">
                    <h2 class="text-black h1">Shop All</h2>
                  </div>
           
                </div>
              </div>
              <div class="row mb-5">
                          <% List<BooksDTO> list = null;
                            BooksDAO dao = new BooksDAO();

                            if (request.getAttribute("list") != null) {
                                list = (List<BooksDTO>) request.getAttribute("list");
                            } else {
                                list = dao.load();
                            }
                        %>
                    <% int count = 0;
                                    for (BooksDTO listBooks : list) {
                                        count++;%>
                  
                <div class="col-md-3">
                  <div class="product">
                    <div class="product-container zoom-container">
                         <a href="shopsingle?bookId=<%= listBooks.getBooksID() %>">    <img src="<%= listBooks.getImages()%>" alt="Product 2" /></a>
                  
                      <% if (listBooks.getDiscount() > 0) { %>
          <div class="product-discount">-<%= Math.round(listBooks.getDiscount())%>%</div>
        <% } %>
                    </div>
                    <div class="product-title">
                      <%= listBooks.getBookName()%>
                    </div>
                     <% if (listBooks.getDiscount() > 0) { %>
                    <div class="product-price">$<%= listBooks.getPrice()*(listBooks.getPrice()*listBooks.getDiscount()/100)%></div>
                    <div class="product-original-price">$<%= listBooks.getPrice()%></div>
                      <% } else{ %>
                      <div class="product-price">$<%= listBooks.getPrice()%></div>
                      <%}%>
                  </div>
                </div>
                         
                    <%}%>
                  
              
      
   
                    
                    
              </div>
         
            </div>

            <div class="col-md-3 order-1 mb-5 mb-md-0">      
              <div class="border p-4 rounded mb-4">
                <div class="price-filter">
                  <div class="price-filter-header">CATEGORIES</div>
                  <div class="price-filter-body">
                    <form>
                      <h6><a href="shopall.jsp" style="color: black;" class="cate">All</a></h6>
                      <h6><a href="searchCategory?categoryId=Manga" style="color: black;" class="cate">Manga</a></h6>
                      <h6><a href="searchCategory?categoryId=Novel" style="color: black;" class="cate">Novel</a></h6>
                      <h6><a href="searchCategory?categoryId=Fantasy" style="color: black;" class="cate">Fantasy-Fiction</a></h6>
                      
                  
                    </form>
                  </div>
                </div>
              </div>

              <div class="border p-4 rounded mb-4">
                <div class="price-filter">
                  <div class="price-filter-header">SEARCH</div>
                  <div class="price-filter-body">
                      <form action="MainController" method="post">
                      <div class="form-check">
                         <select class="form-select" name="searchType" style="width: auto; margin-bottom: 1rem;">
            <option value="name" selected>Search by Name</option>
            <option value="author">Search by Author</option>
          </select>
                      </div>
                  
                      <div class="mb-3">
                          <input type="search" class="form-control" id="searchQuery" placeholder="Enter search query" name="search">
                      </div>
                          <button type="submit" name="action" value="search" class="btn btn-outline-danger">Search</button>
                    </form>
                  </div>
                </div>
              </div>
<!--              <div class="border p-4 rounded mb-4">
                <div class="price-filter">
                  <div class="price-filter-header">
                      PRICE
                  </div>
                  <div class="price-filter-body">
                                      <%            String fromPrice = request.getParameter("fromPrice");
            String toPrice = request.getParameter("toPrice");
            if (fromPrice == null) {
                fromPrice = "";
            }
            if (toPrice == null) {
                toPrice = "";
            }
        %>
                      <form action="MainController" method="post">
                        <div class="mb-3">
                          <label for="fromPrice" class="form-label">From Price</label>
                          <input type="text" class="form-control" id="fromPrice" name="fromPrice" placeholder="0" value="<%= fromPrice%>">
                        </div>
                
                         To Price Input 
                        <div class="mb-3">
                          <label for="toPrice" class="form-label">To Price</label>
                          <input type="text" class="form-control" id="toPrice" name="toPrice" placeholder="0" value="<%= toPrice%>">
                        </div>
                
                         Search Button 
                        <button type="submit" name="action" value="Search" class="btn btn-outline-danger">Search</button>
                      </form>
                  </div>
              </div>
              </div>-->
            </div></div>
          </div>
        </div>
      </div>

      <footer class="footer border-top">
        <div
          class="d-flex justify-content-center flex-column align-items-center py-3"
        >
          <p>&copy; 2024 Nhà Xu?t B?n Kim ??ng</p>
          <p>
            Liên h?: (+84) 1900571595 | Email: cskh_online@nxbkimdong.com.vn
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
