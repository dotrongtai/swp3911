<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags must come first in the head; any other head content must come after these tags -->

        <title>Hola Tech</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <!--
                 HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries 
                 WARNING: Respond.js doesn't work if you view the page via file:// 
                [if lt IE 9]>
                  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                <![endif]-->

    </head>
    <style>
        /* Styles for the hot deal section */
        #hot-deal {
            background: #f5f5f5;
            padding: 50px 0;
            text-align: center;
        }

        .hot-deal {
            position: relative;
        }

        .hot-deal-countdown {
            list-style: none;
            padding: 0;
            margin: 0 0 20px 0;
            display: flex;
            justify-content: center;
        }

        .hot-deal-countdown li {
            margin: 0 10px;
        }

        .hot-deal-countdown h3 {
            font-size: 48px;
            margin: 0;
        }

        .primary-btn {
            background: #D10024;
            color: #FFF;
            padding: 10px 20px;
            text-transform: uppercase;
            font-weight: bold;
            text-decoration: none;
        }

        .primary-btn:hover {
            background: #a0001c;
        }

        .product-body{
            height: 208px;
        }
        /* Dropdown container */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        /* Dropdown content (hidden by default) */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #000;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        /* Links inside the dropdown */
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        /* Change color of dropdown links on hover */
        .dropdown-content a:hover {
            background-color: #999
        }

        /* Show the dropdown menu on hover */
        .dropdown:hover .dropdown-content {
            display: block;
        }

    </style>
    <script >// Set the date we're counting down to
        var countDownDate = new Date("August 29, 2024 15:37:25").getTime();

// Update the count down every 1 second
        var x = setInterval(function () {

            // Get today's date and time
            var now = new Date().getTime();

            // Find the distance between now and the count down date
            var distance = countDownDate - now;

            // Time calculations for days, hours, minutes and seconds
            var days = Math.floor(distance / (1000 * 60 * 60 * 24));
            var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((distance % (1000 * 60)) / 1000);

            // Display the result in the elements with id="days", "hours", "minutes", "seconds"
            document.getElementById("days").innerHTML = days;
            document.getElementById("hours").innerHTML = hours;
            document.getElementById("minutes").innerHTML = minutes;
            document.getElementById("seconds").innerHTML = seconds;

            // If the count down is over, write some text 
            if (distance < 0) {
                clearInterval(x);
                document.getElementById("days").innerHTML = "00";
                document.getElementById("hours").innerHTML = "00";
                document.getElementById("minutes").innerHTML = "00";
                document.getElementById("seconds").innerHTML = "00";
            }
        }, 1000);
    </script>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +84 367 014 833</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> holatechse1803@email.com</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <c:if test="${sessionScope.acc==null}">
                            <li><a href="login.jsp"><i class="fa fa-user-o"></i> Login</a></li>
                            </c:if>

                        <c:if test="${sessionScope.acc!=null}">
                            <li class="dropdown">
                                <a href="#"><i class="fa fa-user-o"></i>Profile</a>
                                <div class="dropdown-content">
                                    <a href="profile">Tài Khoản Của Tôi</a>
                                    <a href="myorder">Đơn Mua</a>
                                </div>
                            </li>
                            <li><a href="logout"><i class="fa fa-user-o"></i> Logout</a></li>
                            </c:if>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="#" class="logo">
                                    <img src="./img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <style>
                            .header-search form .search-btn {
                                height: 40px;
                                width: 90px; /* Tăng chiều rộng của nút tìm kiếm */
                                background: #D10024;
                                color: #FFF;
                                font-weight: 700;
                                border: none;
                                border-radius: 0 20px 20px 0;
                            }

                            .header-search form .input {
                                height: 40px;
                                width: 320px; /* Tăng chiều rộng của thanh tìm kiếm */
                                border: none;
                                padding-left: 20px;
                                border-radius: 20px 0 0 20px;
                            }

                            .header-search {
                                display: flex;
                                align-items: center;
                                /* Đẩy thanh tìm kiếm sang phải */
                                margin-right: 10px; /* Khoảng cách so với bên phải */
                            }
                        </style>

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="search" method="POST">
                                    <input value="${key}" type="search" name="keyword" class="input" placeholder="Bạn cần tìm gì?">
                                    <button class="search-btn" type="submit">Search</button>
                                </form>
                            </div>
                        </div>

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                               

                                <!-- Cart -->
                                <div >
                                    <a href="cart">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>
                                    </a>

                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="allproduct">All Product</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->
