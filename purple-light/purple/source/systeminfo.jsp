<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String password = request.getParameter("password");
	String url = request.getParameter("url");
	String flag1 = request.getParameter("flag");
	int flag = Integer.valueOf(flag1);
	String path = application.getRealPath(request.getRequestURI());
	path = path.replace("source\\systeminfo.jsp","");
	String shell = path;
	shell = shell + "shell\\";
	path = path + "store\\";
	String store_path = path;
	String filename_url = url.replace("http","").replace(":","").replace("php","").replace(".","").replace("/","");
	String filename = filename_url + "systeminfo-php.txt";
	String store_filename = store_path + filename;
	String[] sin = new String[11];
	String[] si = new String[11];
	sin[0] = "系统类型及版本号";
	sin[1] = "PHP运行方式";
	sin[2] = "用户名";
	sin[3] = "PHP版本";
	sin[4] = "PHP安装路径";
	sin[5] = "当前文件绝对路径";
	sin[6] = "服务器IP";
	sin[7] = "服务器解译引擎";
	sin[8] = "系统目录";
	sin[9] = "通信协议";
	sin[10] = "WEB服务根目录";
	File f = new File(store_filename);
	if(flag == 1)
	{
		if(!f.exists())
		{
			String cmd ="cmd.exe /c start " + shell + "systeminfo-php.exe " + url + " " + password + " " + store_filename;
			try
			{
				Process rt = Runtime.getRuntime().exec(cmd);
			}
			catch(IOException e)
			{
				out.print("123");
			}
			Thread.sleep(1000);
		}
	}
	if(flag == 0)
	{
		String cmd ="cmd.exe /c start " + shell + "systeminfo-php.exe " + url + " " + password + " " + store_filename;
		try
		{
			Process rt = Runtime.getRuntime().exec(cmd);
		}
		catch(IOException e)
		{
			out.print("123");
		}
		Thread.sleep(1000);
	}
	response.setContentType("text/html;charset=UTF-8");
    InputStreamReader isr = new InputStreamReader(new FileInputStream(store_filename), "GBK");
    BufferedReader br = new BufferedReader(isr);
    String s;
    while ((s = br.readLine()) != null) 
	{
        si = s.split(",");
    }
    br.close();
    isr.close();
	String x = "<table border=\"1\" class=\"settable\">";
	String x1 = "";
	for(int i = 0; i < sin.length; i++)
	{
		x1 = x1 + "<tr onmouseover=\"changebgc(this)\" onmouseout=\"backbgc(this)\"><td>" + sin[i] + "</td><td>" + si[i] + "</td></tr>";
	}
	String tb = x + x1 + "</table>";
	out.println(tb);
%>