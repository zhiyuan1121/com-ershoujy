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
    <title>注册</title>
</head>
<body topmargin="100" leftmargin="150">
${zcts}
<form action="/ershoujy/anon/zhuche" method="post" name="fileForm">
    输入户名：<input type="text" name="name" id="name"/><span id="nametishi"></span></p>
    <P>输入密码：<input type="password" name="paw" id="pw1"/></P>
    <p>确认密码：<input type="password" id="pw2"/><span id="tishi"></span></p>
    <p><input type="button" value="注册" onclick="pw()" id="submitBtn"/>
        <input type="reset" value="重置"/></p>
</form>
<script>
    function pw() {
        var name=document.getElementById("name").value;
        var pw1 = document.getElementById("pw1").value;
        var pw2 = document.getElementById("pw2").value;
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
