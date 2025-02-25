<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>add product</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- MORRIS CHART STYLES-->
        <!-- CUSTOM STYLES-->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <!-- TABLE STYLES-->
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    </head>
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
                 font-size: 16px;">  <a href="logout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
                        <a href="#">
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
        <div id="page-wrapper">
            <div id="page-inner">

                <!-- /. ROW  -->
                <hr />
                <div class="row">
                    <div class="col-md-6">
                        <!-- Form Elements -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Thêm sản phẩm
                            </div>
                            <div class="panel-body">
                                <c:if test="${not empty sessionScope.errors}">
                                    <div class="alert alert-danger">
                                        <ul>
                                            <c:forEach var="error" items="${sessionScope.errors}">
                                                <li>${error}</li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <c:remove var="errors" scope="session" />
                                </c:if>
                                <form action="addproduct" method="post">
                                    <div class="form-group">
                                        <label>Loại sản phẩm</label>
                                        <select name="category">
                                            <c:forEach var="category" items="${requestScope.category}">
                                                <option value="${category.id}">${category.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên nhãn hàng</label>
                                        <select name="brand">
                                            <c:forEach var="o" items="${requestScope.brand}">
                                                <option value="${o.id}">${o.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input type="text" class="form-control" name="name" />
                                    </div>
                                    <div class="form-group">
                                        <label>Hình ảnh</label>
                                        <input type="text" class="form-control" name="image" />
                                    </div>
                                    <div class="form-group">
                                        <label>Chip</label>
                                        <input type="text" class="form-control" name="chip" />
                                    </div>
                                    <div class="form-group">
                                        <label>RAM</label>
                                        <input type="text" class="form-control" name="ram" />
                                    </div>
                                    <div class="form-group">
                                        <label>ROM</label>
                                        <input type="text" class="form-control" name="rom" />
                                    </div>
                                    <div class="form-group">
                                        <label>GPU</label>
                                        <input type="text" class="form-control" name="gpu" />
                                    </div>
                                    <div class="form-group">
                                        <label>Giá sản phẩm</label>
                                        <input type="number" class="form-control" name="price" />
                                    </div>
                                    <div class="form-group">
                                        <label>Mô tả chi tiết</label>
                                        <input type="text" class="form-control" name="description" />
                                    </div>
                                    <div class="form-group">
                                        <label></label>
                                        <input type="number" class="form-control hidden" name="stock" value="0" />
                                    </div>
                                    <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                                </form>
                            </div>
                        </div>
                        <!-- End Form Elements -->
                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- SCRIPTS AT THE BOTTOM TO REDUCE THE LOAD TIME -->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="assets/js/dataTables/jquery.dataTables.js"></script>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>
</body>
</html>