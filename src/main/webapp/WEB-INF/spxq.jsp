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
            // complete : function(xhr, status) {
            //     //拦截器拦截没有权限跳转
            //     // 通过xhr取得响应头
            //     var REDIRECT = xhr.getResponseHeader("REDIRECT");
            //     //如果响应头中包含 REDIRECT 则说明是拦截器返回的
            //     if (REDIRECT == "REDIRECT")
            //     {
            //         document.location.href = xhr.getResponseHeader("CONTEXTPATH");
            //     }
            // }
        });
    }
</script>
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
</body>
</html>
