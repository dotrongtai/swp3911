<%-- 
    Document   : homeadmin
    Created on : Jun 8, 2024, 4:40:46 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Free Bootstrap Admin Template : Binary Admin</title>
        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- MORRIS CHART STYLES-->
        <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>
    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="homeadmin">Trang Quản Lý</a> 
                </div>
                <div style="color: white;
                     padding: 15px 50px 5px 50px;
                     float: right;
                     font-size: 16px;">  &nbsp; <a href="logout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
            </nav>   
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav" id="main-menu">
                        <li class="text-center">
                            <img src="img/logo1.png" class="user-image img-responsive" />
                        </li>
                        <li>
                            <a href="homeadmin">
                                <img src="img/home.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                    Trang chủ
                            </a>
                        </li>
                        <li>
                            <a href="manageproduct">
                                <img src="img/iconpm.png" alt="Home" style="width: 38px; height: 38px; margin-left:5px;margin-right:7px;">
                                    Quản Lý Sản Phẩm
                            </a>
                        </li>
                        <li>
                            <a href="brandmanagerment">
                                <img src="img/iconbrand.png" alt="Home" style="width: 40px; height: 40px; margin-left:5px;margin-right:5px;">
                                    Quản Lý Nhãn Hàng
                            </a>
                        </li>
                        <li>
                            <a href="categorymanagerment">
                                <img src="img/iconcategory.png" alt="Home" style="width: 40px; height: 40px; margin-left:5px;margin-right:5px;">
                                    Quản Lý Loại Sản Phẩm
                            </a>
                        </li>
                        <li>
                            <a href="accountManagerment.jsp">
                                <img src="img/iconuser.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                    Quản Lý Tài Khoản
                            </a>
                        </li>
                        
	
                        <li>
                            <a href="statistic">
                                <img src="img/statistic.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                    Thống Kê
                            </a>
                        </li>
                        <li>
                            <a href="roleManagerment.jsp">
                                <img src="img/role.png" alt="Home" style="width: 30px; height: 30px; margin-left:5px;margin-right:15px;">
                                    Phân Quyền
                            </a>
                        </li>				

                    </ul>
                </div>
            </nav> 
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>Trang Admin</h2>   
                            <h5>Welcome ${sessionScope.acc.fullName} , Love to see you back. </h5>
                        </div>
                    </div>              
                    <!-- /. ROW  -->
                    <hr />
                              

                    <!-- /. ROW  -->
                    <div class="row"> 
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Giới thiệu về Trang Admin
                                </div>
                                <div class="panel-body">
                                    <p>Chào mừng bạn đến với Trang Quản Lý của chúng tôi! Tại đây, bạn có thể quản lý tất cả các khía cạnh của hệ thống, bao gồm:</p>
                                    <ul>
                                        <li>Quản lý sản phẩm</li>
                                        <li>Quản lý nhãn hàng</li>
                                        <li>Quản lý loại sản phẩm</li>
                                        <li>Quản lý tài khoản người dùng</li>
                                        <li>Quản lý đơn hàng</li>
                                        <li>Xem thống kê</li>
                                        <li>Phân quyền người dùng</li>
                                    </ul>
                                    
                                    <p>Chúc bạn một ngày làm việc hiệu quả!</p>
                                </div>
                            </div>
                        </div>
                    </div> 
                     <div class="row">
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">Tổng số sản phẩm</div>
                            <div class="panel-body">
                                <h3>${totalProducts}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">Tổng số người dùng</div>
                            <div class="panel-body">
                                <h3>${totalUsers}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">Tổng số nhãn hàng</div>
                            <div class="panel-body">
                                <h3>${totalBrands}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">Tổng số loại sản phẩm</div>
                            <div class="panel-body">
                                <h3>${totalCategories}</h3>
                            </div>
                        </div>
                    </div>
                    <!-- /. ROW  -->           
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->
        <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
        <!-- JQUERY SCRIPTS -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- METISMENU SCRIPTS -->
        <script src="assets/js/jquery.metisMenu.js"></script>
        <!-- MORRIS CHART SCRIPTS -->
        <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
        <script src="assets/js/morris/morris.js"></script>
        <!-- CUSTOM SCRIPTS -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>
