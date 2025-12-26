<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.*" %>
<%@page import="com.dbs.*" %>
<%@page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
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
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
  </head>
  <style>
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
    #amount{
    	display:none;
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
                <%
          				String newmail2 = (String) session.getAttribute("email");
   				 %>
            <div class="right-top-bar flex-w h-full">
              <a href="Help&Faq.jsp" class="flex-c-m trans-04 p-lr-25"> Help & FAQs </a>

              <a href="MyAccount.jsp" class="flex-c-m trans-04 p-lr-25"> My Account </a>
                
              <a href="#" class="flex-c-m trans-04 p-lr-25"><%@include file="Allusername.jsp" %> </a>
              
              <a href="Logout.jsp" class="flex-c-m trans-04 p-lr-25"> Logout </a>
            </div>
          </div>
        </div>

        <div class="wrap-menu-desktop">
          <nav class="limiter-menu-desktop container">
            <!-- Logo desktop -->
            <a href="#" class="logo">
              <h2 style="color: #717fe0">E-Cart</h2>
              <!-- <img src="images/icons/logo-01.png" alt="IMG-LOGO" /> -->
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
              <ul class="main-menu">
                <li class="active-menu">
                  <a href="Userhome.jsp">Home</a>
                </li>

                <li>
                  <a href="About.jsp">About</a>
                </li>

                <li>
                  <a href="Contact.jsp">Contact</a>
                </li>
                
                <li>
                  <a href="Category.jsp">Category</a>
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
                <a href="ShowCart.jsp"><i class="zmdi zmdi-shopping-cart"> </i></a>
              </div>

              <a
                href="#"
                class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
                data-notify="0"
              >
                <i class="zmdi zmdi-favorite-outline"></i>
              </a>
              <div
                class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"
               
              >
                <a href="FeedbackForm.jsp"><i class="zmdi zmdi-comment"></i></a>
              </div>
            </div>
          </nav>
        </div>
      </div>

      <!-- Header Mobile -->
      <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
          <a href="Userhome.jsp"
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

              <a href="Logout.jsp" class="flex-c-m p-lr-10 trans-04"> Logout </a>
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
            <a href="product.html">Shop</a>
          </li>

          <li>
            <a href="shoping-cart.html" class="label1 rs1" data-label1="hot"
              >Features</a
            >
          </li>

          <li>
            <a href="blog.html">Blog</a>
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

    
<%
	ArrayList <Cartitemget> cart=(ArrayList<Cartitemget>)session.getAttribute("cart");
	if(cart == null)
	{
		System.out.println("Cart is null");
	}
%>
	
	<div class="container">
      <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="#" class="stext-109 cl8 hov-cl1 trans-04">
        
         
        </a>

        <span class="stext-109 cl4">  </span>
      </div>
    </div>

    <!-- Shoping Cart -->
    <form action="PriceIncrimentaddcart" method="post" class="bg0 p-t-75 p-b-85">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 col-xl-70 m-lr-auto m-b-50">
            <div class="m-l-25 m-r--38 m-lr-0-xl">
              <div class="wrap-table-shopping-cart">
                <table class="table-shopping-cart">
                  <tr class="table_head">
                    <th class="column-1">Product</th>
                    <th class="column-2"></th>
                    <th class="column-3">Price</th>
                    <th class="column-4">Quantity</th>
                    <th class="column-5">Total</th>
                    <th class="column-6"></th>
                    <th class="column-7">Remove Button</th>
                    
                    
                  </tr>
