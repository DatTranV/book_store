<%@page import="Books.BooksDAO"%>
<%@page import="Books.BooksDTO"%>
<%@page import="User.UserDAO"%>
<%@page import="User.UserDTO"%>
<%@page import="Invoice.InvoiceDTO"%>
<%@page import="Invoice.InvoiceDAO"%>
<%@page import="java.util.List"%>


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
          <div class="col-md-12 mb-0"><a href="home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Invoice Manage</strong></div>
        </div>
      </div>
    </div>  

    
   
<div class="">

    <table class="table table-striped table-responsive-md">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Book ID</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author Name</th>
                <th scope="col">Category</th>
                <th scope="col">Description</th>
                <th scope="col">Images</th>
                <th scope="col">Price</th>
                <th scope="col">Discount</th>
                <th scope="col">Quantity</th>
                <th scope="col">NotSale</th>
                
                <th scope="col">Update</th>
                 <th scope="col">Remove</th>
            </tr>
        </thead>
        <tbody>
            <% List<BooksDTO> list = null;
                            BooksDAO dao = new BooksDAO();

                            if (request.getAttribute("listuser") != null) {
                                list = (List<BooksDTO>) request.getAttribute("listall");
                            } else {
                                list = dao.getAllProduct();
                            }
                        %>
                    <% int count = 0;
                                    for (BooksDTO book : list) {
                                        count++;%>
        <form action="MainController" method="post">                   
                <tr>
                    <td> <input type="text" name="bookid"
                               value="<%= book.getBooksID()%>"
                               class="form-control small-text" readonly></td>
                    
                    <td><input type="text" name="bookname"
                               value="<%= book.getBookName()%>"
                               class="form-control small-text" ></td>
                    
                    <td><input type="text"  name="authorname"
                               value="<%= book.getAuthorName()%>"
                               class="form-control small-text" ></td>
                    
                     <td> <input type="text" name="category"
                               value="<%= book.getCategory()%>"
                               class="form-control small-text" readonly></td>
                     
                    <td><input type="text" name="description"
                               value="<%= book.getDescription()%>"
                               class="form-control small-text" ></td>
                    
                    <td><input type="text"  name="image"
                               value="<%= book.getImages()%>"
                               class="form-control small-text" ></td>
                    
                     <td> <input  name="price"
                               value="<%= book.getPrice()%>"
                               class="form-control small-text" ></td>
                     
                    <td><input type="text" name="discount"
                               value="<%=Math.round(book.getDiscount())%>"
                               class="form-control small-text" ></td>
                    
                    <td><input type="number" min="1"  name="quantity"
                               value="<%= book.getQuantity()%>"
                               class="form-control small-text" ></td>
                     <td><input type="number" min="0" max="1" name="notsale"
                               value="<%= book.getNotSale()%>"
                               class="form-control small-text" ></td>
                  
  
                    <td>      <button type="submit" class="btn btn-warning " name="action" value="Update">
                               Update
                            </button></td>
                         
                    <td>
                    <a href="removeProduct?id=<%= book.getBooksID()%>"
                       class="btn btn-outline-danger btn-remove">
                        X
                    </a>
                </td>
                </tr>
                </form>    
            <% } %>
        </tbody>
    </table>
</div>
        <%
                        String message = (String) request.getAttribute("message");
                        if (message == null) {
                            message = "";
                        }
                    %>
                    <div class="d-flex justify-content-center">
                        <h3 style="color: red;"><%= message %></h3>
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
  <script>  
            document.querySelectorAll('.btn-remove').forEach(button => {
            button.addEventListener('click', function (event) {
            event.preventDefault();
            const url = this.href;
            Swal.fire({
            title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, delete it!"
            }).then((result) => {
            window.location.href = url;
            if (result.isConfirmed){
            Swal.fire({
            title: "Deleted!",
                    text: "Your Product has been deleted.",
                    icon: "success"

            });
            } else {
            window.location.href = "invoice.jsp";
            }
            });
            });
            });
        </script>
     <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/main.js"></script>
        <!-- Bootstrap JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
                integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>

        <script src="
                https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.all.min.js
        "></script>
    
  </body>
</html>