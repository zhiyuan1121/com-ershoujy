<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/27
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>收获地址管理</title>
</head>
<body>
<a href="/ershoujy/ym/authc/zhuye">返回主页</a>
<br>${ts}
<script src="/ershoujy/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    function tianjia(){
        //var spid=obj.getAttribute("id");//获取数据
        var shdz=$('#form1').serializeArray()[0].value;
        var phone=$('#form1').serializeArray()[1].value;
        if(shdz.length==0||phone.length==0){
            alert("收货地址，电话不能为空");
        }
        else {
        $.ajax({
            url:"/ershoujy/authc/shdzadd",//服务器地址
            type:"post",//请求方式get/post其他配置都一样
            data: $('#form1').serialize(),
            success:function(data)//执行完成没有异常调用该函数
            {
                if (data=="添加成功"){
                    alert(data);
                    window.location.href="/ershoujy/authc/shdzck";
                }else {
                    alert(data);
                }

            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                alert("未知错误添加失败");
            }
        });
        }
    }
    function xiugai(obj) {
        var shid=obj.getAttribute("shid");
        var shdz=document.getElementById(shid+"dz").value;
        var phone=document.getElementById(shid+"phone").value;
        if(shdz.length==0||phone.length==0){
            alert("收货地址，电话不能为空");
        }
        else {
            $.ajax({
                url:"/ershoujy/authc/shdzupd",//服务器地址
                type:"post",//请求方式get/post其他配置都一样
                data:{"shdzid":shid,"shdz":shdz,"phone":phone},
                success:function(data)//执行完成没有异常调用该函数
                {
                    if (data=="修改成功"){
                        alert(data);
                        window.location.href="/ershoujy/authc/shdzck";
                    }else {
                        alert(data);
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                    alert("未知错误修改失败");
                }
            });
        }
    }
    function del(obj) {
        var shid=obj.getAttribute("shid");
        $.ajax({
            url:"/ershoujy/authc/shdzdel",//服务器地址
            type:"post",//请求方式get/post其他配置都一样
            data:{"shdzid":shid},
            success:function(data)//执行完成没有异常调用该函数
            {
                if (data=="删除成功"){
                    alert(data);
                    window.location.href="/ershoujy/authc/shdzck";
                }else {
                    alert(data);
                }
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){//发送异常调用该方法
                alert("未知错误删除失败");
            }
        });
    }
</script>
    <form action="/ershoujy/authc/shdzadd" method="post" id="form1">
        收货地址:<input type="text" name="shdz"><br>
        联系电话:<input type="text" name="phone"><br>
        <input type="button" value="添加" onclick="tianjia()">
    </form>
    <table>
        <tr>
            <th height="50" width="200">地址</th>
            <th height="50" width="100">电话</th>
            <th height="50" width="80"></th>
            <th height="50" width="80"></th>
        </tr>
        <c:forEach var="shdz" items="${shdzs}">
            <tr>
                <td><input type="text" value="${shdz.shdz}" id="${shdz.shid}dz" height="50" width="200"></td>
                <td><input type="text" value="${shdz.phone}" id="${shdz.shid}phone" height="50" width="100"></td>
                <td><input type="button" value="修改" shid="${shdz.shid}" height="50" width="80" onclick="xiugai(this)"></td>
                <td><input type="button" value="删除" shid="${shdz.shid}" height="50" width="80" onclick="del(this)"></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
