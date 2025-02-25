<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistics Page</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet1">
        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <!-- BOOTSTRAP STYLES-->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLES-->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- GOOGLE FONTS-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <!-- TABLE STYLES-->
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawCharts);

            function drawCharts() {
                drawPieChartCate();
                drawPieChartBrand();
                drawLineChartPayment();
                drawLineChartOrder();
            }

            function drawPieChartCate() {
                var data = google.visualization.arrayToDataTable([
                    ['Category', 'Count'],
            <c:forEach var="category" items="${listCategories}">
                    ['${category.name}', ${category.count}],
            </c:forEach>
                ]);

                var options = {
                    title: 'Category Distribution',
                    pieHole: 0.4
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechartCategory'));
                chart.draw(data, options);
            }

            function drawPieChartBrand() {
                var data = google.visualization.arrayToDataTable([
                    ['Brand', 'Count'],
            <c:forEach var="brand" items="${listBrands}">
                    ['${brand.name}', ${brand.count}],
            </c:forEach>
                ]);

                var options = {
                    title: 'Brand Distribution',
                    pieHole: 0.4
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechartBrand'));
                chart.draw(data, options);
            }

            function drawLineChartPayment() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Date');
                data.addColumn('number', 'Paid');
                data.addColumn('number', 'Unpaid');

                var rows = [];
            <c:forEach var="payment" items="${paymentDataList}">
                rows.push(['${payment.date}', ${payment.paid != null ? payment.paid : 0}, ${payment.unpaid != null ? payment.unpaid : 0}]);
            </c:forEach>

                
            }

            function drawLineChartOrder() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Date');
                data.addColumn('number', 'Total');

                var rows = [];
            <c:forEach var="order" items="${listOrders}">
                rows.push(['${order.date}', ${order.total}]);
            </c:forEach>

                data.addRows(rows);

                var options = {
                    title: 'Total Payment Amount by Date',
                    curveType: 'function',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.LineChart(document.getElementById('linechartOrder'));
                chart.draw(data, options);
            }
        </script>
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
                     font-size: 16px;">  <a href="logout" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
            <!-- /. NAV SIDE  -->
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-9">
                            <h2>Trang thống kê:</h2>
                            <a href="exportData" class="btn btn-primary">Xuất Dữ Liệu</a>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <hr />
                    <div id="piechartCategory" style="width: 900px; height: 500px;"></div>
                    <div id="piechartBrand" style="width: 900px; height: 500px;"></div>
                    
                    <div id="linechartOrder" style="width: 900px; height: 500px;"></div>
                    <div class="container">
                        <div>Daily Revenue Statistics</div>     
       
        
        <!-- Column Chart -->
        <div style="width: 800px; height: 400px; margin-top: 20px;">
            <canvas id="revenueChart"></canvas>
        </div>
        
        <!-- JavaScript to populate Chart.js -->
        <script>
            var ctx = document.getElementById('revenueChart').getContext('2d');
            var chartData = {
                labels: [
                    <c:forEach var="order" items="${listOrder}">
                        '${order.date}',
                    </c:forEach>
                ],
                datasets: [{
                    label: 'Daily Revenue',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                    data: [
                        <c:forEach var="order" items="${listOrder}">
                            ${order.total},
                        </c:forEach>
                    ]
                }]
            };

            var revenueChart = new Chart(ctx, {
                type: 'bar',
                data: chartData,
                options: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        </script>
        
    </div>

                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
    </body>
</html>