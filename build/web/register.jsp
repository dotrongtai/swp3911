<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>User Registration</title>
        <!-- Bootstrap CSS -->
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
                min-height: 100vh; /* Ensure the section takes full viewport height */
                display: flex;
                align-items: center; /* Vertically center the content */
                justify-content: center; /* Horizontally center the content */
            }
            .custom-btn {
                background-color: #ff0000;
                border-color: #ff0000;
                color: white;
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
                width: 100%;
                max-width: 500px; /* Adjust the max-width as needed */
                padding: 1.5rem; /* Reduced padding for more content space */
                margin: 20px; /* Add margin for some spacing around the card */
                overflow-y: auto; /* Enable scrolling if content overflows */
            }
            .form-control:focus {
                box-shadow: none;
                border-color: #ff0000;
            }
        </style>
    </head>
    <body>
        <section class="gradient-custom">
            <div class="container h-100 d-flex justify-content-center align-items-center">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card bg-dark text-white card-short" style="border-radius: 1rem;">
                        <div class="card-body p-4 text-center">
                            <div class="mb-md-5 mt-md-4 pb-4">
                                <h2 class="fw-bold mb-2 text-uppercase">Register</h2>
                                <p class="text-white-50 mb-4">Please enter your details to register!</p>
                                <p style="color: red;">${mess}</p>
                                <p style="color: red;">${err}</p>
                                <form action="register" method="post">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" class="form-control" id="passWord" name="passWord" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Xác nhận mật khẩu</label>
                                        <input type="password" class="form-control" id="confirmPass" name="confirmPass" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="fullname">Họ & Tên</label>
                                        <input type="text" class="form-control" id="fullName" name="fullName" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Giới tính</label>
                                        <div>
                                            <label class="btn btn-primary">
                                                <input type="radio" name="gender" id="male" value="Male" required> Nam
                                            </label>
                                            <label class="btn btn-primary">
                                                <input type="radio" name="gender" id="female" value="Female" required> Nữ
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="labels" for="dob">Ngày sinh</label>
                                        <input required type="date" id="dob" class="form-control" name="dob" value="${requestScope.user.dob}">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Điện thoại</label>
                                        <input type="text" class="form-control" id="phone" name="phone" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">Địa chỉ</label>
                                        <input type="text" class="form-control" id="address" name="address" required>
                                    </div>
                                    <input type="hidden" name="roleId" value="2">
                                    <button class="btn custom-btn btn-lg px-5 mt-3" type="submit">Tạo tài khoản</button>
                                </form>

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
        </section>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
