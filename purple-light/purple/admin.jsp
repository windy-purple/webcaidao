<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Personal Center</title>
<link rel="stylesheet" type="text/css" href="../purple/css/admin.css">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://malsup.github.io/jquery.form.js" type="text/javascript"></script>
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
<script src="../purple/js/admin.js"></script>
</head>
<body onload="display()">
<div id="d0">
<img onclick="add()" id="i0" src="../purple/images/1.jpg" />
</div>
<div id="d1">
</div>
<div id="d3">
</div>
<div id="d4">
</div>
<hr id="h0"/>
<div id="d2">
</div>
<form id="from" method="post" action="purple-light.jsp">
<input id="ip" name="ip" type="hidden"/>
<input id="pw" name="pw" type="hidden"/>
</form>
</body>
</html>