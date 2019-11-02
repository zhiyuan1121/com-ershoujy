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
    <title>购物车</title>
</head>
<body>
${ts}<br>
<a href="/ershoujy/ym/authc/zhuye">返回主页</a>
<script src="/ershoujy/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    // function jiezhang(){
    //     var zj = document.getElementById('zonjia').innerHTML;
    //     var id = document.getElementsByName("spids");
    //     var spids = new Array();
    //     for(var i = 0; i < id.length; i++){
    //         if(id[i].checked) {
    //             spids.push(id[i].value);
    //         }
    //     }
        // var temp_form =  document.createElement("form");
        // temp_form.action = "/ershoujy/authc/gwcjz";
        // temp_form.method = "post";
        // temp_form.append('zt',zj);
        // temp_form.append('spids',spids);
        // temp_form.submit();
    //     $.ajax({
    //         url:"/ershoujy/authc/gwcjz",//服务器地址
    //         type:"post",//请求方式get/post其他配置都一样
    //         data:{'spids':spids,'zj':zj},
    //         traditional:true,
    //         dataType:'html',
    //         success:function(response) {
    //             success.info(response);
    //         },
    //         error:function (xhr, ajaxOptions, thrownError) {
    //             alert("结账异常")
    //         }
    //     });
    // }
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
</body>
</html>
