<%-- 
    Document   : changepassword
    Created on : Jun 10, 2024, 10:30:28 AM
    Author     : Le Minh Hai
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background: #F8F8F8;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .form-control:focus {
                box-shadow: none;
                border-color: #BA68C8;
            }
            .profile-button {
                background: #cc0000;
                box-shadow: none;
                border: none;
            }
            .profile-button:hover,
            .profile-button:focus,
            .profile-button:active {
                background: #F44336;
                box-shadow: none;
            }
            .back:hover {
                color: #682773;
                cursor: pointer;
            }
            .labels {
                font-size: 11px;
            }
            .add-experience:hover {
                background: #BA68C8;
                color: #fff;
                cursor: pointer;
                border: solid 1px #BA68C8;
            }
            .edit-button {
                margin-top: 10px;
                width: 100%;
            }
            .container {
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 10px;
                max-width: 900px;
                background: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .input-group-text {
                cursor: pointer;
            }
        </style>
        <script>
            function togglePassword(id) {
                const input = document.getElementById(id);
                const icon = document.getElementById(id + "-icon");
                if (input.type === "password") {
                    input.type = "text";
                    icon.classList.remove("bi-eye-slash");
                    icon.classList.add("bi-eye");
                } else {
                    input.type = "password";
                    icon.classList.remove("bi-eye");
                    icon.classList.add("bi-eye-slash");
                }
            }
        </script>
    </head>
    <body>
        <div class="container rounded bg-white">
            <div class="row">
                <div class="col-md-5 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="Profile Picture">
                        <span class="font-weight-bold">${sessionScope.acc.fullName}</span>
                        <button class="btn btn-secondary profile-button edit-button" type="button" onclick="window.location.href = 'profile'">Quay về trang profile</button>
                        <button class="btn btn-secondary profile-button edit-button" type="button" onclick="window.location.href = 'home.jsp'">Quay về trang chủ</button>
                        <span> </span>
                    </div>
                </div>
                <div class="col-md-7 ">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Đổi Mật Khẩu</h4>
                        </div>

                        <div class="row mt-3">
                            <form action="changepassword" method="post">
                                <p style="color: red">${requestScope.mess1}</p>
                                <div class="col-md-12 mb-3">
                                    <label class="labels">Nhập mật khẩu hiện tại</label>
                                    <div class="input-group">
                                        <input required type="password" class="form-control" placeholder="nhập mật khẩu hiện tại" name="pass" id="pass" required>
                                        <span class="input-group-text" onclick="togglePassword('pass')">
                                            <i class="bi bi-eye-slash" id="pass-icon"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="labels">Nhập mật khẩu mới</label>
                                    <div class="input-group">
                                        <input required type="password" class="form-control" placeholder="nhập mật khẩu mới" name="newpass" id="newpass" required>
                                        <span class="input-group-text" onclick="togglePassword('newpass')">
                                            <i class="bi bi-eye-slash" id="newpass-icon"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-12 mb-3">
                                    <label class="labels">Xác nhận mật khẩu mới</label>
                                    <div class="input-group">
                                        <input required type="password" class="form-control" placeholder="xác nhận mật khẩu mới" name="comfirmnewpass" id="comfirmnewpass" required>
                                        <span class="input-group-text" onclick="togglePassword('comfirmnewpass')">
                                            <i class="bi bi-eye-slash" id="comfirmnewpass-icon"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit">Lưu Thông Tin</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    </body>
</html>
