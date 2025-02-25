<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background: #f8f8f8;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .form-control:focus {
                box-shadow: none;
                border-color: #ba68c8;
            }
            .profile-button {
                background: #cc0000;
                box-shadow: none;
                border: none;
            }
            .profile-button:hover,
            .profile-button:focus,
            .profile-button:active {
                background: #f44336;
                box-shadow: none;
            }
            .back:hover {
                color: #682773;
                cursor: pointer;
            }
            .labels {
                font-size: 14px;
                color: #555;
                font-weight: bold;
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
            .form-group {
                margin-bottom: 15px;
            }
            .form-check-label {
                margin-left: 5px;
                font-size: 14px;
                color: #555;
            }
            .form-check-input {
                margin-right: 10px;
            }
            .profile-picture {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 50%;
                margin-top: 20px;
            }
            .text-center p {
                color: #ff0000;
                font-size: 14px;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container rounded bg-white">
            <div class="row">
                <div class="col-md-5 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <p>${sessionScope.messprofile}</p>
                        <img class="profile-picture" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" alt="Profile Picture">
                        <span class="font-weight-bold"></span>
                        <button class="btn btn-secondary profile-button edit-button" type="button" onclick="window.location.href = 'changePassword.jsp'">Thay đổi mật khẩu</button>
                        <button class="btn btn-secondary profile-button edit-button" type="button" onclick="window.location.href = 'home'">Quay về trang chủ</button>
                        <span> </span>
                    </div>
                </div>
                <div class="col-md-7 ">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Profile Settings</h4>
                        </div>

                        <form action="profile" method="post">
                            <div class="form-group">
                                <label class="labels">Email</label>
                                <input type="text" class="form-control" placeholder="email" value="${sessionScope.acc.email}" readonly>
                            </div>

                            <div class="form-group">
                                <label class="labels">Họ & Tên</label>
                                <input required type="text" class="form-control" placeholder="full name" name="fullName" value="${sessionScope.acc.fullName}">
                            </div>
                            <div class="form-group">
                                <label class="labels" for="gender">Giới tính</label>
                                <div style="display: flex; gap: 20px;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" ${sessionScope.acc.gender == 'male' ? 'checked' : ''} required>
                                        <label class="form-check-label" for="male">Nam</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="female" value="female" ${sessionScope.acc.gender == 'female' ? 'checked' : ''} required>
                                        <label class="form-check-label" for="female">Nữ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="labels" for="dob">Ngày sinh</label>
                                <input required type="date" id="dob" class="form-control" name="dob" value="${sessionScope.acc.dob}">
                            </div>
                            <div class="form-group">
                                <label class="labels">Số điện thoại</label>
                                <input required type="text" class="form-control" placeholder="phone number" name="phone" value="${sessionScope.acc.phone}">
                            </div>
                            <div class="form-group">
                                <label class="labels">Địa chỉ</label>
                                <input required type="text" class="form-control" placeholder="address" name="address" value="${sessionScope.acc.address}">
                            </div>
                            <div class="mt-5 text-center">
                                <button class="btn btn-primary profile-button" type="submit">Lưu Thông Tin</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
