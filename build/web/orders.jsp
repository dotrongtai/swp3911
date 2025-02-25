<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Orders</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <style>
            body {
                min-height: 100vh;
                background: linear-gradient(to right, #ff0000, #ffffff);
                font-family: 'Roboto', sans-serif;
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
                max-width: 1200px;
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
            }
            th {
                background-color: #ff0000;
                color: #ffffff;
                border-bottom: 2px solid #dddddd;
                font-weight: 700;
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
            .btn-secondary {
                background-color: #ff0000;
                border-color: #ff0000;
                font-weight: 700;
                margin-bottom: 20px;
            }
            .btn-secondary:hover {
                background-color: #cc0000;
                border-color: #cc0000;
            }
            h5 {
                margin-bottom: 0;
            }
        </style>
        <script>
            $(document).ready(function () {
                // Show orders with status 1 when "Đang xử lý" tab is clicked
                $('.nav-link').click(function () {
                    var statusId = $(this).data('status-id');
                    if (statusId === 0) {
                        $('.order-row').show(); // Show all rows if statusId is 0 (Tất cả)
                    } else {
                        $('.order-row').hide(); // Hide all rows first
                        $('.order-row[data-status-id="' + statusId + '"]').show(); // Show rows with matching statusId
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="container my-5">
            <div class="card-header">
                <a href="home">
                    <img class="img-fluid my-auto align-items-center mb-0 pt-3" src="./img/logo2.png" width="200" height="200">
                </a>
            </div>
            <div class="card-body">
                <a href="home" class="btn btn-secondary">Quay về trang chủ</a>
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-status-id="0">Tất cả</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-status-id="1">Đang xử lý</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-status-id="2">Chờ giao hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-status-id="3">Hoàn thành</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-status-id="4">Đã hủy</a>
                    </li>
                </ul>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">STT</th>
                            <th scope="col">Hình ảnh</th>
                            <th scope="col">Tên sản phẩm</th>
                            <th scope="col">Loại</th>
                            <th scope="col">Nhãn hàng</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Giá tiền</th>
                            <th scope="col">Tổng tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="orderCounter" value="1"/>
                        <c:forEach var="order" items="${orders}">
                            <c:forEach var="detail" items="${order.orderDetails}">
                                <tr class="order-row" data-status-id="${order.statusid.id}">
                                    <td>${orderCounter}</td>
                                    <td>
                                        <img style="width: 100px" src="${detail.pid.image}" alt="${detail.pid.name}" />
                                    </td>
                                    <td>${detail.nameProduct}</td>
                                    <td>${detail.pid.category.name}</td>
                                    <td>${detail.pid.brand.name}</td>
                                    <td>${detail.quantity}</td>
                                    <td><fmt:formatNumber value="${detail.pid.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                    <td><fmt:formatNumber value="${detail.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                                </tr>
                            </c:forEach>
                            <tr class="order-row" data-status-id="${order.statusid.id}">
                                <td colspan="8" style="text-align: right; font-weight: bolder;">
                                    <h5>Thành tiền: <a style="color: red; font-size: 30px"><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></a></h5>
                                    <hr>    
                                    <c:choose>
                                        <c:when test="${order.statusid.id == 1}">
                                            <a href="cancelorder?orderId=${order.id}" class="btn btn-primary ml-2">Hủy đơn hàng</a>
                                        </c:when>
                                    </c:choose>
                                    <a href="orderdetail?orderId=${order.id}" class="btn btn-primary ml-2">Xem chi tiết</a>
                                </td>
                            </tr>
                            <c:set var="orderCounter" value="${orderCounter + 1}"/>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
