<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.xianshi" %>
<html>
<head>
<%
	String ip = request.getParameter("ip");
	String pw = request.getParameter("pw");
	session.setAttribute("ip",ip);
	session.setAttribute("pw",pw);
%>
<script>
    function get_uri()
    {
        var domain = window.location.href;
		var attr = domain.split("/");
		url = attr[0] + "//";
		for(var i=2;i<attr.length-1;i++)
		{
			url = url + attr[i] + "/";
		}
        return url;
    }
	function submitForm()
	{
		$("#from1").ajaxSubmit(function(message) {
			document.getElementById("upload_flag").innerHTML=message+"成功上传至服务器";
			message_up = message;
			var iu = document.getElementById("upload");
			iu.value = iu.value + message_up;
		});
		return false;
	}
</script>
<script>
	var ip = "${ip}";
	var password = "${pw}";
	var message_up = "";
	var uri = get_uri()
</script>
<title>purple-light</title>
<link rel="stylesheet" type="text/css" href="../purple/css/purple.css">
</head>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://malsup.github.io/jquery.form.js" type="text/javascript"></script>
<script src="../purple/js/purple.js"></script>
<body onload="init()">
<div>
<div id="setwidth_1"></div>
</div>
<div style="margin-left: 2px class="setwidth">
<div class="setwidth" onclick="systeminfo()">主机配置</div>
<div class="setwidth" onclick="syspan()">文件管理</div>
<div class="setwidth" onclick="BrowseFolder()">文件上传</div>
<div class="setwidth" onclick="getcmd()">命令终端</div>
<div class="setwidth"onclick="sql()">数据库</div>
</div>
<div id="content">
</div>
</body>
</html> 