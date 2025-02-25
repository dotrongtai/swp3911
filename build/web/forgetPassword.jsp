<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Register</title>
        <!-- Add the necessary Bootstrap CSS CDN link here -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #ff0000; /* Red */

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, #ff0000, #ffffff, #000000);

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, #ff0000, #ffffff, #000000);
            }
            .custom-btn {
                background-color: #ff0000;
                border-color: #ff0000;
                color: white;
                margin-top: -20px;

            }
            .custom-btn:hover {
                background-color: #cc0000;
                border-color: #cc0000;
            }
            .custom-link {
                color: #ff0000;
            }
            .custom-link:hover {
                color: #cc0000;
            }
            .card-short {
                max-height: 600px; /* Adjust the height as needed */
                padding: 2rem; /* Adjust padding to balance content spacing */
                background-color: #ffffff7a; /* Set background color with opacity */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* Add shadow with 50% opacity */
                margin-bottom: 20px; /* Add margin to the bottom of the card */
            }
            .form-label {
                text-align: left; /* Align labels to the left */
                margin-left: 5px;
                color: red; /* Set the color of labels to red */
                display: block;
                margin-bottom: 1px; /* Add space between label and input */
            }
            h2.fw-bold {
                color: red; /* Set the color of "Register" to red */
                font-size: 2rem;
                text-transform: uppercase;
                margin-bottom: 1.5rem; /* Adjust bottom margin */
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px; /* Add space between logo and text */
            }
            .form-outline {
                margin-bottom: 10px; /* Add margin-bottom to create space between input and button */
            }

            .custom-btn {
                background-color: #ff0000;
                border-color: #ff0000;
                color: white;
                margin-top: -20px;
                margin-bottom: 10px; /* Add margin-bottom to create space between input and button */
            }
            .form-control-lg {
                margin-top:  2px; /* Thêm margin-right cho phần ô nhập email */
            }

            .custom-btn {
                margin-top: 20px; /* Thêm margin-left cho nút register */
            }

        </style>
    </head>
    <body>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card text-white card-short" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">
                                <div class="mb-md-5 mt-md-4 pb-5">
                                    <h2 class="text-muted">Quên Mật Khẩu</h2><br/><br/>
                                    <center>
                                        <p style="color: red">${messNotExsit}</p>
                                        <p style="color: red">${messForgetPass}</p>
                                    </center>
                                    <form action="forgetpass" method="post">
                                        <div data-mdb-input-init class="form-outline form-white mb-4">
                                            <label class="form-label" for="typeEmailX">*Nhập Email</label>
                                            <input name="email" type="email" id="typeEmailX" class="form-control form-control-lg" />
                                        </div>
                                        <br/>

                                        <button data-mdb-button-init data-mdb-ripple-init class="btn custom-btn btn-lg px-5" type="submit">Lấy Mã OTP</button>
                                    </form>
                                    <p class="small mb-5 pb-lg-2"><a class="custom-link" href="login.jsp">Return Login Page</a></p>


                                    <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                        <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                        <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                        <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Add the necessary Bootstrap JS CDN link here -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
