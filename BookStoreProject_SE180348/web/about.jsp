<%@page import="User.UserDTO"%>
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
            <div class="col-md-12 mb-0">
              <a href="home.jsp">Home</a> <span class="mx-2 mb-0">/</span>
              <strong class="text-black">About</strong>
            </div>
          </div>
        </div>
      </div>

      <div class="site-section border-bottom" data-aos="fade">
        <div class="container">
          <div class="row mb-5">
            <div class="col-md-6">
              <div class="block-16">
                <figure>
                  <img
                    src="images/banner/aboutbanner.jpg"
                    alt="Image placeholder"
                    class="img-fluid rounded"
                  />
                  <a
                    href="https://vimeo.com/channels/staffpicks/93951774"
                    class="play-button popup-vimeo"
                    ><span class="ion-md-play"></span
                  ></a>
                </figure>
              </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-5">
              <div class="site-section-heading pt-3 mb-4">
                <h2 class="text-black">How We Started</h2>
              </div>
              <p>
                Our journey began with a simple love for books and a dream to
                share this passion with our community. With a mission to create
                a haven for book lovers, we focused on fostering a warm,
                welcoming environment where readers of all ages could find
                something that sparks their imagination.
              </p>
              <p>
                Through word of mouth and the unwavering support of our early
                patrons, we expanded our collection, events, and services,
                transforming into the vibrant literary hub we are today.
              </p>
            </div>
          </div>
        </div>
      </div>

      <div class="site-section border-bottom" data-aos="fade">
        <div class="container">
          <div class="row justify-content-center mb-5">
            <div class="col-md-7 site-section-heading text-center pt-4">
              <h2>The Team</h2>
            </div>
          </div>
          <div style="display: flex; justify-content: center; width: 100%;" >
          
            <div class=" col-lg-3" style="justify-content: center;">
              <div class="block-38 text-center">
                <div class="block-38-img">
                  <div class="block-38-header">
                    <img
                      src="images/banner/boyavatar.png"
                      alt="Image placeholder"
                      class="mb-4"
                    />
                    <h3 class="block-38-heading h4">Dat Tran</h3>
                    <p class="block-38-subheading">Sales Manager Design</p>
                  </div>
                  <div class="block-38-body">
                    <p>
                      With over 2 years in the book industry, i bring extensive knowledge and a genuine love for literature.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div
        class="site-section site-section-sm site-blocks-1 border-0"
        data-aos="fade"
      >
        <div class="container">
          <div class="row">
            <div
              class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
              data-aos="fade-up"
              data-aos-delay=""
            >
              <div class="icon mr-4 align-self-start">
                <span class="icon-truck"></span>
              </div>
              <div class="text">
                <h2 class="text-uppercase">Free Shipping</h2>
                <p>
                  Ensuring that your next great read is just a click away without any extra cost.
                </p>
              </div>
            </div>
            <div
              class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
              data-aos="fade-up"
              data-aos-delay="100"
            >
              <div class="icon mr-4 align-self-start">
                <span class="icon-refresh2"></span>
              </div>
              <div class="text">
                <h2 class="text-uppercase">Free Returns</h2>
                <p>
                  Shop with confidence knowing that returning a book is easy and cost-free, ensuring a worry-free shopping experience every time.
                </p>
              </div>
            </div>
            <div
              class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <div class="icon mr-4 align-self-start">
                <span class="icon-help"></span>
              </div>
              <div class="text">
                <h2 class="text-uppercase">Customer Support</h2>
                <p>
    Our friendly and knowledgeable team is always here to assist you with any questions or concerns you may have. 
                </p>
              </div>
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
