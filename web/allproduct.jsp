<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags must come first in the head; any other head content must come after these tags -->

        <title>Hola Tech</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/14.6.4/nouislider.min.css">

        <style>
            .price-filter {
                margin: 20px;
            }
            .price-values {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }
            .price-values input {
                width: 45%;
                text-align: center;
            }
        </style>
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
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1000; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    </style>
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
                                <a href="#"><i class="fa fa-user-o"></i> Profile</a>
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

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li ><a href="home">Home</a></li>
                        <li class="active"><a href="allproduct">All Product</a></li>

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
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Loại Sản Phẩm</h3>
                            <div class="checkbox-filter">
                                <c:forEach items="${listCategories}" var="C">
                                    <form action="${pageContext.request.contextPath}/category" method="POST" style="margin-bottom: 10px;">
                                        <input type="hidden" name="categoryId" value="${C.id}" />
                                        <button type="submit" class="list-group-item ${tag1 == C.id ? 'active' : ''}">
                                            ${C.name}
                                        </button>
                                    </form>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Giá Tiền</h3>
                            <% if (request.getAttribute("errorMessage") != null) { %>
                            <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
                            <% } %>

                            <div class="price-filter">
                                <form action="/Swp391/searchPrice" method="post">
                                    <div id="price-slider"></div>
                                    <div class="price-values">
                                        <input type="number" id="minPrice" name="minPrice" class="form-control" placeholder="Min" required>
                                        <input type="number" id="maxPrice" name="maxPrice" class="form-control" placeholder="Max" required>
                                    </div>
                                    <center><button type="submit" id="searchButton" class="btn btn-primary">Tìm Kiếm</button></center>
                                </form>
                            </div>
                            <% if (request.getAttribute("errorMessage") != null) { %>
                            <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
                            <% } %>

                        </div>


                        <style>
                            /* Overall container styling */
                            .aside {
                                background-color: #f8f9fa;
                                padding: 15px;
                                border-radius: 8px;
                                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                                margin-bottom: 50px;
                            }

                            .aside-title {
                                font-size: 1.25rem;
                                font-weight: bold;
                                color: #333;
                                margin-bottom: 15px;
                            }

                            /* Slider styling */
                            #price-slider {
                                margin-bottom: 15px;
                            }

                            /* Input field styling */
                            .form-control {
                                border: 1px solid #D10024;
                                color: #333;
                                background-color: #fff;
                                border-radius: 4px;
                                box-shadow: none;
                                margin-bottom: 10px;
                                padding: 8px;
                            }

                            .form-control::placeholder {
                                color: #D10024;
                            }

                            .form-control:focus {
                                border-color: #D10024;
                                box-shadow: 0 0 3px rgba(209, 0, 36, 0.5);
                                outline: none;
                            }

                            /* Button styling */
                            .btn-primary {
                                background-color: #D10024;
                                border-color: #D10024;
                                color: #fff;
                                border-radius: 4px;
                                padding: 10px 15px;
                                font-size: 1rem;
                                font-weight: bold;
                                text-transform: uppercase;
                                transition: background-color 0.3s ease, border-color 0.3s ease;
                            }

                            .btn-primary:hover {
                                background-color: #a6001b;
                                border-color: #a6001b;
                            }

                            /* Additional styling for form spacing */
                            .price-filter form {
                                margin-top: 10px;
                            }
                        </style>




                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Brand</h3>
                            <div class="checkbox-filter">
                                <c:forEach items="${listBrand}" var="b">
                                    <form action="${pageContext.request.contextPath}/brand" method="POST" style="margin-bottom: 10px;">
                                        <input type="hidden" name="brandId" value="${b.id}" />
                                        <button type="submit" class="list-group-item text-white ${tag == b.id ? 'active' : ''}">
                                            ${b.name}
                                        </button>
                                    </form>
                                </c:forEach>

                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Latest Product: </h3>
                            <c:forEach items="${listLast}" var="L">
                                <div class="product-widget">
                                    <div class="product-img">

                                        <img src="${L.image}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${L.category}</p>
                                        <h3 class="product-name"><a href="#">${L.name}</a></h3>
                                        <h4 class="product-price">${L.price}<del class="product-old-price">$${L.price*2/3}</del></h4>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->

                        <!-- /store top filter -->

                        <!-- store products -->

                        <div class="row">

                            <!-- product -->
                            <c:forEach items="${listProducts}" var="p">
                                <c:if test="${p.isHidden == 0}">
                                    <div class="col-md-4 col-xs-6">
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="${p.image}" alt="">
                                                <div class="product-label">
                                                    <span class="sale">-5%</span>
                                                    <span class="new">NEW</span>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${p.category.name}</p>
                                                <h3 class="product-name" style="height: 60px">
                                                    <a href="productdetail?pid=${p.id}">${p.name}</a>
                                                </h3>
                                                <h4 class="product-price">
                                                    <fmt:formatNumber value="${p.price}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫ 
                                                    <del class="product-old-price">
                                                        <fmt:formatNumber value="${p.price + p.price * 0.05}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫
                                                    </del>
                                                </h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i> 
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <!-- Product buttons or actions here -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>

                            <!-- /product -->



                            <!-- /store products -->

                            <!-- store bottom filter -->


                            <!-- Pagination -->


                            <!-- /store bottom filter -->
                        </div>
                        <div class="pagination-container" style="">
                            <c:choose>
                                <c:when test="${listProducts == null || listProducts.size() == 0}">
                                    Not found
                                </c:when>
                                <c:otherwise>
                                    <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                        <ul class="pagination">
                                            <li class="page-item"><a class="page-link" href="allproduct?page=${page-1}">Trang trước</a></li>
                                                <c:forEach begin="1" end="${totalPage}" var="i">
                                                <li class="page-item ${i == page ? 'active' : ''}"><a class="page-link" href="allproduct?page=${i}">${i}</a></li>
                                                </c:forEach>
                                            <li class="page-item"><a class="page-link" href="allproduct?page=${page+1}">Trang sau</a></li>
                                        </ul>
                                    </nav>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <style>
                            /* Đặt màu nền và màu chữ cho các liên kết phân trang */
                            .pagination .page-link {
                                color: #D10024; /* Màu chữ */
                                border: 1px solid #D10024; /* Màu viền */
                                background-color: white; /* Màu nền */
                            }

                            .pagination .page-link:hover {
                                background-color: #D10024; /* Màu nền khi hover */
                                color: white; /* Màu chữ khi hover */
                                border-color: #D10024; /* Màu viền khi hover */
                            }

                            .pagination .page-item.active .page-link {
                                background-color: #D10024; /* Màu nền khi active */
                                border-color: #D10024; /* Màu viền khi active */
                                color: white; /* Màu chữ khi active */
                            }

                            /* Đặt khoảng cách giữa các phần tử phân trang */
                            .pagination .page-item {
                                margin: 0 5px; /* Thay đổi giá trị này để điều chỉnh khoảng cách */
                            }

                        </style>
                        <!-- /STORE -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /SECTION -->

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
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </body>
</html>