<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>purple init</title>
<link rel="stylesheet" type="text/css" href="../purple/css/init.css">
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
</script>
<script src="../purple/js/init.js"></script>
</head>
<body>
<div id="d0">
<img src="../purple/images/2.jpg" />
</div>
<div id="d1">
</div>
<div id="d2">
<button type="button" onclick="init()" id="b0">开始</button>
</div>
<div id="d3">
<button type="button" onclick="jump()" id="b1">跳转</button>
</div>
</body>
</html>