<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css" href="../purple/css/login.css">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="../purple/js/md5.js"></script>
<script>
	function md5()
	{
		var pw = document.getElementById("password");
		pw.value = hex_md5(pw.value).toUpperCase();
		console.log(pw.value);
	}
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
</script>
</head>
<body>
<div id="d1">
<img id="i0" src="../purple/images/6.jpg" />
</div>
<div id="d0">
<p id="p0"><i><em>Purple Light</em></i></p>
<form id="f0" action="../purple/source/checkpassword.jsp" method="post">
<fieldset id="f1">
<legend>登录 <a href=""><img src="../purple/images/dot.gif"/></a></legend>
密码: <input onchange="md5()" id="password" name="password" type="password"/>
</fieldset>
<fieldset id="f2">
<button id="b0" onclick="">执行</button>
<a id="a0" href="#">修改密码</a>
</fieldset>
</form>
</div>
<div id="d2">
<img id="i0" src="../purple/images/8.jpg" />
</div>
</body>
</html>