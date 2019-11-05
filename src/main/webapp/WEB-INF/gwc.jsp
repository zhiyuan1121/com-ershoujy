<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/27
  Time: 15:53
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
    <title>购物车</title>
</head>
<body>
<%--${ts}<br>--%>
<%--<a href="/ershoujy/ym/authc/zhuye">返回主页</a>--%>
<script src="/ershoujy/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    function delbyid(obj) {
        var spids = new Array();
        spids.push(obj.getAttribute("spid"));
        $.ajax({
            url:"/ershoujy/authc/gwcsc",//服务器地址
            type:"get",//请求方式get/post其他配置都一样
            data:{'spids':spids},
            traditional: true,
            success:function(data)//执行完成没有异常调用该函数
            {
                if(data=="请先登入"){
                    alert(data);
                    window.location.href="/ershoujy/ym/anon/login";
                }
                else {
                    alert("删除成功");
                    window.location.href="/ershoujy/authc/gwc?yema=${yema}"
                }
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                alert("未知错误删除失败");
            }
        });
    }
    function del(){
        var id = document.getElementsByName("spids");
        var spids = new Array();
        for(var i = 0; i < id.length; i++){
            if(id[i].checked) {
                spids.push(id[i].value);
            }
        }
        $.ajax({
            url:"/ershoujy/authc/gwcsc",//服务器地址
            type:"get",//请求方式get/post其他配置都一样
            data:{'spids':spids},
            traditional: true,
            success:function(data)//执行完成没有异常调用该函数
            {
                if(data=="请先登入"){
                    alert(data);
                    window.location.href="/ershoujy/ym/anon/login";
                }
                else {
                    alert("删除成功");
                    window.location.href="/ershoujy/authc/gwc?yema=${yema}"
                }
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                alert("未知错误删除失败");
            }
        });
    }
    function zonjia(obj){
        var zj = document.getElementById('zonjia');
        var zj1 = document.getElementById('zj');
        var jg= parseFloat(obj.getAttribute("jg"));
        if(!obj.checked)
            jg=-1*jg;
        zj.innerHTML=parseFloat(zj.innerHTML)+jg;
        zj1.value=parseFloat(zj.innerHTML);
    }
</script>

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
                        <th height="50" width="50"></th>
                        <th height="50" width="50"></th>
                        <th height="50" width="200">名称</th>
                        <th height="50" width="100">价格</th>
                        <th height="50" width="100">商品状态</th>
                        <th height="50" width="100">加入时间</th>
                        <th height="50" width="100"></th>
                    </tr>
                    <form method="post" action="/ershoujy/authc/gwcjz">
                    <c:forEach var="gwc" items="${gwcs}">
                        <tr>
                            <td>
                                <c:if test="${gwc.spidd.spzt=='上架'}">
                                    <input type="checkbox" name="spids" value="${gwc.spid}" jg="${gwc.spidd.spjg}" onclick="zonjia(this)">
                                </c:if>
                            </td>
                            <td><img src="/ershoujy/img/${gwc.spidd.spjpg}" height="50" width="50"></td>
                            <td height="50" width="200"><a href="/ershoujy/anon/spxq/${gwc.spid}" target="_blank">${gwc.spidd.spname}</a></td>
                            <td height="50" width="100">${gwc.spidd.spjg}</td>
                            <td height="50" width="100">${gwc.spidd.spzt}</td>
                            <td height="50" width="100">${gwc.addtime}</td>
                            <td height="50" width="100"><input type="button" onclick="delbyid(this)" value="删除" spid="${gwc.spid}"></td>
                        </tr>
                    </c:forEach>
                </table>
                <p>总价:<input type="hidden" value="0" id="zj" name="zj"><span id="zonjia">0</span></p>
                <input type="submit" value="结算">
            <%--<input type="button" value="结算" id="jieshuan" onclick="jiezhang()">--%>
                <input type="button" value="删除" id="del" onclick="del()"><br>
            </form>
            <c:forEach begin="1" end="${ymax}" varStatus="i">
                <c:choose>
                    <c:when test='${i.index==1}'><a href="/ershoujy/authc/gwc?yema=1">首页</a></c:when>
                    <c:when test='${i.index<yema-5}'></c:when>
                    <c:when test='${i.index==yema}'>${yema}</c:when>
                    <c:when test='${i.index>yema+5}'></c:when>
                    <c:when test='${i.index==ymax}'><a href="/ershoujy/authc/gwc?yema=${ymax}">尾页</a></c:when>
                    <c:otherwise><a href="/ershoujy/authc/gwc?yema=${i.index}">${i.index}</a></c:otherwise>
                </c:choose>
            </c:forEach>
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
