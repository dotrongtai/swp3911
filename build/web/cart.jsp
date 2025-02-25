<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                background: #ddd;
                min-height: 100vh;
                vertical-align: middle;
                display: flex;
                font-family: sans-serif;
                font-size: 0.8rem;
                font-weight: bold;
            }
            .title {
                margin-bottom: 5vh;
            }
            .card {
                margin: auto;
                max-width: 1300px;
                width: 90%;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 1rem;
                border: transparent;
            }
            @media(max-width: 767px) {
                .card {
                    margin: 3vh auto;
                }
            }
            .cart {
                background-color: #fff;
                padding: 4vh 5vh;
                border-bottom-left-radius: 1rem;
                border-top-left-radius: 1rem;
            }
            @media(max-width: 767px) {
                .cart {
                    padding: 4vh;
                    border-bottom-left-radius: unset;
                    border-top-right-radius: 1rem;
                }
            }
            .summary {
                background-color: #ddd;
                border-top-right-radius: 1rem;
                border-bottom-right-radius: 1rem;
                padding: 4vh;
                color: rgb(65, 65, 65);
            }
            @media(max-width: 767px) {
                .summary {
                    border-top-right-radius: unset;
                    border-bottom-left-radius: 1rem;
                }
            }
            .summary .col-2, .summary .col-10 {
                padding: 0;
            }
            .row {
                margin: 0;
            }
            .title b {
                font-size: 1.5rem;
            }
            .main {
                margin: 0;
                padding: 2vh 0;
                width: 100%;
            }
            .col-2, .col {
                padding: 0 1vh;
            }
            a {
                padding: 0 1vh;
            }
            .close {
                margin-left: auto;
                font-size: 0.7rem;
            }
            img {
                width: 3.5rem;
            }
            .back-to-shop {
                margin-top: 4.5rem;
            }
            h5 {
                margin-top: 4vh;
            }
            hr {
                margin-top: 1.25rem;
            }
            form {
                padding: 2vh 0;
            }
            select, input {
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1.5vh 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input:focus::-webkit-input-placeholder {
                color: transparent;
            }
            .btn {
                background-color: #C90000;
                border-color: #C90000;
                color: white;
                width: 100%;
                font-size: 0.7rem;
                margin-top: 4vh;
                padding: 1vh;
                border-radius: 0;
            }
            .btn:focus {
                box-shadow: none;
                outline: none;
                box-shadow: none;
                color: white;
                -webkit-box-shadow: none;
                -webkit-user-select: none;
                transition: none;
            }
            .btn:hover {
                color: white;
            }
            a {
                color: black;
            }
            a:hover {
                color: black;
                text-decoration: none;
            }
            #code {
                background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253), rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
                background-repeat: no-repeat;
                background-position-x: 95%;
                background-position-y: center;
            }
            .quantity-controls {
                display: flex;
                align-items: center;
            }
            .quantity-controls form {
                display: inline;
                margin: 0 0.25rem;
            }
            .quantity-controls .btn {
                padding: 0.2rem 0.5rem;
                font-size: 0.8rem;
            }
            .quantity-link {
                margin: 0 0.25rem;
                font-size: 1.2rem;
                color: #000;
                text-decoration: none;
            }
        </style>
        <script type="text/javascript">
            function doDelete(cartId) {
                if (confirm("Are you sure you want to delete the item with ID = " + cartId + "?")) {
                    window.location.href = "deleteitemincart?id=" + cartId;
                }
            }

            function checkCartEmpty() {
                const itemCount = ${listcart.size()};
                if (itemCount === 0) {
                    alert("Giỏ hàng của bạn hiện chưa có sản phẩm nào.");
                    return false;
                } else {
                    window.location.href = "checkout";
                }
            }
        </script>
    </head>
    <body>
        <div class="card">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col"><h4><b>Giỏ hàng</b></h4></div>
                            <div class="col align-self-center text-right text-muted">${listcart.size()} items</div>
                        </div>
                    </div>
                    <c:forEach items="${listcart}" var="c">
                        <div class="row border-top border-bottom">
                            <div class="row main align-items-center">
                                <div class="col-2"><img class="img-fluid" src="${c.image}" alt="Product Image"></div>
                                <div class="col">
                                    <div class="row text-muted"></div>
                                    <div class="row">${c.name}</div>
                                </div>
                                <div class="col">
                                    Color: ${c.colorName}
                                </div>
                                <div class="col">
                                    <fmt:formatNumber value="${c.price}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫
                                </div>
                                <div class="col quantity-controls">
                                    <form action="updatequantity" method="post">
                                        <input type="hidden" name="id" value="${c.id}" />
                                        <input type="hidden" name="userId" value="${c.userId}" />
                                        <input type="hidden" name="action" value="decrement" />
                                        <a href="#" class="quantity-link" onclick="this.closest('form').submit(); return false;">-</a>
                                    </form>
                                    <a href="#" class="border">${c.quantity}</a>
                                    <!-- Conditional increment button display -->
                                    <c:if test="${c.quantity < c.stockVariant}">
                                        <form action="updatequantity" method="post">
                                            <input type="hidden" name="id" value="${c.id}" />
                                            <input type="hidden" name="userId" value="${c.userId}" />
                                            <input type="hidden" name="action" value="increment" />
                                            <a href="#" class="quantity-link" onclick="this.closest('form').submit(); return false;">+</a>
                                        </form>
                                    </c:if>
                                </div>
                                <div class="col">
                                    <fmt:formatNumber value="${c.price*c.quantity}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫
                                    <a class="close" href="#" onclick="doDelete(${c.id})">&#10005;</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach><br/>

                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="cart?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                    <div class="back-to-shop"><a href="home" style="color: red">&leftarrow; Quay về trang chủ</a></div>
                </div>
                <div class="col-md-4 summary">
                    <div><h5><b>Summary</b></h5></div>
                    <hr>
                    <div class="row">
                        <div class="col" style="padding-left:0;">ITEMS ${listcart.size()}</div>
                        <div class="col text-right">
                            <fmt:formatNumber value="${total}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫
                        </div>
                    </div>
                    <form>
                        <p>SHIPPING</p>
                        <select><option class="text-muted">Miễn phí vận chuyển</option></select>
                    </form>
                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">TOTAL PRICE</div>
                        <div class="col text-right">
                            <fmt:formatNumber value="${total}" type="currency" maxFractionDigits="0" currencySymbol=""/>₫
                        </div>
                    </div>
                    <a href="#" class="btn" onclick="return checkCartEmpty();">CHECKOUT</a>
                </div>
            </div>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
