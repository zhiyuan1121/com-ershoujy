<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/26
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script src="/ershoujy/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    function sj(obj){
        var spid=obj.getAttribute("id");//获取数据
        $.ajax({
            url:"/ershoujy/authc/spsj/"+spid,//服务器地址
            type:"get",//请求方式get/post其他配置都一样
            success:function(data)//执行完成没有异常调用该函数
            {
                document.getElementById("zt"+spid).innerHTML="上架";
                obj.value="下架";
                obj.onclick=function() {
                    xj(obj);
                }
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
            alert("未知错误上架失败");
        }
    });
    }
    function xj(obj){
        var spid=obj.getAttribute("id");//获取数据
        $.ajax({
            url:"/ershoujy/authc/spxj/"+spid,//服务器地址
            type:"get",//请求方式get/post其他配置都一样
            success:function(data)//执行完成没有异常调用该函数
            {
                document.getElementById("zt"+spid).innerHTML="下架";
                obj.value="上架";
                obj.onclick= function() {
                    sj(obj);
                }
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                alert("未知错误下架失败");
            }
        });
    }
</script>
<head>
    <title>我上架的物品</title>
</head>
<body>
<a href="/ershoujy/ym/authc/zhuye">返回主页</a><br>
    <table>
        <tr>
            <th height="50" width="50"></th>
            <th height="50" width="200">名称</th>
            <th height="50" width="100">价格</th>
            <th height="50" width="100">上架时间</th>
            <th height="50" width="60">状态</th>
            <th height="50" width="60"></th>
        </tr>
        <c:forEach var="sp" items="${spbs}">
            <tr>
                <td><img src="/ershoujy/img/${sp.spjpg}" height="50" width="50"></td>
                <td height="50" width="200"><a href="/ershoujy/anon/spxq/${sp.spid}" target="_blank">${sp.spname}</a></td>
                <td height="50" width="100">${sp.spjg}</td>
                <td height="50" width="100">${sp.scsj}</td>
                <td height="50" width="60"><span id="zt${sp.spid}">${sp.spzt}</span></td>
                <td height="50" width="60">
                    <c:choose>
                        <c:when test='${sp.spzt=="上架"}'><%--<a href="/ershoujy/spxj/${sp.spid}">下架</a>--%><input type="button" value="下架" onclick="xj(this)" id="${sp.spid}"></c:when>
                        <c:when test='${sp.spzt=="下架"}'><%--<a href="/ershoujy/spsj/${sp.spid}">上架</a>--%><input type="button" value="上架" onclick="sj(this)" id="${sp.spid}"></c:when>
<%--                        <c:when test='${requestScope["m"]eq "sex"}'>sex</c:when>--%>
                        <c:otherwise><a href="/ershoujy/authc/fspdd">查看订单</a></c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
    <c:forEach begin="1" end="${ymax}" varStatus="i">
        <c:choose>
            <c:when test='${i.index==1}'><a href="/ershoujy/authc/wdwp?yema=1">首页</a></c:when>
            <c:when test='${i.index<yema-5}'></c:when>
            <c:when test='${i.index==yema}'>${yema}</c:when>
            <c:when test='${i.index>yema+5}'></c:when>
            <c:when test='${i.index==ymax}'><a href="/ershou/authc/wdwp?yema=${ymax}">尾页</a></c:when>
            <c:otherwise><a href="/ershou/authc/wdwp?yema=${i.index}">${i.index}</a></c:otherwise>
        </c:choose>
    </c:forEach>
</body>
</html>
