function init()
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
			document.getElementById("d1").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET",uri+"source/init-data.jsp",true);
	xmlhttp.send();
}
function jump()
{
	window.location.href="login.jsp";
}