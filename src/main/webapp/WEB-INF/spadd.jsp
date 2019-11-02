<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/26
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品上传</title>
</head>
<body>
${cwts}
    <form action="/ershoujy/authc/spadd" method="post" enctype="multipart/form-data" name="fileForm">
        商品标题:<input type="text" name="spname" id="bt"><span id="btts"></span></p><br>
        商品价格:<input type="text" name="spjg" id="jg"><span id="jgts"></span></p><br>
        商品图片:<input type="file" name="img" id="wj" accept="image/*"><span id="wjts"></span></p><br>
        商品详情:<textarea name="spxq" id="xq" style="width:200px; height:70px;"></textarea><span id="xqts"></span></p><br>
        <input type="button" value="上传" onclick="pw()" id="submitBtn">
    </form>
    <a href="/ershoujy/ym/authc/zhuye">返回主页</a>
</body>
<script>
    function pw() {
        var bt=document.getElementById("bt").value;
        var jg = document.getElementById("jg").value;
        var xq = document.getElementById("xq").value;
        var wj = document.getElementById("wj").value;
        document.getElementById("btts").innerHTML="<font color='red'></font>";
        document.getElementById("jgts").innerHTML="<font color='red'></font>";
        document.getElementById("xqts").innerHTML="<font color='red'></font>";
        document.getElementById("wjts").innerHTML="<font color='red'></font>";
        if(xq.length!=0&&jg.length!=0&&bt.length!=0&&wj.length!=0) {
            document.fileForm.submit();
        }
        else {
            if(bt.length==0)
                document.getElementById("btts").innerHTML="<font color='red'>标题不能为空</font>";
            if(jg.length==0)
                document.getElementById("jgts").innerHTML="<font color='red'>价格不能为空</font>";
            if(xq.length==0)
                document.getElementById("xqts").innerHTML="<font color='red'>详情不能为空</font>";
            if(wj.length==0)
                document.getElementById("wjts").innerHTML="<font color='red'>未选择图片</font>";
        }
    }
</script>
</html>