<style>/* Styles for the shop section */
            .shop {
                border: 1px solid #e4e4e4;
                margin-bottom: 30px;
                overflow: hidden;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .shop-img {
                position: relative;
                overflow: hidden;
            }

            .shop-img img {
                width: 100%;
                transition: transform 0.5s ease;
            }

            .shop-img:hover img {
                transform: scale(1.1);
            }

            .shop-body {
                padding: 20px;
                text-align: center;
            }

            .shop-body h3 {
                font-size: 20px;
                text-transform: uppercase;
                font-weight: 700;
                margin: 0 0 10px;
            }

            .cta-btn {
                display: inline-block;
                padding: 8px 16px;
                font-size: 13px;
                background-color: #D10024;
                color: #FFF;
                text-transform: uppercase;
                font-weight: bold;
                border: none;
                border-radius: 30px;
                transition: background-color 0.3s ease, box-shadow 0.3s ease;
            }

            .cta-btn i {
                margin-left: 5px;
            }

            .cta-btn:hover {
                background-color: #a0001c;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            }

            .cta-btn:focus {
                outline: none;
            }
        </style>
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/shop01.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Bộ Sưu Tập<br>Laptop</h3>
                                <form action="${pageContext.request.contextPath}/category" method="POST" style="margin-bottom: 10px;">
                                    <input type="hidden" name="categoryId" value="2" />
                                    <button type="submit" class="cta-btn">Mua Ngay <i class="fa fa-arrow-circle-right"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/homeSmartPhone.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Bộ Sưu Tập<br>Điện Thoại</h3>
                                <form action="${pageContext.request.contextPath}/category" method="POST" style="margin-bottom: 10px;">
                                    <input type="hidden" name="categoryId" value="1" />
                                    <button type="submit" class="cta-btn">Mua Ngay <i class="fa fa-arrow-circle-right"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/homeSmartWatch.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Bộ Sưu Tập<br>Đồng Hồ</h3>
                                <form action="${pageContext.request.contextPath}/category" method="POST" style="margin-bottom: 10px;">
                                    <input type="hidden" name="categoryId" value="3" />
                                    <button type="submit" class="cta-btn">Mua Ngay <i class="fa fa-arrow-circle-right"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Sản Phẩm Nổi Bật:</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    
                                </ul>
                            </div>
                        </div>

                        <form id="categoryForm" action="home" method="post" style="display: none;">
                            <input type="hidden" name="categoryId" id="categoryId">
                        </form>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->
                                        <c:forEach var="lpc" items="${requestScope.listProductCategopry}">
                                            <c:if test="${lpc.isHidden == 0}">
                                                <div class="col-md-4 col-xs-6">
                                                    <div class="product">
                                                        <div class="product-img">
                                                            <img src="${lpc.image}" alt="">
                                                            <div class="product-label">
                                                                <span class="sale">-5%</span>
                                                                <span class="new">NEW</span>
                                                            </div>
                                                        </div>
                                                        <div class="product-body">
                                                            <p class="product-category">${lpc.category.name}</p>
                                                            <h3 class="product-name"><a href="productdetail?pid=${lpc.id}">${lpc.name}</a></h3>
                                                            <h4 class="product-price">
                                                                <fmt:formatNumber value="${lpc.price}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫ 
                                                                <del class="product-old-price">
                                                                    <fmt:formatNumber value="${lpc.price + lpc.price*0.05}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫
                                                                </del>
                                                            </h4>
                                                            <div class="product-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>

                                        <!-- /product -->    
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!--                                 /tab -->
                            </div>
                        </div>
                    </div>
                    <!--                     Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3 id="days">02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3 id="hours">10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3 id="minutes">34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3 id="seconds">60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">Ưu đãi lớn trong tuần này</h2>
                            <p>Bộ Sưu Tập Mới Giảm Giá Đến 5%</p>
                            <a class="primary-btn cta-btn" href="allproduct">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

       <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Sản phẩn bán chạy nhất:</h3>
                            
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">

                                        <c:forEach var="lpc" items="${requestScope.topSellingProducts}">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${lpc.image}" alt="">
                                                    <div class="product-label">
                                                        <span class="sale">-5%</span>
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${lpc.category.name}</p>
                                                    <h3 class="product-name"><a href="productdetail?pid=${lpc.id}">${lpc.name}</a></h3>
                                                    <h4 class="product-price">
                                                        <fmt:formatNumber value="${lpc.price}" type="currency" maxFractionDigits="0" currencySymbol=""/>
                                                        ₫
                                                        <del class="product-old-price">${lpc.price}</del>
                                                    </h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>




                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        
        <!-- /SECTION -->

        <!-- NEWSLETTER -->

        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->

            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <h3 class="footer-title">About Us</h3>
                            <p>Khu Công Nghệ Cao Hòa Lạc, km 29, Đại lộ, Thăng Long, Hà Nội.</p>
                            <ul class="footer-links">
                                <!--									<li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>-->
                                <li><i class="fa fa-phone"></i> +84 367 014 833</li>
                                <li><i class="fa fa-envelope-o"></i> holatechse1803@email.com</li>
                            </ul>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
            <!-- /top footer -->

           

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                    function submitForm(categoryId) {
                                        document.getElementById('categoryId').value = categoryId;
                                        document.getElementById('categoryForm').submit();
                                    }
        </script>
    </body>
</html>