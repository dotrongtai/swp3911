<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="com.vnpay.common.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>KẾT QUẢ THANH TOÁN</title>
    <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
    <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">
    <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    <style>
        .form-group {
            margin-bottom: 20px;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #e5e5e5;
        }
        .btn-primary {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header clearfix">
            <h3 class="text-muted">KẾT QUẢ THANH TOÁN</h3>
        </div>
        <div class="table-responsive">
            <div class="form-group">
                <label>Mã giao dịch thanh toán:</label>
                <label><%=request.getParameter("vnp_TxnRef")%></label>
            </div>
            <div class="form-group">
                <label>Số tiền:</label>
                <label id="vnpAmount"><%=request.getParameter("vnp_Amount")%></label>
            </div>
            <div class="form-group">
                <label>Mô tả giao dịch:</label>
                <label><%=request.getParameter("vnp_OrderInfo")%></label>
            </div>
            <div class="form-group">
                <label>Mã lỗi thanh toán:</label>
                <label><%=request.getParameter("vnp_ResponseCode")%></label>
            </div>
            <div class="form-group">
                <label>Mã giao dịch tại CTT VNPAY-QR:</label>
                <label><%=request.getParameter("vnp_TransactionNo")%></label>
            </div>
            <div class="form-group">
                <label>Mã ngân hàng thanh toán:</label>
                <label><%=request.getParameter("vnp_BankCode")%></label>
            </div>
            <div class="form-group">
                <label>Thời gian thanh toán:</label>
                <label><%=request.getParameter("vnp_PayDate")%></label>
            </div>
            <div class="form-group">
                <label>Tình trạng giao dịch:</label>
                <label id="transactionStatus">
                    <%
                        Map fields = new HashMap();
                        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                                fields.put(fieldName, fieldValue);
                            }
                        }

                        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
                        if (fields.containsKey("vnp_SecureHashType")) {
                            fields.remove("vnp_SecureHashType");
                        }
                        if (fields.containsKey("vnp_SecureHash")) {
                            fields.remove("vnp_SecureHash");
                        }
                        String signValue = Config.hashAllFields(fields);

                        String transactionStatus = "invalid signature";
                        if (signValue.equals(vnp_SecureHash)) {
                            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                transactionStatus = "Thành công";
                            } else {
                                transactionStatus = "Không thành công";
                            }
                        }
                        out.print(transactionStatus);
                    %>
                </label>
            </div>
        </div>
        <div class="text-center">
            <a id="backToHome" href="http://localhost:8080/Swp391/checkoutvnpay" class="btn btn-primary">Về trang chủ</a>
        </div>
        <p>
            &nbsp;
        </p>
        <footer class="footer">
            <p>&copy; VNPAY 2020</p>
        </footer>
    </div>
    <script>
        $(document).ready(function() {
            var amountLabel = $('#vnpAmount');
            var amountValue = amountLabel.text();
            if (amountValue.length > 3) {
                var formattedAmount = amountValue.slice(0, -2) + ' vnđ';
                amountLabel.text(formattedAmount);
            }

            $('.btn-primary').click(function(event) {
                event.preventDefault();
                var transactionStatus = $('#transactionStatus').text();
                var backToHomeUrl = $('#backToHome').attr('href') + '?status=' + encodeURIComponent(transactionStatus);
                window.location.href = backToHomeUrl;
            });
        });
    </script>
</body>
</html>
