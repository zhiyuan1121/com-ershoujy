<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/26
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
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
    <script src="/ershoujy/js/html5shiv.min.js"></script>
    <script src="/ershoujy/js/respond.min.js"></script><![endif]-->
    <title>注册</title>
</head>
<body topmargin="100" leftmargin="150">
${zcts}
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
                            <form action="/ershoujy/anon/zhuche" method="post" name="fileForm" class="form-validate">
                                <div class="form-group">
                                    <input id="register-username" type="text" name="name" required data-msg="用户名不能为空" class="input-material">
                                    <label for="register-username" class="label-material">用户名<span id="nametishi"></span></label>
                                </div>
                                <div class="form-group">
                                    <input id="register-email" type="password" name="paw" required data-msg="密码不能为空" class="input-material">
                                    <label for="register-email" class="label-material">密码</label>
                                </div>
                                <div class="form-group">
                                    <input id="register-password" type="password" name="registerPassword" required data-msg="密码不能为空" class="input-material">
                                    <label for="register-password" class="label-material">确认密码<span id="tishi"></span></label>
                                </div>
                                <div class="form-group">
                                    <input type="button" value="注册" onclick="pw()" id="regidter" name="registerSubmit" class="btn btn-primary"/>
<%--                                    <button id="regidter" type="submit" name="registerSubmit" class="btn btn-primary">Register</button>--%>
                                </div>
                            </form><small>已有账号？ </small><a href="/ershoujy/ym/anon/login" class="signup">登入</a>
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
<script>
    function pw() {
        var name=document.getElementById("register-username").value;
        var pw1 = document.getElementById("register-email").value;
        var pw2 = document.getElementById("register-password").value;
        document.getElementById("tishi").innerHTML="<font color='red'></font>";
        document.getElementById("nametishi").innerHTML="<font color='red'></font>";
        if(pw1 == pw2&&pw2.length!=0&&name.length!=0) {
            document.fileForm.submit();
        }
        else {
            if(pw2.length==0)
                document.getElementById("tishi").innerHTML="<font color='red'>密码不能为空</font>";
            if(name.length==0)
                document.getElementById("nametishi").innerHTML="<font color='red'>用户名不能为空</font>";
            if(pw1 != pw2)
                document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
        }
    }
</script>
</body>
</html>
