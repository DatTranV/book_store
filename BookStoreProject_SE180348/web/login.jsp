<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Login V18</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="css/stylelogin.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
    />
  
    
    <link rel="stylesheet" href="css/swiper.css" />
    <link rel="stylesheet" href="css/util.css">
    <style>
.txt1:hover {
  color: red;
}
.input100::placeholder {
  background: transparent;
    font-family: Montserrat-Regular;
    font-size: 18px;
    color: #555555;
    line-height: 1.2;
   
}
</style>

  </head>
  <body style="background-color: #ffffff">
    <div class="limiter">
      <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" action="MainController" method="POST"  style="padding-bottom: 50px;">
            <div>
              <span class="login100-form-title p-b-43"> Sign In </span>
            </div>
            <br />
            
   
            <div
              class="wrap-input100 validate-input"
              data-validate="Valid email is required: ex@abc.xyz"
            >
              
              <input class="input100" type="text" name="username" placeholder="Username" />
              <span class="focus-input100"></span>
              <span class="focus-input100 ">l</span>
            
            </div>

            <div
              class="wrap-input100 validate-input"
              data-validate="Password is required"
            >
              <input class="input100 " type="password" name="password" placeholder="Password " />
              <span class="focus-input100"></span>
              <span class="focus-input100"></span>
            </div>
            <br />

            <div class="flex-sb-m w-full p-t-3 p-b-32">
              <div>
                <a href="signup.jsp" class="txt1" style="font-size: 15px; ">
                  Don't have an account?
                </a>
              </div>
              <br />
            </div>

            <div class="container-login100-form-btn">
                <button class="login100-form-btn" type="submit" name="action" value="Login">Login</button>
            </div>
            
             <% if(request.getAttribute("ERROR") != null) { %>
    <p style="color: red"><%= request.getAttribute("ERROR") %></p>
<% } %>
            </form>
            
            <div class="text-center p-t-46 p-b-20" >
             
            </div>

            
        
              

          <div class="login100-more">
            
            
            
              <section>
                <div>
                  <h1 style="position: absolute; top: 12%; left: 50%; transform: translate(-50%, -50%); color: rgb(255, 255, 255); text-align: center; font-weight: 800; font-size: 30px;">DISCOVER OUR WEBSITE</h1>
                </div>
                <div class="content " style=" padding-top:10px;">
                 
                  <div class="info">
                    
                    <p>
                      Discover and learn about the art of oil painting at
                      <span class="picture-night">Image4U</span>. Image4U is a
                      unique and diverse source of information about various
                      types of oil paintings, bringing you into the colorful and
                      talented world of artists Our website introduces you to
                      the history, styles, and even the exceptional artists who
                      have created these special artworks. You will have the
                      opportunity to learn about the stories behind the
                      artworks, the lives, and careers of those who have made a
                      significant impact in the world of oil painting.
                    </p>
                    <button class="btn1">
                      <a href="signup.jsp">Be A Customer Now</a>
                    </button>
                  </div>
                  <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                      <div class="swiper-slide">
                        <span>1</span>
                        <div>
                          <h2>Akira Toriyama</h2>
                        </div>
                      </div>

                      <div class="swiper-slide">
                        <span>2</span>
                        <div>
                          <h2>Michael Morpurgo</h2>
                        </div>
                      </div>

                      <div class="swiper-slide">
                        <span>3</span>
                        <div>
                          <h2>Vu Trong Phung</h2>
                        </div>
                      </div>

                      <div class="swiper-slide">
                        <span>4</span>
                        <div>
                          <h2>Doan Gioi</h2>
                        </div>
                      </div>

                      <div class="swiper-slide">
                        <span>5</span>
                        <div>
                          <h2>Jules Verne</h2>
                        </div>
                      </div>
                      
                    </div>
                  </div>
                </div>

                <ul class="circles">
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                 
                </ul>
              </section>
        
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="js/jslogin.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.4.5/swiper-bundle.min.js"></script>
    <script>
      var swiper = new Swiper(".mySwiper", {
    effect: "cards",
    grabCursor: true,
    initialSlide: 2,
    loop: true,
    rotate: true,
    mousewheel: {
    invert: false,
  },
});
    
        
    </script>
   
  </body>
</html>
