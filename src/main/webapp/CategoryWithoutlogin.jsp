<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.ResultSet" %>
<%@page import="com.dto.*" %>
<%@page import="com.dbs.*" %>
<%@page import="java.util.ArrayList" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Category</title>
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
      href="vendor/daterangepicker/daterangepicker.css"
    />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css" />
    <!--===============================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="vendor/MagnificPopup/magnific-popup.css"
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
  .con2{
  	margin-left: 20%;
  }
  		.product-info-container {
  display: flex;
  flex-direction: row;  /* Places image and text side-by-side */
  align-items: flex-start;
  gap: 20px;
  padding: 20px;
  border: 1px solid #ddd;
}

.product-image img {
  max-width: 100%;
  height: auto;
  border-radius: 8px;
}

.product-details {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.product-name {
  font-size: 1.5rem;
  font-weight: bold;
  color: #333;
  text-decoration: none;
  margin-bottom: 10px;
}

.product-price {
  font-size: 1.2rem;
  color: #444;
  margin-bottom: 10px;
}

.product-description {
  font-size: 1rem;
  color: #666;
}

.link-list {
  display: flex;
  flex-direction: column; /* Use row if you want them horizontal */
  width: 200px;
  margin: 0px 20px;
}

.link-list a {
  text-decoration: none;
  color: #333;
  padding: 10px;
  border: 1px solid #ccc;
  margin-bottom: 5px;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.link-list a:hover {
  background-color: #f0f0f0;
  color: #007bff;
}
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
    <header>
      <!-- Header desktop -->
      <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
          <div class="content-topbar flex-sb-m h-full container">
            <div class="left-top-bar">
              Free shipping for standard order 1000Rs.
            </div>
               
            <div class="right-top-bar flex-w h-full">
              <a href="Help&FaqWithoutlogin.jsp" class="flex-c-m trans-04 p-lr-25"> Help & FAQs </a>

              <a href="login.jsp" class="flex-c-m trans-04 p-lr-25"> Login </a>
              
              <a href="Emailverifyregi.jsp" class="flex-c-m trans-04 p-lr-25"> Registration </a>
            </div>
          </div>
        </div>

        <div class="wrap-menu-desktop">
          <nav class="limiter-menu-desktop container">
            <!-- Logo desktop -->
            <a href="#" class="logo">
              <h2 style="color: #717fe0">Style Savvy</h2>
              <!-- <img src="images/icons/logo-01.png" alt="IMG-LOGO" /> -->
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
              Free shipping for standard order over 1000Rs.
            </div>
          </li>

          <li>
            <div class="right-top-bar flex-w h-full">
              <a href="#" class="flex-c-m p-lr-10 trans-04"> Help & FAQs </a>

              <a href="#" class="flex-c-m p-lr-10 trans-04"> My Account </a>

              <a href="#" class="flex-c-m p-lr-10 trans-04"> </a>

              <a href="#" class="flex-c-m p-lr-10 trans-04"> Logout </a>
            </div>
          </li>
        </ul>

        <ul class="main-menu-m">
          <li>
            <a href="index.html">Home</a>
            <span class="arrow-main-menu-m">
              <i class="fa fa-angle-right" aria-hidden="true"></i>
            </span>
          </li>

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

    
    <br>
    <br><br><br>
    <%
		DataBaseConnection db = new DataBaseConnection();
		ArrayList showcategory = db.showAllcategory();
		session.setAttribute("showcategory", showcategory);
	%>
	
	<%
	        	ArrayList al = (ArrayList)session.getAttribute("showcategory");
	        	if(al!=null){
        		for(int i=0;i<al.size();i++){
        			Allcategoryget st = (Allcategoryget)al.get(i);
        		
        	%>
        	
    <div>
    	<nav class="link-list">
	    <a href="ShowRelatedSubCategorywithoutlogin?cid=<%= st.getCid()%>"><%= st.getCategory_name()%></a>
	  </nav>
    	
    </div>
    
     <%
        		}
        	}
        %>
        
   
    <section class="bg0 p-t-23 p-b-140">
      <div class="container">
        <div class="p-b-10">
        <div class="con2">
          <h3 class="ltext-103 cl5">Product Overview</h3>
        </div>
        </div>
<%
		DataBaseConnection db2 = new DataBaseConnection();
		ArrayList showproduct = db2.showAllproduct();
		session.setAttribute("showproduct", showproduct);
	%>
	<%
	        	ArrayList al2 = (ArrayList)session.getAttribute("showproduct");
	        	if(al2!=null){
        		for(int i=0;i<al2.size();i++){
        			Productget st = (Productget)al2.get(i);
        		
        	%>
   <!-- Body -->
<div class="con2">
  <div class="product-grid">
    <div class="product-card">
      <div class="product-info-container">
        <!-- Image Section -->
        <div class="product-image">
          <a href="Productsearchonclickimgwithoutlogin?pid=<%= st.getProduct_id() %>">
            <img src="img/<%= st.getImage() %>" width="300" height="300" alt="Product Image">
          </a>
        </div>

        <!-- Text Content Section -->
        <div class="product-details">
          <a href="Productsearchonclickimgwithoutlogin?pid=<%= st.getProduct_id() %>" class="product-name">
            <%= st.getProduct_name() %>
          </a>
          <div class="product-price">Price: <%= st.getPrice() %></div>
          <div class="product-description"><%= st.getDescription() %></div>
        </div>
      </div>
    </div>
  </div>
</div>

	    
<%
        		}
	        	}
        %>
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
    <script src="vendor/daterangepicker/moment.min.js"></script>
    <script src="vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/slick/slick.min.js"></script>
    <script src="js/slick-custom.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/parallax100/parallax100.js"></script>
    <script>
      $(".parallax100").parallax100();
    </script>
    <!--===============================================================================================-->
    <script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
    <script>
      $(".gallery-lb").each(function () {
        // the containers for all your galleries
        $(this).magnificPopup({
          delegate: "a", // the selector for gallery item
          type: "image",
          gallery: {
            enabled: true,
          },
          mainClass: "mfp-fade",
        });
      });
    </script>
    <!--===============================================================================================-->
    <script src="vendor/isotope/isotope.pkgd.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/sweetalert/sweetalert.min.js"></script>
    <script>
      $(".js-addwish-b2").on("click", function (e) {
        e.preventDefault();
      });

      $(".js-addwish-b2").each(function () {
        var nameProduct = $(this).parent().parent().find(".js-name-b2").html();
        $(this).on("click", function () {
          swal(nameProduct, "is added to wishlist !", "success");

          $(this).addClass("js-addedwish-b2");
          $(this).off("click");
        });
      });

      $(".js-addwish-detail").each(function () {
        var nameProduct = $(this)
          .parent()
          .parent()
          .parent()
          .find(".js-name-detail")
          .html();

        $(this).on("click", function () {
          swal(nameProduct, "is added to wishlist !", "success");

          $(this).addClass("js-addedwish-detail");
          $(this).off("click");
        });
      });

      /*---------------------------------------------*/

      $(".js-addcart-detail").each(function () {
        var nameProduct = $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .find(".js-name-detail")
          .html();
        $(this).on("click", function () {
          swal(nameProduct, "is added to cart !", "success");
        });
      });
    </script>
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