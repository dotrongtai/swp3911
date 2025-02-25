<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Product Manage</title>
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
        <!--        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <script>
            $(document).ready(function () {
                let deleteUrl;

                $(".delete").click(function (event) {
                    event.preventDefault();
                    deleteUrl = $(this).attr("href");
                    $("#deleteConfirmationModal").modal("show");
                });

                $("#confirmDeleteBtn").click(function () {
                    window.location.href = deleteUrl;
                });
            });
        </script>
        <style>
            .btn-green{
                background-color: #28a745;
                color: white;
            }
            .btn-add-product {
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                margin-bottom: 10px;
            }

            .btn-add-product:hover {
                background-color: #218838; /* Màu xanh đậm hơn khi hover */
            }
        </style>

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
                     font-size: 16px;"> &nbsp; <a href="logout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <a href="addproduct" class="btn-add-product btn-green"> Thêm sản phẩm mới</a>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Hình ảnh</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Loại</th>
                                            <th>Nhãn hàng</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Chip</th>
                                            <th>RAM</th>
                                            <th>ROM</th>
                                            <th>GPU</th>
                                            <th style="padding-right: 20px">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${product}">
                                            <tr>
                                                <td>
                                                    <a class="product-img">
                                                        <img style="width: 5rem; height: 5rem;" src="${product.image}" alt="product">
                                                    </a>
                                                </td>
                                                <td>${product.name}</td>
                                                <td>${product.category.name}</td>
                                                <td>${product.brand.name}</td>
                                                <td>${product.price}</td>
                                                <td>${product.stock}</td>
                                                <td>${product.chip}</td>
                                                <td>${product.ram}</td>
                                                <td>${product.rom}</td>
                                                <td>${product.gpu}</td>
                                                <td>
                                                    <button class="btn btn-green btn-xs" onclick="addStock('${product.id}')">Thêm số lượng</button>
                                                    <button class="btn btn-primary btn-xs" onclick="editProduct('${product.id}')">Chỉnh sửa</button>
                                                    <c:choose>
                                                        <c:when test="${product.isHidden == 0}">
                                                            <button class="btn btn-danger btn-xs" onclick="toggleProduct('${product.id}', true)">Ẩn sản phẩm</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="btn btn-success btn-xs" onclick="toggleProduct('${product.id}', false)">Hiện sản phẩm</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <script>
                                    function addStock(id) {
                                        window.location.href = 'addquantityproduct?id=' + id;
                                    }

                                    function editProduct(id) {
                                        window.location.href = 'updateproduct?id=' + id;
                                    }

                                    function toggleProduct(id, isHidden) {
                                        if (isHidden) {
                                            if (confirm('Bạn có chắc muốn ẩn sản phẩm này?')) {
                                                window.location.href = 'hiddenproduct?id=' + id;
                                            }
                                        } else {
                                            if (confirm('Bạn có chắc muốn hiện sản phẩm này?')) {
                                                window.location.href = 'showproduct?id=' + id;
                                            }
                                        }
                                    }
                                </script>

                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- ADD -->

                    <!-- /ADD -->
                    <!-- Delete Confirmation Modal -->
                    <div id="deleteConfirmationModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Delete Confirmation</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <p>Do you really want to delete this?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
        <!-- SCRIPTS -AT THE BOTTOM TO REDUCE THE LOAD TIME-->
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