<%-- <%
		double grandtotal=0;
		for(Cartitemget item : cart){
			double total=item.getPrice()*item.getQuantity();
			grandtotal+=total;
	%> --%>
	
	<%
          	String newmail = (String) session.getAttribute("email");
    %>
	 <%
		DataBaseConnection db1= new DataBaseConnection();
		ArrayList<Cartitemget> cartget=db1.showcart2(newmail);
		session.setAttribute("cartget",cartget);
		
	%>
	 <%
			ArrayList al1=(ArrayList)session.getAttribute("cartget");
		if(al1 !=null)
		{
			for(int i=0; i<al1.size(); i++)
			{
				Cartitemget gt =(Cartitemget)al1.get(i);
		%>
                  <tr class="table_row">
                    <td class="column-1">
                      <div class="how-itemcart1">
                        <img src="img/<%= gt.getImg() %>" alt="IMG" />
                      </div>
                    </td>
                    <td class="column-2"><%= gt.getName() %></td>
                    <td class="column-3"> <%= gt.getPrice() %></td>
                   
                    <td class="column-4">
                      <div class="wrap-num-product flex-w m-l-auto m-r-0">
                      <a href="PriceDecrimentaddcart?qty=<%= gt.getQuantity()%>&price=<%= gt.getPrice() %>&cartid=<%= gt.getCartid() %>">
                        <div
                          class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m"
                        >
                         -
                        </div>
						</a>
                        <input
                          class="mtext-104 cl3 txt-center num-product"
                          type="number"
                          name="qty"
                          id="qty"
                          min="1"
                          value="<%= gt.getQuantity()%>"
                        />
						<a href="PriceIncrimentaddcart?qty=<%= gt.getQuantity()%>&price=<%= gt.getPrice() %>&cartid=<%= gt.getCartid() %>">
                        <div
                          class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m"
                        >
                          +
                        </div>
                        </a>
                      </div>
                    </td>
                    <%
                    Double price2 = (Double) request.getAttribute("incrementprice");
            %>
            
                    <td class="column-5"><%= gt.getTotal() %></td>
                    <td class="column-6"><div class="flex-w flex-m m-r-20 m-tb-5">
                  
                </div></td>
                 <td class="column-7"><div class="flex-w flex-m m-r-20 m-tb-5">
                  <div
                    class="flex-c-m stext-70 cl2 size-100 bg8 bor13 hov-btn3 p-lr-25 trans-04 pointer m-tb-15"
                  ><a href="DeleteAddtoCart?cartid=<%= gt.getCartid() %>" style="color:black;">
                    Remove
                  </a>
                  </div>
                </div></td>
                    
                  
                  <% 
                  
			}
			} 
	%>
          
					 </tr>
                </table>
              </div>
              <%
              DataBaseConnection db2 = new DataBaseConnection();
              Double gtotal = db2.grandTotal(newmail);

              session.setAttribute("grandTotal", gtotal);		
	%>
		<h3 class="text-uppercase" style="margin:3% 0% 0% 50%;">Grand Total :<%= gtotal%> </h3>
              
              </div>
            </div>
          </div>

 <div
                class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm"
              >

                <div
                  class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10"
                >
                  <a href="Userhome.jsp" style="color:black;">
                    Continue Shoping
                  </a>
                </div> 
                
</form>
<div class="flex-w flex-m m-r-20 m-tb-5">
                  <div
                    class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5"
                  ><form id="paymentForm">
			        <input type="number" name="amount" id="amount" value="<%= gtotal %>" readonly>
			        <button type="submit" class="add-to-cart-btn" id="buybtn"> Place Order</button>
			    </form>
			    </div></div>                  
                 </div></div>
<!-- Footer -->
    <footer class="bg3 p-t-75 p-b-32">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">Categories</h4>

             <ul>
              <li class="p-b-10">
                <a href="Productsearchbycategory?cname=mobile" class="stext-107 cl7 hov-cl1 trans-04"> Mobile Devices </a>
              </li>

              <li class="p-b-10">
                <a href="Productsearchbycategory?cname=laptop" class="stext-107 cl7 hov-cl1 trans-04"> Computers </a>
              </li>

              <li class="p-b-10">
                <a href="Productsearchbycategory?cname=printer" class="stext-107 cl7 hov-cl1 trans-04"> Printers </a>
              </li>

              <li class="p-b-10">
                <a href="Productsearchbycategory?cname=watch" class="stext-107 cl7 hov-cl1 trans-04"> Watches </a>
              </li>
              <li class="p-b-10">
                <a href="Productsearchbycategory?cname=headphone" class="stext-107 cl7 hov-cl1 trans-04"> Headphones </a>
              </li>
            </ul>
          </div>

          <div class="col-sm-6 col-lg-3 p-b-50">
            <h4 class="stext-301 cl0 p-b-30">GET IN TOUCH</h4>

            <p class="stext-107 cl7 size-201">
              Any questions? call us on <br><a href="tel:+918817671707">+918817671707</a> 
            </p>

            <div class="p-t-27">
              <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                <i class="fa fa-facebook"></i>
              </a>

              <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                <i class="fa fa-instagram"></i>
              </a>

              <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                <i class="fa fa-pinterest-p"></i>
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
 <script>
        document.getElementById("paymentForm").addEventListener("submit", function (e) {
            e.preventDefault();

            const amount = document.getElementById("amount").value;

            fetch("createOrder", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "amount=" + amount
            })
            .then(res => res.json())
            .then(order => {
                const options = {
                    key: "rzp_test_Rd8cnewTjhB38q", // Replace with your Key ID
                    amount: order.amount,
                    currency: "INR",
                    name: "E-Cart",
                    description: "Test Transaction",
                    order_id: order.id,
                    handler: function (response) {
                        alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
                        window.location.href = "successaddtocart.jsp?payment_id=" + response.razorpay_payment_id;
                    },
                    prefill: {
                        name: "Student User",
                        email: "student@example.com",
                        contact: "9999999999"
                    },
                    theme: { color: "#3399cc" }
                };
                const rzp = new Razorpay(options);
                rzp.open();
            })
            .catch(err => alert("Error creating order: " + err));
        });
    </script> 

<script>
    function increment() {
      const input = document.getElementById("qty");
      input.value = parseInt(input.value) + 1;
    }

    function decrement() {
      const input = document.getElementById("qty");
      input.value = parseInt(input.value) - 1;
    }
  </script>

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