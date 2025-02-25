<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <title>capcha</title>
    </head>
    <style>
        .g-recaptcha{
            margin-top: 80px;
        }
    </style>
    <body>
    <center>
        <form id="registerForm" action="forgetpass">
            <div class="g-recaptcha" data-sitekey="6Lfae_ApAAAAABVE0ZCqONDtHu50og-pqwCTG6yI" data-callback="onRecaptchaSuccess"></div>
            <!-- You can remove the submit button if you want the form to submit automatically -->
            <!-- <input type="submit" value="Register"> -->
        </form>
    </center>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
        function onRecaptchaSuccess() {
            setTimeout(function () {
                document.getElementById('registerForm').submit();
            }, 800); // 2000 milliseconds = 2 seconds
        }
    </script>
</body>
</html>
