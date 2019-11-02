<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/27
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品</title>
</head>
<body>
<a href="/ershoujy/ym/authc/zhuye">返回主页</a>
<form action="/ershoujy/anon/llsp">
    <input type="text" name="gjz" value="${gjz}">
    <input type="submit" value="搜索">
</form>
<table>
    <tr>
        <th height="50" width="50"></th>
        <th height="50" width="200">名称</th>
        <th height="50" width="100">价格</th>
        <th height="50" width="100">上架时间</th>
    </tr>
    <c:forEach var="sp" items="${spbs}">
        <tr>
            <td><img src="/ershoujy/img/${sp.spjpg}" height="50" width="50"></td>
            <td height="50" width="200"><a href="/ershoujy/anon/spxq/${sp.spid}" target="_blank">${sp.spname}</a></td>
            <td height="50" width="100">${sp.spjg}</td>
            <td height="50" width="100">${sp.scsj}</td>
        </tr>
    </c:forEach>
</table>
<c:forEach begin="1" end="${ymax}" varStatus="i">
    <c:choose>
        <c:when test='${i.index==1}'><a href="/ershoujy/anon/llsp?yema=1&gjz=${gjz}">首页</a></c:when>
        <c:when test='${i.index<yema-5}'></c:when>
        <c:when test='${i.index==yema}'>${yema}</c:when>
        <c:when test='${i.index>yema+5}'></c:when>
        <c:when test='${i.index==ymax}'><a href="/ershoujy/anon/llsp?yema=${ymax}&gjz=${gjz}">尾页</a></c:when>
        <c:otherwise><a href="/ershoujy/anon/llsp?yema=${i.index}&gjz=${gjz}">${i.index}</a></c:otherwise>
    </c:choose>
</c:forEach>
</body>
</html>
