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
    <title>登录</title>
</head>
<body>
    <c:if test="${zcts!=null}">
        注册成功您的账号是${zcts}
    </c:if>
    <form action="/ershoujy/anon/login" method="post">
        账号:<input type="text" name="uid"><br>
        密码:<input type="password" name="paw"><br>
        <input type="submit" value="登入">
    </form>
    ${ts}<br>
    <a href="/ershoujy/ym/anon/zhuche">注册账号</a>

</body>
</html>
