<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Write Feedback</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

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
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="container">
            <div class="row">
                <!-- Product Image Section -->
                <br>
                <div class="col-md-2">
                    <div class="product-image" >
                        <img style="width: 200px" src="${requestScope.product.image}" alt="Product Image">
                    </div>
                </div>

                <!-- Product Details Section -->
                <br>
                <br><br>
                <div class="col-md-10">
                    <ul class="product-info">
                        <li>
                            <h3 style="width: 600px">Tên sản phẩm : ${requestScope.product.name}</h3>
                            <p>Phân loại : ${requestScope.product.category.name}</p>
                            <p>Hãng : ${requestScope.product.brand.name}</p>
                        </li>
                    </ul>
                    <br>
                    <!-- Review Form Section -->
                    <div class="col-md-6 offset-md-3">
                        <div id="review-form">
                            <form class="review-form" action="feedback" method="post" onsubmit="return validateForm()">
                                <input name="id" value="${requestScope.product.id}" type="number" class="hidden">
                                <textarea class="input" placeholder="Your Review" type="text" name="feedback" ></textarea>
                                <div class="input-rating">
                                    <span>Your Rating: </span>
                                    <div class="stars">
                                        <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                        <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                        <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                        <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                        <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                    </div>
                                </div>
                                <button class="primary-btn" type="submit">Submit</button>
                            </form>
                        </div>

                        <script>
                            function validateForm() {
                                var feedback = document.querySelector('textarea[name="feedback"]').value.trim();
                                var ratingSelected = document.querySelector('input[name="rating"]:checked');

                                if (feedback === "") {
                                    alert('Bạn chưa nhập feedback');
                                    return false;
                                }

                                if (!ratingSelected) {
                                    alert('Bạn phải chọn số sao');
                                    return false;
                                }

                                return true;
                            }
                        </script>

                        <br>
                        <a class="primary-btn" href="home"> Trở về trang chủ</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
