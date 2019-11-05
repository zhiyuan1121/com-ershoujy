<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/24
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="/ershoujy/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="/ershoujy/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="/ershoujy/css/fontastic.css">
    <!-- Google fonts - Poppins -->
<%--    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">--%>
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="/ershoujy/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="/ershoujy/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/ershoujy/img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <title>登录</title>
</head>
<body>
    <div class="page login-page">
        <div class="container d-flex align-items-center">
            <div class="form-holder has-shadow">
                <div class="row">
                    <!-- Logo & Information Panel-->
                    <div class="col-lg-6">
                        <div class="info d-flex align-items-center">
                            <div class="content">
                                <div class="logo">
                                    <h1>自由交易系统</h1>
                                </div>
                                <p>人人平等的交易平台</p>
                            </div>
                        </div>
                    </div>
                    <!-- Form Panel    -->
                    <div class="col-lg-6 bg-white">
                        <div class="form d-flex align-items-center">
                            <div class="content">
                                <form action="/ershoujy/anon/login" method="post" class="form-validate">
                                    <div class="form-group">
                                        <input id="login-username" type="text" name="loginUsername" required data-msg="Please enter your username" class="input-material" value="${zcts}">
                                        <label for="login-username" class="label-material">账号</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="login-password" type="password" name="loginPassword" required data-msg="Please enter your password" class="input-material">
                                        <label for="login-password" class="label-material">密码</label>
                                    </div><input type="submit" class="btn btn-primary" value="登录">
                                    <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                                </form><a href="/ershoujy/ym/anon/zhuche" class="forgot-pass">注册</a><br>
                                <small>
                                    ${ts}
                                    <c:if test="${zcts!=null}">
                                        注册成功您的账号是${zcts}
                                    </c:if>
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- JavaScript files-->
    <script src="/ershoujy/vendor/jquery/jquery.min.js"></script>
    <script src="/ershoujy/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="/ershoujy/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/ershoujy/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="/ershoujy/vendor/chart.js/Chart.min.js"></script>
    <script src="/ershoujy/vendor/jquery-validation/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="/ershoujy/js/front.js"></script>
</body>
</html>
