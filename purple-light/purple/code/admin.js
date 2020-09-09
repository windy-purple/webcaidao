	function add()
	{
		document.getElementById("d1").innerHTML="<span id=\"s0\">路径: </span><input id=\"uri\" type=\"text\"/><span id=\"s1\">密码: </span><input id=\"password\" type=\"text\"/><button onclick=\"update()\" id=\"b0\" type=\"button\">添加</button>";
	}
	function display()
	{
		var uri = get_uri();
		var xmlhttp;
		if(window.XMLHttpRequest)
		{
			xmlhttp = new XMLHttpRequest();
		}
		else
		{
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				document.getElementById("d2").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET",uri+"source/data-select.jsp",true);
		xmlhttp.send();
	}
	function update()
	{
		var uri =  get_uri();
		var path = document.getElementById("uri").value;
		var password = document.getElementById("password").value;
		var xmlhttp;
		if(window.XMLHttpRequest)
		{
			xmlhttp = new XMLHttpRequest();
		}
		else
		{
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				document.getElementById("d2").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("POST",uri+"source/data-update.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("path="+path+"&password="+password);
		display();
	}
	function jump(obj)
	{
		var str = obj.id;
		var attr = str.split("@");
		var url = attr[0];
		var password = attr[1]
		var form = document.getElementById("from");
		var ip = document.getElementById("ip");
		var pw = document.getElementById("pw");
		ip.value = url;
		pw.value = password;
		form.submit();
	}