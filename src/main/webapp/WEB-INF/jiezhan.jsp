<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/28
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>结账</title>
</head>
<body>
<a href="/ershoujy/ym/authc/zhuye">返回主页</a>
<script src="/ershoujy/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    function jz(){
        var id = document.getElementsByName("spids");
        var spids = new Array();
        for(var i = 0; i < id.length; i++){
                spids.push(id[i].value);
        }
        var shdzid=document.getElementById('shdz').value;
        $.ajax({
            url:"/ershoujy/authc/spjs",//服务器地址
            type:"post",//请求方式get/post其他配置都一样
            data:{'spids':spids,'shdzid':shdzid},
            traditional: true,
            success:function(data)//执行完成没有异常调用该函数
            {
                alert(data);
                if(data=="下单成功"){
                    window.location.href="/ershoujy/authc/sspdd";
                }

            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                alert("未知错误下单失败");
            }
        });
    }
</script>
    <table>
        <tr>
            <th height="50" width="50"></th>
            <th height="50" width="200">名称</th>
            <th height="50" width="100">价格</th>
        </tr>
        <c:forEach var="sp" items="${sps}">
            <tr>
                <td><input type="hidden" value="${sp.spid}" name="spids"></td>
                <td><img src="/ershoujy/img/${sp.spjpg}" height="50" width="50"></td>
                <td height="50" width="200">${sp.spname}</td>
                <td height="50" width="100">${sp.spjg}</td>
            </tr>
        </c:forEach>
    </table>
    总价:${zj}<br>
    选择收货地址:
    <select  id="shdz">
        <c:forEach var="sh" items="${shdzs}">
            <option value ="${sh.shid}">${sh.shdz}${sh.phone}</option>
        </c:forEach>
    </select><br>
    <input type="button" value="结账" onclick="jz()">
</body>
</html>
