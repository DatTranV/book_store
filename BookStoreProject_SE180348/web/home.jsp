<%@page import="User.UserDTO"%>
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
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/morestyle.css">
    <style>
      .user-bar {
  height: 40px; /* Increased height for better spacing */
  align-items: center; /* Vertically center the content */
}

.username {
  color: white;
  font-size: 16px; /* Slightly larger font size */
  font-family: 'Arial', sans-serif; /* Stylish font */
  padding: 0 10px; /* Added padding for spacing */
}

.logout-link {
  color: white;
  font-size: 16px;
  font-family: 'Arial', sans-serif;
  padding: 0 10px;
  text-decoration: none; /* Remove underline */
  transition: color 0.3s ease; /* Smooth transition for hover effect */
}

.logout-link:hover {
  color: #ffecec; /* Lighter shade on hover for interactivity */
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

 
      <div class="container-fluid">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="site-blocks-cover" style="background-image: url(images/fantasy-topaz-enhance.jpg);" data-aos="fade">
              
              <div class="row align-items-start align-items-md-center justify-content-end ">
                
                <div class="col-md-3 text-center text-md-left pt-5 pt-md-0">
                  <h1 class="mb-3" style="color: rgb(128, 245, 247); background-color: rgb(33, 91, 173); font-size: 40px; border: 5px solid black; ">FANTASY-FICTION</h1>
                  <div class="intro-text text-center text-md-left">
                    <p class="mb-4" style="color: rgb(128, 245, 247); background-color: rgb(33, 91, 173); border: 5px solid black;">Fantasy books transport readers to magical worlds with mythical creatures, epic adventures, and heroic quests. They offer an escape into extraordinary realms filled with enchantment and wonder.</p>
                    
                  </div>
               
                </div>
              </div>
            </div>
            </div>
            <div class="carousel-item">
              <div class="site-blocks-cover" style="background-image: url(images/dbz.jpg);" data-aos="fade">
              
                <div class="row align-items-start align-items-md-center justify-content-end">
                  <div class="col-md-3 text-center text-md-left pt-5 pt-md-0">
                    <h1 class="mb-3 bannertext">MANGA-COMIC</h1>
                    <div class="intro-text text-center text-md-left">
                      <p class="mb-4 bannertext" style="font-size: 25px;">Manga, the unique Japanese comic style, captivates readers with its diverse genres, intricate plots, and expressive characters, offering an immersive experience for all ages. </p>
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item">
              <div class="site-blocks-cover" style="background-image: url(images/novel.jpg);" data-aos="fade">
              
                <div class="row align-items-start align-items-md-center justify-content-end">
                  <div class="col-md-3 text-center text-md-left pt-5 pt-md-0">
                    <h1 class="mb-3 " style="color: black;">NOVEL</h1>
                    <div class="intro-text text-center text-md-left">
                      <p class="mb-4 "  style="font-size: 25px; color: black;">Novels transport readers to diverse worlds, exploring complex characters, intricate plots, and a range of human experiences. They offer an escape into compelling stories that captivate the imagination and evoke deep emotions.</p>
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
        
      </div>
  
      <div class="site-section site-section-sm site-blocks-1 bg-light" style="padding-top: 5px;">
       
      </div>
    

    <div class="site-section block-3 site-blocks-2 ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>MANGA-COMIC</h2>
          </div>
        </div>
        <div class="row" style="padding-top: 20px;">
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/manga/MG001.webp" alt="Product 1">
                     
                  </div>
                  <div class="product-title">Dragon Ball Vol_30</div>
               
              </div>
          </div>
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/manga/MG002.jpg" alt="Product 2">
                      <div class="product-discount">-20%</div>
                  </div>
                  <div class="product-title">One Piece Vol_102</div>
               
              </div>
          </div>
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/manga/MG003.webp" alt="Product 3">
                      <div class="product-discount">-30%</div>
                  </div>
                  <div class="product-title">One-Punch Man Vol_27</div>
      
              </div>
          </div>
         
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/manga/MG004.jpg" alt="Product 5">
                    
                  </div>
                  <div class="product-title">Slam Dunk Vol_21</div>

              </div>
          </div>
      </div>   
      <div class="row justify-content-center">
        <a href="shopall.jsp" class="btn btn-danger">View More</a>
      </div>
      </div>
    </div>

    <div  >
      <img src="images/banner/8644661.jpg" width="100%" height="50%">
    </div>
    <div class="bg-light" style="height: 50px;" ></div>

    <div class="site-section block-3 site-blocks-2 ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>FANTASY-FICTION</h2>
          </div>
        </div>
        <div class="row" style="padding-top: 20px;">
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/fantasy/FT001.webp" alt="Product 1">
                 
                  </div>
                  <div class="product-title">The Jungle Book</div>
        
              </div>
          </div>
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/fantasy/FT002.jpg" alt="Product 2">
                          <div class="product-discount">-20%</div>
                  </div>
                  <div class="product-title">Gulliver Travels</div>
     
              </div>
          </div>
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/fantasy/FT003.webp" alt="Product 3">
                      <div class="product-discount">-30%</div>
                  </div>
                  <div class="product-title">Two thousand miles under the sea</div>
        
              </div>
          </div>
         
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/fantasy/FT004.jpg" alt="Product 5">
        
                  </div>
                  <div class="product-title">Behind Wind Bac</div>
                 
              </div>
          </div>
      </div>   
      <div class="row justify-content-center">
        <a href="shopall.jsp" class="btn btn-danger">View More</a>
      </div>
      </div>
    </div>

    
    <div class="bg-light" >
      <img src="images/banner/8644660.jpg" width="100%" height="50%">
    </div>
    <div class="bg-light" style="height: 50px;" ></div>

    
    <div class="site-section block-3 site-blocks-2 ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>NOVEL</h2>
          </div>
        </div>
        <div class="row" style="padding-top: 20px;">
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/novel/NV001.webp" alt="Product 1">
                  
                  </div>
                  <div class="product-title">Dat Rung Phuong Nam</div>
             
              </div>
          </div>
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/novel/NV002.jpg" alt="Product 2">
                      <div class="product-discount">-20%</div>
                  </div>
                  <div class="product-title">Seagull Watcher</div>
                 
              </div>
          </div>
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/novel/NV003.jpg" alt="Product 3">
                      <div class="product-discount">-30%</div>
                  </div>
                  <div class="product-title">So Do</div>

       
              </div>
          </div>
         
          <div class="col-md-3">
              <div class="product">
                  <div class="product-container zoom-container">
                      <img src="images/novel/NV004.webp" alt="Product 5">
             
                  </div>
                  <div class="product-title">Return to childhood</div>
        
              </div>
          </div>
      </div>   
      <div class="row justify-content-center">
        <a href="shopall.jsp" class="btn btn-danger">View More</a>
      </div>
      </div>
    </div>

    <footer class="footer border-top">
      <div class="d-flex justify-content-center flex-column align-items-center py-3">
      <p>&copy; 2024 Nhà Xuất Bản Kim Đồng</p>
      <p>Liên hệ: (+84) 1900571595 | Email: cskh_online@nxbkimdong.com.vn</p>
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