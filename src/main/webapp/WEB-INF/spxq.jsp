<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/27
  Time: 10:41
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
    <script src="/ershoujy/js/html5shiv.min.js"></script>
    <script src="/ershoujy/js/respond.min.js"></script><![endif]-->
    <title>商品详情</title>
</head>
<body>
<script src="/ershoujy/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    function jrgwc(obj){
        var spid=obj.getAttribute("id");//获取数据
        $.ajax({
            url:"/ershoujy/authc/jrgwc/"+spid,//服务器地址
            type:"get",//请求方式get/post其他配置都一样
            success:function(data)//执行完成没有异常调用该函数
            {
                if (data=="商品已添加"||data=='添加成功'){
                    alert(data);

                }else{
                    //alert(data);
                    window.location.href="/ershoujy/ym/anon/login";
                }

            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                alert("未知错误加入失败");
            }
        });
    }
</script>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <td><img src="/ershoujy/img/${sp.spjpg}" height="300" width="300"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="50" width="200">${sp.spname}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td height="50" width="100">价格:${sp.spjg}￥</td>--%>
<%--        </tr><tr>--%>
<%--            <td height="50" width="100">发布用户:${sp.fbuidd.uname}</td>--%>
<%--        </tr><tr>--%>
<%--            <td height="50" width="100">发布时间:${sp.scsj}</td>--%>
<%--        </tr><tr>--%>
<%--            <td height="50" width="60">详情:${sp.spxq}</td>--%>
<%--        </tr><tr>--%>
<%--            <td height="50" width="60">状态:${sp.spzt}</td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--    <input type="button" value="加入购物车" onclick="jrgwc(this)" id="${sp.spid}"><br>--%>
<%--    <c:if test="${sp.spzt=='上架'}">--%>
<%--        <a href="/ershoujy/authc/gmsp/${sp.spid}">购买</a>--%>
<%--    </c:if>--%>
<div class="page">
    <!-- Main Navbar-->
    <header class="header">
        <nav class="navbar">
            <!-- Search Box-->
            <div class="search-box">
                <button class="dismiss"><i class="icon-close"></i></button>
                <form id="searchForm" action="#" role="search">
                    <input type="search" placeholder="What are you looking for..." class="form-control">
                </form>
            </div>
            <div class="container-fluid">
                <div class="navbar-holder d-flex align-items-center justify-content-between">
                    <!-- Navbar Header-->
                    <div class="navbar-header">
                        <!-- Navbar Brand --><a href="index.html" class="navbar-brand d-none d-sm-inline-block">
                        <div class="brand-text d-none d-lg-inline-block"><span>Bootstrap </span><strong>Dashboard</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                        <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                    </div>
                    <!-- Navbar Menu -->
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                        <!-- Logout    -->
                        <li class="nav-item"><a href="/ershoujy/authc/zhuxiao" class="nav-link logout"> <span class="d-none d-sm-inline">注销</span><i class="fa fa-sign-out"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <nav class="side-navbar">
            <!-- Sidebar Header-->
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><img src="/ershoujy/img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                <div class="title">
                    <h1 class="h4">${sessionScope.uname}</h1>
                    <p>${sessionScope.userid}</p>
                </div>
            </div>
            <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
            <ul class="list-unstyled">
                <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>商家功能 </a>
                    <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                        <li><a href="/ershoujy/ym/authc/spadd">上架商品</a></li>
                        <li><a href="/ershoujy/authc/fspdd">查看订单</a></li>
                        <li><a href="/ershoujy/authc/wdwp">查看商品</a></li>
                    </ul>
                </li>
                <li><a href="#exampledropdownDropdow" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>买家功能 </a>
                    <ul id="exampledropdownDropdow" class="collapse list-unstyled ">
                        <li><a href="/ershoujy/anon/llsp">浏览商品</a></li>
                        <li><a href="/ershoujy/authc/gwc">查看购物车</a></li>
                        <li><a href="/ershoujy/authc/shdzck">收货地址管理</a></li>
                        <li><a href="/ershoujy/authc/sspdd">查看订单</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="content-inner">
                <table>
                    <tr>
                        <td><img src="/ershoujy/img/${sp.spjpg}" height="300" width="300"></td>
                    </tr>
                    <tr>
                        <td height="50" width="200">${sp.spname}</td>
                    </tr>
                    <tr>
                        <td height="50" width="100">价格:${sp.spjg}￥</td>
                    </tr><tr>
                        <td height="50" width="100">发布用户:${sp.fbuidd.uname}</td>
                    </tr><tr>
                        <td height="50" width="100">发布时间:${sp.scsj}</td>
                    </tr><tr>
                        <td height="50" width="60">详情:${sp.spxq}</td>
                    </tr><tr>
                        <td height="50" width="60">状态:${sp.spzt}</td>
                    </tr>
                </table>
                <input type="button" value="加入购物车" onclick="jrgwc(this)" id="${sp.spid}"><br>
                <c:if test="${sp.spzt=='上架'}">
                    <a href="/ershoujy/authc/gmsp/${sp.spid}">购买</a>
                </c:if>
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
<script src="/ershoujy/js/charts-custom.js"></script>
<!-- Main File-->
<script src="/ershoujy/js/front.js"></script>
</body>
</html>
