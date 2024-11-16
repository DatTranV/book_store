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
          <form class="login100-form " action="create" method="POST">
            <div style="position: relative; top: -100px;">
              <span class="login100-form-title p-b-43"> Sign Up </span >
            </div>
            <br />

            <div class="wrap-input100 validate-input " style="position: relative; top: -100px;" >
              <input class="input100" type="text" name="userid" placeholder="User Name" />
              <span class="focus-input100"></span>
              <span class="focus-input100 "></span>         
            </div>

            <div class="wrap-input100 validate-input" style="position: relative; top: -100px;">
                <input class="input100" type="text" name="fullname" placeholder="Full Name" />
                <span class="focus-input100"></span>
                <span class="focus-input100 "></span>         
              </div>

            <div class="wrap-input100 validate-input" style="position: relative; top: -100px;">
              <input class="input100 " type="password" name="pass" placeholder="Password " />
              <span class="focus-input100"></span>
              <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" style="position: relative; top: -100px;">
                <input class="input100 " type="password" name="repass" placeholder="Confirm Password " />
                <span class="focus-input100"></span>
                <span class="focus-input100"></span>
              </div>
            <br />

            <div class="flex-sb-m w-full p-t-3 p-b-32" style="position: relative; top: -100px;">
              <div>
                <a href="login.jsp" class="txt1" style="font-size: 15px; ">
                  Already have an account?
                </a>
              </div>
              <br />
            </div>

            <div class="container-login100-form-btn" style="position: relative; top: -100px;">
                <button class="login100-form-btn" type="submit" value="Register">Register</button>
            </div>
            <% if(request.getAttribute("messagePassword") != null) { %>
    <p style="color: red"><%= request.getAttribute("messagePassword") %></p>
<% } %>
<% if(request.getAttribute("messageID") != null) { %>
    <p style="color: red"><%= request.getAttribute("messageID") %></p>
<% } %>

            <div class="text-center p-t-46 p-b-20" >
             
            </div>

            <div class="login100-form-social flex-c-m">
              <a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
                <i class="fa fa-facebook-f" aria-hidden="true"></i>
              </a>

              <a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
            </div>
          </form>

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
