<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HolaTech - Checkout</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
    </head>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            function clearMessageAfterTimeout(messageId, timestampId, timeout) {
                var messageElement = document.getElementById(messageId);
                var timestampElement = document.getElementById(timestampId);

                if (messageElement && timestampElement) {
                    var timestamp = parseInt(timestampElement.getAttribute("data-timestamp"));
                    if (timestamp) {
                        var currentTime = new Date().getTime();
                        if (currentTime - timestamp < timeout) {
                            setTimeout(function () {
                                messageElement.textContent = ''; // Clear the message
                            }, timeout - (currentTime - timestamp));
                        } else {
                            messageElement.textContent = ''; // Clear immediately if timestamp is outdated
                        }
                    }
                }
            }

            clearMessageAfterTimeout("messprofilecheckout", "messprofilecheckoutTime", 10000); // 10 seconds
            clearMessageAfterTimeout("messpayment", "messpaymentTime", 10000); // 10 seconds
        });
    </script>
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
        </header>        <!-- /HEADER -->

        <!-- NAVIGATION -->

        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Checkout</h3>
                        <ul class="breadcrumb-tree">
                            <li><a href="home">Home</a></li>
                            <li class="active">Checkout</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <div class="container">
                <div class="row">
                    <form action="checkout" method="post">
                        <!-- Billing Details -->
                        <div class="col-md-7">
                            <div class="billing-details">
                                <p id="messprofilecheckout" style="color: red">
                                    <c:out value="${requestScope.messprofilecheckout}"/>
                                </p>
                                <span id="messprofilecheckoutTime" data-timestamp="${sessionScope.messprofilecheckoutTime}"></span>

                                <p id="messpayment" style="color: red">
                                    <c:out value="${requestScope.messpayment}"/>
                                </p>
                                <span id="messpaymentTime" data-timestamp="${sessionScope.messpaymentTime}"></span>

                                <div class="section-title">
                                    <h3 class="title">Thông tin thanh toán</h3>
                                </div>
                                <div class="form-group">
                                    <input class="input" name="email" value="${sessionScope.acc.email}" readonly>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="fullname" placeholder="Họ & Tên" value="${sessionScope.acc.fullName}" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="phone" placeholder="Số điện thoại" value="${sessionScope.acc.phone}" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="city" placeholder="Tỉnh/Thành phố" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="district" placeholder="Quận/Huyện" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="commune" placeholder="Phường/Xã" required>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="address" placeholder="Địa chỉ" required>
                                </div>
                            </div>
                        </div>

                        <!-- Order Details -->
                        <div class="col-md-5 order-details">
                            <div class="section-title text-center">
                                <h3 class="title">Đơn hàng của bạn</h3>
                            </div>
                            <div class="order-summary">
                                <div class="order-col">
                                    <div><strong>Sản phẩm</strong></div>
                                    <div><strong>Thành tiền</strong></div>
                                </div>
                                <div class="order-products">
                                    <c:forEach items="${requestScope.listcart}" var="c">
                                        <div class="order-col">
                                            <div>${c.quantity}x ${c.name}</div>
                                            <div>
                                                <fmt:formatNumber value="${c.quantity * c.price}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="order-col">
                                    <div>Shipping</div>
                                    <div><strong>Free</strong></div>
                                </div>
                                <div class="order-col">
                                    <div><strong>TOTAL</strong></div>
                                    <div>
                                        <strong class="order-total">
                                            <fmt:formatNumber value="${requestScope.total}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫
                                        </strong>
                                    </div>
                                </div>
                            </div>
                            <div class="payment-method">
                                <div class="input-radio">
                                    <input type="radio" name="payment" id="payment-1" value="cod">
                                    <label for="payment-1">
                                        <span></span>
                                        Thanh toán khi nhận hàng
                                    </label>
                                </div>
                                <div class="input-radio">
                                    <input type="radio" name="payment" id="payment-2" value="vnpay">
                                    <label for="payment-2">
                                        <span></span>
                                        Thanh toán qua VNpay
                                    </label>
                                </div>
                            </div>
                            <button class="primary-btn order-submit">Đặt hàng</button>
                        </div>
                    </form>
                </div>
            </div>
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

    </body>
</html>
