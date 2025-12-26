<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
    <title>About</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.png" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/bootstrap/css/bootstrap.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/iconic/css/material-design-iconic-font.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="fonts/linearicons-v1.0.0/icon-font.min.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/css-hamburgers/hamburgers.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/animsition/css/animsition.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/select2/select2.min.css"
    />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/perfect-scrollbar/perfect-scrollbar.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <!--===============================================================================================-->
  </head>
  <style>
  .suggestions-box {
      position: flex;
      top: 60px;
      left: 20px;
      width: 150%;
      max-width: 900px;
      background: white;
      border: 1px solid #ddd;
      border-top: none;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      max-height: 200px;
      overflow-y: auto;
      z-index: 1000;
      padding: 1%;
    }

    .suggestion-item {
      padding: 12px 20px;
      cursor: pointer;
    }

    .suggestion-item:hover {
      background-color: #f0f0f0;
    }

    /* Body padding to avoid overlap */
    .page-content {
      padding-top: 100px;
      text-align: center;
    }
    
    .suggestions-box a{
    	text-decoration: none;
    	color: black;
    }

    @media (max-width: 600px) {
      .search-input {
        font-size: 14px;
      }

      .suggestions-box {
        left: 10px;
        right: 10px;
        width: auto;
      }
    }
        
    </style>
    <script>
