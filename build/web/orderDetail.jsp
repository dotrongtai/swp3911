<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order Detail</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <style>
            body {
                min-height: 100vh;
                background: linear-gradient(140deg, #ffffff, #BA68C8); /* Adjusted gradient */
                font-family: 'Roboto', sans-serif; /* Changed font */
                color: rgba(116, 116, 116, 0.667);
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container {
                background-color: #ffffff;
                border-radius: 1rem;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                padding: 2rem;
            }
            .card-header {
                background-color: #ffffff;
                border-radius: 1rem 1rem 0 0;
                padding: 1rem;
                text-align: center;
            }
            .card-body {
                background-color: #ffffff;
                border-radius: 0 0 1rem 1rem;
                padding: 2rem;
            }
            .table {
                background-color: #ffffff;
                border: 1px solid #ddd;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                border-radius: 0.5rem;
                width: 100%;
                table-layout: fixed;
            }
            th, td {
                text-align: center;
                vertical-align: middle;
                padding: 0.75rem;
                font-weight: bold; /* Font weight bold for all th and td */
            }
            th {
                background-color: #ff0000;
                color: #ffffff;
                border-bottom: 2px solid #dddddd;
                font-weight: 700; /* Ensure headers are bold */
            }
            td {
                background-color: #ffffff;
                border-bottom: 1px solid #dddddd;
                font-weight: 400;
            }
            tr:nth-child(even) td {
                background-color: #f8f9fa;
            }
            tr:last-child td {
                border-bottom: none;
            }
            .btn-primary {
                background-color: #ff0000;
                border-color: #ff0000;
                font-weight: 700;
            }
            .btn-primary:hover {
                background-color: #cc0000;
                border-color: #cc0000;
            }
            .nav-tabs {
                border-bottom: 1px solid #ddd;
                margin-bottom: 20px;
            }
            .nav-item {
                flex: 1;
                text-align: center;
            }
            .nav-link {
                color: #000;
                font-weight: 500;
                padding: 10px 15px;
                border: none;
                border-bottom: 3px solid transparent;
                transition: all 0.3s ease;
                width: 100%;
            }
            .nav-link:hover {
                border-bottom: 3px solid #ff0000;
            }
            .nav-link.active {
                color: #ff0000;
                border-bottom: 3px solid #ff0000;
                font-weight: 700;
            }
            h5 {
                margin-bottom: 0;
            }
            .product-image {
                width: 100px;
            }
            .product-category,
            .product-brand {
                font-size: 0.9em;
                color: #555;
            }
            .order-info {
                color: black;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container my-5">
            <div class="card">
                <div class="card-header bg-white">
                    <h5 class="card-title text-center"><img src="img/logo1.png" alt="alt" height="80px" /></h5>
                </div>
                <div class="card-body">
                    <div class="order-info">
                        <p><strong>Mã đơn hàng:</strong> ĐH${orders.id}</p>
                        <p><strong>Ngày đặt hàng:</strong> ${orders.date}</p>
                        <p><strong>Trạng thái đơn hàng:</strong> ${orders.statusid.status}</p>
                        <p><strong>Tên người nhận:</strong> ${orders.name}</p> <!-- Assuming this is the user's full name -->
                        <p><strong>Địa chỉ giao hàng:</strong> ${orders.detailedAddress}, ${orders.commune}, ${orders.district}, ${orders.province}</p>
                        <c:choose>
                            <c:when test="${requestScope.payment == 1}">
                                <p><strong>Hình thức thanh toán:</strong> Thanh toán bằng COD</p>
                            </c:when>
                            <c:when test="${requestScope.payment == 2}">
                                <p><strong>Hình thức thanh toán:</strong> Thanh toán bằng VNPay</p>
                            </c:when>
                            <c:otherwise>
                                <!-- Default case if payment value is neither 1 nor 2 -->
                                <p><strong>Hình thức thanh toán:</strong> Không xác định</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <hr>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Hình ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Loại</th>
                                <th>Nhãn hàng</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                                <th>Đánh giá</th> <!-- Thêm cột đánh giá -->
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="orderDetail" items="${orders.orderDetails}">
                                <tr class="product-row">
                                    <td><img src="${orderDetail.pid.image}" alt="${orderDetail.nameProduct}" class="product-image"></td>
                                    <td>${orderDetail.nameProduct}</td>
                                    <td><div class="product-category">${orderDetail.pid.category.name}</div></td>
                                    <td><div class="product-brand">${orderDetail.pid.brand.name}</div></td>
                                    <td><fmt:formatNumber value="${orderDetail.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    <td>${orderDetail.quantity}</td>
                                    <td><fmt:formatNumber value="${orderDetail.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    <c:if test="${orders.statusid.id == 3}">
                                        <td style="text-align: center;">
                                            <a style="font-weight: bold; width: 100px" href="feedback?pid=${orderDetail.pid.id}" class="btn btn-primary">Đánh giá</a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="text-center">
                        <a href="myorder" class="btn btn-primary">Quay về</a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                // Show product info when clicking on a product row
                $('.product-row').click(function () {
                    // Hide all product info rows
                    $('.product-info-row').hide();

                    // Get product id from data attribute
                    var productId = $(this).data('product-id');

                    // Show product info row for the clicked product
                    $('#product-info-' + productId).show();
                });
            });
        </script>
    </body>
</html>