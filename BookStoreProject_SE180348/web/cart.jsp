<%@page import="Invoice.InvoiceDTO"%>
<%@page import="Invoice.InvoiceDAO"%>
<%@page import="java.util.Random"%>
<%@page import="Cart.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="Cart.CartDAO"%>
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
                        <div class="col-md-12 mb-0"><a href="home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
                    </div>
                </div>
            </div>
            <% if (request.getAttribute("message") != null) {%>
            <h3 style="color: red"><%= request.getAttribute("message")%></h3>
            <% } %>
            <div class="site-section">
                <%
                    CartDAO cartDAO = new CartDAO();
                    List<CartDTO> cartList = null;

                    if (loginUser != null) {

                        String userID = loginUser.getUserID();
                        cartList = cartDAO.getCart(userID);
                        session.setAttribute("cartList", cartList);

                    }

                %>      
                <div class="container">
                    <div class="row mb-5">
                        <% float totalCost = 0;

                            String invId = (String) session.getAttribute("invId");
                            if (invId == null) {
                                invId = "INV-" + new Random().nextInt(10000);
                                session.setAttribute("invId", invId);
                            }
                            if (cartList != null) { %>
                        <% int count =0;
                                for (CartDTO cart : cartList) {
                                cart.setInvId(invId);
                                cartDAO.updateInvId(cart);
                                totalCost += cart.getTotalPrice();
                        count++;%>
                        <form class="col-md-12" action="MainController" method="post">
                            <div class="site-blocks-table">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-total">Total</th>
                                            <th class="product-remove">Update</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="product-thumbnail">
                                                <img src="<%=cart.getImage()%>" alt="Image" class="img-fluid">
                                            </td>
                                            <td class="product-name">
                                                <h2 class="h5 text-black"><%=cart.getBooksID()%></h2>
                                            </td>
                                            <td>$<%=cart.getPrice()%></td>
                                            <td>
                                                <input type="number" min="1" name="quantity"  value="<%=cart.getQuantity()%>">
                                                <input type="hidden" name="cartId" value="<%=cart.getCartId()%>">
                                            </td>
                                            <td>$<%=cart.getTotalPrice()%></td>
                                            <td>  <button name="action" value="CHANGE" type="submit" class="btn btn-outline-danger btn-sm">Update</button></td>
                                               <td>
                    <a href="removeCart?id=<%= cart.getCartId()%>"
                       class="btn btn-danger btn-remove">
                        X
                    </a>
                </td>
                                        </tr>


                                    </tbody>
                                </table>
                            </div>
                        </form>
                        <% }session.setAttribute("cartCount", count); %>
                        <% }%>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-5">

                                <div class="col-md-6">
                                    <a href="shopall.jsp"> <button class="btn btn-outline-danger btn-sm btn-block">Continue Shopping</button></a> 
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6 pl-5">
                            <div class="row justify-content-end">
                                <div class="col-md-7">
                                    <div class="row">
                                        <div class="col-md-12 text-right border-bottom mb-5">
                                            <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                        </div>
                                    </div>

                                    <div class="row mb-5">
                                        <div class="col-md-6">
                                            <span class="text-black">Total</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black">$<%=totalCost%></strong>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <%
                                                InvoiceDAO dao = new InvoiceDAO();
                                                boolean invoiceExists = dao.invoiceExists(invId);
                                                if (!invoiceExists && totalCost > 0) {
                                                    InvoiceDTO invoice = new InvoiceDTO();
                                                    invoice.setInvId(invId);
                                                    invoice.setUserID(loginUser.getUserID());
                                                    invoice.setTotal(totalCost);
                                                    invoice.setDateBuy(null); // You might want to set this to the current date instead
                                                    invoice.setGmail(null); // You might want to set this to the user's actual email
                                                    invoice.setAddress(null); // You might want to set this to the user's actual address

                                                    // Store the invoice in the session
                                                    session.setAttribute("invoice", invoice);
                                            %>
                                            <div>
                                                <a href="checkout.jsp" class="btn btn-outline-danger btn-lg py-3 btn-block">Go to Checkout</a>
                                            </div>  
                                            <%
                                                } else {
                                                    request.setAttribute("message", "Cannot checkout");

                                                 }%>
                                        </div>
                                    </div>
                                </div>
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
            window.location.href = "wishlist.jsp";
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