<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/28
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>发货订单管理</title>
</head>
<body>
<a href="/ershoujy/ym/authc/zhuye">返回主页</a>
<script src="/ershoujy/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    function fh(obj) {
        var ddid=obj.getAttribute("ddid");
        var wlbh=document.getElementById("wldh"+ddid).value;
        if(wlbh.length<2) alert("物流编号不能为空");
        else
        $.ajax({
            url:"/ershoujy/authc/spfh",//服务器地址
            type:"get",//请求方式get/post其他配置都一样
            data:{'ddid':ddid,'wlbh':wlbh},
            traditional: true,
            success:function(data)//执行完成没有异常调用该函数
            {
                alert(data);
                window.location.href="/ershoujy/authc/fspdd";
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                alert("未知错误发货失败");
            }
        });
    }
</script>
    <table>
        <tr>
            <th height="50" width="50">订单号</th>
            <th height="50" width="50"></th>
            <th height="50" width="100">商品名称</th>
            <th height="50" width="100">商品价格</th>
            <th height="50" width="250">下单时间</th>
            <th height="50" width="200">买家收货地址</th>
            <th height="50" width="100">买家联系电话</th>
            <th height="50" width="100">订单状态</th>
            <th height="50" width="100">物流单号</th>
            <th height="50" width="250">发货时间</th>
            <th height="50" width="250">收货时间</th>
            <th height="50" width="50"></th>
        </tr>
        <c:forEach var="dd" items="${dds}">
            <tr>
                <td height="50" width="50">${dd.ddid}</td>
                <td><img src="/ershoujy/img/${dd.spidd.spjpg}" height="50" width="50"></td>
                <td height="50" width="100"><a href="/ershoujy/anon/spxq/${dd.spid}" target="_blank">${dd.spidd.spname}</a></td>
                <td height="50" width="100">${dd.spidd.spjg}</td>
                <th height="50" width="250">${dd.xdsj}</th>
                <td height="50" width="200">${dd.shdzidd.shdz}</td>
                <td height="50" width="100">${dd.shdzidd.phone}</td>
                <th height="50" width="100">${dd.ddzt}</th>
                <c:if test="${dd.wlbh=='0'}">
                    <td><input height="50" width="100" type="text" value="${dd.wlbh}" id="wldh${dd.ddid}"></td>
                    <td height="50" width="250">${dd.fhtime}</td>
                    <td height="50" width="250">${dd.shtime}</td>
                    <td height="50" width="50"><input type="button" value="发货" ddid="${dd.ddid}" onclick="fh(this)"></td>
                </c:if>
                <c:if test="${dd.wlbh!='0'}">
                    <td height="50" width="100">${dd.wlbh}</td>
                    <td height="50" width="250">${dd.fhtime}</td>
                    <td height="50" width="250">${dd.shtime}</td>
                </c:if>
                <td>${dd.shtime}</td>
            </tr>
        </c:forEach>
    </table>

    <c:forEach begin="1" end="${ymax}" varStatus="i">
        <c:choose>
            <c:when test='${i.index==1}'><a href="/ershoujy/authc/fspdd?yema=1">首页</a></c:when>
            <c:when test='${i.index<yema-5}'></c:when>
            <c:when test='${i.index==yema}'>${yema}</c:when>
            <c:when test='${i.index>yema+5}'></c:when>
            <c:when test='${i.index==ymax}'><a href="/ershoujy/authc/fspdd?yema=${ymax}">尾页</a></c:when>
            <c:otherwise><a href="/ershoujy/authc/fspdd?yema=${i.index}">${i.index}</a></c:otherwise>
        </c:choose>
    </c:forEach>
</body>
</html>
