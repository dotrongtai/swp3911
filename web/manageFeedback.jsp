<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Quản lý đơn hàng</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/custom.css" rel="stylesheet" />
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
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
                    <a class="navbar-brand" href="homestaff">Trang Nhân Viên</a>
                </div>
                <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"> Last access : 30 May 2014 &nbsp; <a href="logout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
            </nav>
            <nav class="navbar-default navbar-side" role="navigation">
                <div class="sidebar-collapse">
                    <center>
                        <ul class="nav" id="main-menu">
                            <li class="text-center">
                                <img src="img/logo1.png" class="user-image img-responsive" />
                            </li>
                            <li>
                                <a href="homestaff">
                                    <img src="img/home.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                        Trang chủ
                                </a>
                            </li>
                            <li>
                                <a href="ordercod">
                                    <img src="img/iconpm.png" alt="Home" style="width: 38px; height: 38px; margin-left:5px;margin-right:7px;">
                                        Đơn hàng thanh toán bằng COD
                                </a>
                            </li>
                            <li>
                                <a href="ordervnpay">
                                    <img src="img/iconbrand.png" alt="Home" style="width: 40px; height: 40px; margin-left:5px;margin-right:5px;">
                                        Đơn hàng thanh toán bằng VNpay
                                </a>
                            </li>
                            <li>
                                <a href="managefeedback">
                                    <img src="img/iconuser.png" alt="Home" style="width: 35px; height: 35px; margin-left:5px;margin-right:10px;">
                                        Quản lý Feedback
                                </a>
                            </li>
                        </ul>
                    </center>
                </div>
            </nav>
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã feedback</th>
                                            <th>Mail đánh giá</th>
                                            <th>Tên người đánh giá</th>
                                            <th>Số sao</th>
                                            <th>Nội dung đánh giá</th>
                                            <th>Chức năng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="feedback" items="${feedback}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>FB${feedback.id}</td>
                                                <td>${feedback.user.email}</td>
                                                <td>${feedback.user.fullName}</td>
                                                <td>${feedback.rate}</td>
                                                <td>${feedback.comment}</td>
                                                <td>
                                                    <button class="btn btn-primary btn-xs" onclick="deleteFeedback('${feedback.id}')">Xóa feedback</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function deleteFeedback(id) {

                if (confirm('Bạn có chắc muốn xóa feedback này?')) {
                    window.location.href = 'deletefeedback?id=' + id;
                }
            }
        </script>
        <script src="assets/js/jquery-1.10.2.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.metisMenu.js"></script>
        <script src="assets/js/dataTables/jquery.dataTables.js"></script>
        <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();

                // Hàm định dạng số thành đơn vị tiền tệ
                function formatCurrency(amount) {
                    return amount.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                }

                // Định dạng tất cả các giá tiền trên trang
                $('.product-price').each(function () {
                    var priceText = $(this).text();
                    var price = parseFloat(priceText.replace(/,/g, '')); // Loại bỏ dấu phẩy để chuyển đổi sang số
                    $(this).text(formatCurrency(price));
                });
            });
        </script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>