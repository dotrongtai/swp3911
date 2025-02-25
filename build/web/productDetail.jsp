<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

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
</head>
<body>
    <!-- HEADER -->
    <header>
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
                                <a href="orders.jsp">Đơn Mua</a>
                            </div>
                        </li>
                        <li><a href="logout"><i class="fa fa-user-o"></i> Logout</a></li>
                        </c:if>
                </ul>
            </div>
        </div>
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

                    <!-- SEARCH BAR -->
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

                        .list-group-item {
                            background-color: transparent; /* Màu nền ban đầu */
                            color: black; /* Màu chữ ban đầu */
                            border: 1px solid transparent; /* Viền ban đầu */
                        }

                        .list-group-item.active {
                            background-color: #D10024; /* Đặt màu nền là đỏ tươi */
                            border-color: red; /* Đặt màu viền là đỏ tươi */
                            color: white; /* Đặt màu chữ là trắng */
                        }

                        .list-group-item:hover,
                        .list-group-item.active:hover {
                            background-color: #D10024; /* Đặt màu nền khi hover là đỏ tươi */
                            color: white; /* Đặt màu chữ khi hover là trắng */
                            border-color: red; /* Đặt màu viền khi hover là đỏ tươi */
                        }

                    </style>

                    <!-- SEARCH BAR -->
                    <div class="col-md-6">
                        <div class="header-search">
                            <form action="search" method="POST">
                                <input value="${key}" type="search" name="keyword" class="input" placeholder="Bạn cần tìm gì?">
                                <button class="search-btn">Search</button>
                            </form>
                        </div>
                    </div>
                    <!-- /SEARCH BAR -->

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
                <li ><a href="home">Home</a></li>
                <li><a href="allproduct">All Product</a></li>
                <li class="active"><a href="#">Product Detail</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->

<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Product main img -->
            <div class="col-md-6">

                <div class="product-preview">
                    <img src="${detail.image}" alt="">

                </div>
            </div>
            <!-- /Product main img -->



            <!-- Product details -->
            <div class="col-md-6">
                <div class="product-details">
                    <h2 class="product-name">${detail.name}</h2>
                    <div>

                        <div class="product-rating">
                            <strong>${requestScope.rate}</strong>

                            <i class="fa fa-star"></i>
                        </div>
                        <!--                            <a class="review-link" href="#">10 Review(s)</a>-->
                    </div>
                    <div>
                        <h3 class="product-price">

                            <fmt:formatNumber value="${detail.price}" type="currency"  maxFractionDigits="0" currencySymbol=""/>₫
                        </h3>
                        <span class="product-available">${stock} In Stock</span>
                    </div>
                    <div class="product-options">
                        <label>
                            Màu sắc
                            <br>
                            <select class="input-select" id="colorSelect">
                                <c:forEach var="pv" items="${productVariant}">
                                    <option value="${pv.color.id}" data-pid="${detail.id}" data-vpid="${pv.id}">${pv.color.colorName}</option>
                                </c:forEach>
                            </select>
                        </label>
                        <label>
                            Số lượng
                            <div class="input-number">
                                <input type="number" value="1" min="1" id="quantity" oninput="validity.valid||(value='');">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </label>
                    </div>

                    <div class="add-to-cart">
                        <button class="add-to-cart-btn">
                            <i class="fa fa-shopping-cart"></i> add to cart
                        </button>
                    </div>

                    <div class="product-specs">
                        <h3>Specifications</h3>
                        <table class="table table-bordered">
                            <tr>
                                <td>Chip</td>
                                <td>${detail.chip}</td>
                            </tr>
                            <tr>
                                <td>RAM</td>
                                <td>${detail.ram}</td>
                            </tr>
                            <tr>
                                <td>ROM</td>
                                <td>${detail.rom}</td>
                            </tr>
                            <tr>
                                <td>GPU</td>
                                <td>${detail.gpu}</td>
                            </tr>
                        </table>
                    </div>
                    <ul class="product-links">
                        <li>Category:</li>
                        <li><a href="#">${detail.category.name}</a></li>

                    </ul>
                    <ul class="product-links">
                        <li>Share:</li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                    </ul>
                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                        <li><a data-toggle="tab" href="#tab3">Reviews</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12"> ${detail.description}</div>
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab2  -->

                        <!-- /tab2  -->

                        <!-- tab3  -->
                        <div id="tab3" class="tab-pane fade in">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-4">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span>${requestScope.rate}</span>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>

                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 80%;"></div>
                                                </div>
                                                <span class="sum">${requestScope.rate5}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 60%;"></div>
                                                </div>
                                                <span class="sum">${requestScope.rate4}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">${requestScope.rate3}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">${requestScope.rate2}</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">${requestScope.rate1}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
                                <div class="col-md-7">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <c:forEach var="feedback" items="${feedback}">
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">${feedback.userName}</h5>
                                                        <p class="date">${feedback.createdAt}</p>
                                                        <div class="review-rating">
                                                            <c:forEach var="i" begin="1" end="5">
                                                                <i class="fa fa-star${i <= feedback.rate ? '' : '-o empty'}"></i>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>${feedback.comment}</p>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                        <ul class="reviews-pagination">
                                            <li class="active">1</li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Reviews -->
                            </div>
                        </div>
                        <!-- /tab3  -->
                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Related Products</h3>
                </div>
            </div>

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="./img/product01.png" alt="">
                        <div class="product-label">
                            <span class="sale">-30%</span>
                        </div>
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                        <div class="product-rating">
                        </div>
                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="./img/product02.png" alt="">
                        <div class="product-label">
                            <span class="new">NEW</span>
                        </div>
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
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
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <div class="clearfix visible-sm visible-xs"></div>

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="./img/product03.png" alt="">
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                        <div class="product-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="./img/product04.png" alt="">
                    </div>
                    <div class="product-body">
                        <p class="product-category">Category</p>
                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                        <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                        <div class="product-rating">
                        </div>
                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->



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
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const addToCartBtn = document.querySelector('.add-to-cart-btn');
        const colorSelect = document.getElementById('colorSelect');
        const quantityInput = document.getElementById('quantity');

        addToCartBtn.addEventListener('click', function () {
            // Get selected option details
            const selectedOption = colorSelect.options[colorSelect.selectedIndex];
            const productId = selectedOption.getAttribute('data-pid');
            const variantId = selectedOption.getAttribute('data-vpid');
            const quantity = quantityInput.value;

            // Send AJAX request to add to cart
            $.ajax({
                url: 'cart', // URL of the servlet
                type: 'POST',
                data: {
                    pid: productId,
                    vpid: variantId,
                    quantity: quantity
                },
                dataType: 'json', // Expect JSON response
                success: function (response) {
                    if (response.loggedIn) {
                        if (response.success) {
                            // Product added to cart successfully
                            alert(response.message);
                        } else {
                            // Not enough stock
                            alert(response.message);
                        }
                    } else {
                        // User is not logged in, redirect to login page
                        window.location.href = 'login.jsp'; // URL of the login page
                    }
                },
                error: function (error) {
                    console.error('Error adding to cart:', error);
                }
            });
        });
    });

</script>


</body>
</html>