function showHint(str) {
  if (str.length == 0) {
    document.getElementById("suggestions").innerHTML = "";
    return;
  } else {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("suggestions").innerHTML = this.responseText;
      }
    };
    xmlhttp.open("GET", "SearchProduct?q=" + encodeURIComponent(str), true);
    xmlhttp.send();
  }
}
</script>
  <body class="animsition">
    <!-- Header -->
    <header class="header-v4">
      <!-- Header desktop -->
      <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
          <div class="content-topbar flex-sb-m h-full container">
            <div class="left-top-bar">
              Free shipping for standard order over 1000Rs.
            </div>
			
            <div class="right-top-bar flex-w h-full">
              <a href="Help&FaqWithoutlogin.jsp" class="flex-c-m trans-04 p-lr-25"> Help & FAQs </a>
              

               <a href="login.jsp" class="flex-c-m trans-04 p-lr-25"> Login </a>
              
              <a href="Emailverifyregi.jsp" class="flex-c-m trans-04 p-lr-25"> Registration </a>
            </div>
          </div>
        </div>

        <div class="wrap-menu-desktop how-shadow1">
          <nav class="limiter-menu-desktop container">
            <!-- Logo desktop -->
            <a href="#" class="logo">
              <h2 style="color: #717fe0">Style Savvy</h2>
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
              <ul class="main-menu">
                <li class="active-menu">
                  <a href="index.jsp">Home</a>
                </li>

                <li>
                  <a href="AboutWithoutlogin.jsp">About</a>
                </li>

                <li>
                  <a href="ContactWithoutlogin.jsp">Contact</a>
                </li>
                
                <li>
                  <a href="CategoryWithoutlogin.jsp">Category</a>
                </li>
              </ul>
            </div>

            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m">
              <div
                class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search"
              >
                <i class="zmdi zmdi-search"></i>
              </div>

              <div
                class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 "
                
              >
                <a href="login.jsp"><i class="zmdi zmdi-shopping-cart"> </i></a>
              </div>

              
              
              <div
                class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
               
              >
                <a href="FeedbackFormWithoutlogin.jsp"><i class="zmdi zmdi-comment"></i></a>
              </div>
              
            </div>
          </nav>
        </div>
      </div>

      <!-- Header Mobile -->
      <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
          <a href="index.html"
            ><img src="images/icons/logo-01.png" alt="IMG-LOGO"
          /></a>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
          <div
            class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search"
          >
            <i class="zmdi zmdi-search"></i>
          </div>

          <div
            class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
            data-notify="2"
          >
            <i class="zmdi zmdi-shopping-cart"></i>
          </div>

          <a
            href="#"
            class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
            data-notify="0"
          >
            <i class="zmdi zmdi-favorite-outline"></i>
          </a>
        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
          <span class="hamburger-box">
            <span class="hamburger-inner"></span>
          </span>
        </div>
      </div>

      <!-- Menu Mobile -->
      <div class="menu-mobile">
        <ul class="topbar-mobile">
          <li>
            <div class="left-top-bar">
              Free shipping for standard order over $100
            </div>
          </li>

          <li>
            <div class="right-top-bar flex-w h-full">
              <a href="#" class="flex-c-m p-lr-10 trans-04"> Help & FAQs </a>

              <a href="#" class="flex-c-m p-lr-10 trans-04"> My Account </a>

              <a href="#" class="flex-c-m p-lr-10 trans-04"> EN </a>

              <a href="#" class="flex-c-m p-lr-10 trans-04"> USD </a>
            </div>
          </li>
        </ul>

        <ul class="main-menu-m">
          
          <li>
            <a href="about.html">About</a>
          </li>

          <li>
            <a href="contact.html">Contact</a>
          </li>
        </ul>
      </div>

      <!-- Modal Search -->
      <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
          <button
            class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search"
          >
            <img src="images/icons/icon-close2.png" alt="CLOSE" />
          </button>

          <form class="wrap-search-header flex-w p-l-15">
            <button class="flex-c-m trans-04">
              <i class="zmdi zmdi-search"></i>
            </button>
            <input type="text" id="searchInput" class="search-input" placeholder="Search names..." onkeyup="showHint(this.value)">
    <div  class="suggestions-box"><a href="#" id="suggestions"></a></div><br>
          </form>
        </div>
      </div>
    </header>
    

    <!-- Title page -->
    <section
      class="bg-img1 txt-center p-lr-15 p-tb-92"
      style="background-image: url('img/hotdeal.png')"
    >
      <b><h2 style="color: black; font-size: 50px;">About</h2></b>
    </section>

    <!-- Content page -->
    <section class="bg0 p-t-75 p-b-120">
      <div class="container">
        <div class="row p-b-148">
          <div class="col-md-7 col-lg-8">
            <div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
              <h3 class="mtext-111 cl2 p-b-16">Our Story</h3>

              <p class="stext-113 cl6 p-b-26">
                It all started with a simple idea — to make reliable, high-quality electronics more accessible and affordable for everyone. Frustrated by overpriced gadgets, long delivery times, and questionable authenticity, we set out to build something better.

                Our journey began in 2025, when a small team of tech lovers came together to create a platform where people could shop for the latest electronics without worrying about quality or trust. From smartphones to smartwatches, speakers to accessories — we handpick every product to ensure it meets our standards for performance, durability, and value.

                Today, we’re more than just a store. We’re a growing community of customers who demand the best from their devices and expect an easy, transparent shopping experience. We offer fast shipping, responsive support, and a commitment to 100% genuine products.

                Technology is constantly evolving — and so are we. Our mission is to keep you connected to the latest innovations, without the headache.

                Thanks for being part of our journey.
              </p>

            </div>
          </div>

          <div class="col-11 col-md-5 col-lg-4 m-lr-auto">
            <div class="how-bor1">
              <div class="hov-img0">
                <img src="img/anthony-choren-M9uAyfBn6mU-unsplash.jpg" alt="IMG" />
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="order-md-2 col-md-7 col-lg-8 p-b-30">
            <div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
              <h3 class="mtext-111 cl2 p-b-16">Our Mission</h3>

              <p class="stext-113 cl6 p-b-26">
                "Our mission is to make the latest and most reliable electronics accessible to everyone. We are committed to delivering top-quality gadgets, unbeatable value, and fast, secure service — empowering our customers to stay connected, productive, and ahead in a digital world."

                
              </p>

              <div class="bor16 p-l-29 p-b-9 m-t-22">
                <p class="stext-114 cl6 p-r-40 p-b-11">
                  "We exist to simplify your tech shopping experience with genuine electronics, expert support, and lightning-fast delivery — all at the best price."
                </p>
              </div>
            </div>
          </div>

          <div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
            <div class="how-bor2">
              <div class="hov-img0">
                <img src="img/brad-pouncey-X_ZBioU0lYg-unsplash.jpg" alt="IMG" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="bg3 p-t-75 p-b-32">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">Categories</h4>

            <ul>
              <li class="p-b-10">
                <a href="Productsearchbycategorywithoutlogin?cname=mobile" class="stext-107 cl7 hov-cl1 trans-04"> Mobile Devices </a>
              </li>

              <li class="p-b-10">
                <a href="Productsearchbycategorywithoutlogin?cname=laptop" class="stext-107 cl7 hov-cl1 trans-04"> Computers </a>
              </li>

              <li class="p-b-10">
                <a href="Productsearchbycategorywithoutlogin?cname=printer" class="stext-107 cl7 hov-cl1 trans-04"> Printers </a>
              </li>

              <li class="p-b-10">
                <a href="Productsearchbycategorywithoutlogin?cname=watch" class="stext-107 cl7 hov-cl1 trans-04"> Watches </a>
              </li>
              <li class="p-b-10">
                <a href="Productsearchbycategorywithoutlogin?cname=headphone" class="stext-107 cl7 hov-cl1 trans-04"> Headphones </a>
              </li>
            </ul>
          </div>

          

          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">GET IN TOUCH</h4>

            <p class="stext-107 cl7 size-201">
              Any questions? call us on <br><a href="tel:+918817671707">+918817671707</a> 
            </p>

            <div class="p-t-27">
              <a href="https://www.facebook.com/" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                <i class="fa fa-facebook"></i>
              </a>

              <a href="https://www.instagram.com/accounts/login/?hl=en" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                <i class="fa fa-instagram"></i>
              </a>

              
            </div>
          </div>

          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">Newsletter</h4>

            <form>
              <div class="wrap-input1 w-full p-b-4">
                <input
                  class="input1 bg-none plh1 stext-107 cl7"
                  type="email"
                  name="email"
                  placeholder="email@example.com"
                />
                <div class="focus-input1 trans-04"></div>
              </div>

              <div class="p-t-18">
                <button
                  class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04"
                >
                  Subscribe
                </button>
              </div>
            </form>
          </div>
        </div>
		<p class="stext-107 cl6 txt-center">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;
            <script>
              document.write(new Date().getFullYear());
            </script>
            <h6 style="color: white;margin-left: 25%;">All rights reserved | This website is made By  <b><a href="#">Devansh Barod</a></b> And <b><a href="#">Poorvahi Kadwe</a></b></h6>
            
          </p>
        
      </div>
    </footer>

    <!-- Back to top -->
    <div class="btn-back-to-top" id="myBtn">
      <span class="symbol-btn-back-to-top">
        <i class="zmdi zmdi-chevron-up"></i>
      </span>
    </div>

    <!--===============================================================================================-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
    <script>
      $(".js-select2").each(function () {
        $(this).select2({
          minimumResultsForSearch: 20,
          dropdownParent: $(this).next(".dropDownSelect2"),
        });
      });
    </script>
    <!--===============================================================================================-->
    <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script>
      $(".js-pscroll").each(function () {
        $(this).css("position", "relative");
        $(this).css("overflow", "hidden");
        var ps = new PerfectScrollbar(this, {
          wheelSpeed: 1,
          scrollingThreshold: 1000,
          wheelPropagation: false,
        });

        $(window).on("resize", function () {
          ps.update();
        });
      });
    </script>
    <!--===============================================================================================-->
    <script src="js/main.js"></script>
</body>
</html>