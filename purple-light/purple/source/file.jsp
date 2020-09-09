<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String action = request.getParameter("action");
	String path_filename = request.getParameter("path");
	String url = request.getParameter("url");
	String password = request.getParameter("password");
	String path = application.getRealPath(request.getRequestURI());
	path = path.replace("source\\file.jsp","");
	String shell = path;
	shell = shell + "shell\\";
	path = path + "dowload\\";
	String store_path = path;
	String store_filename = store_path + "mark.txt";
	if("dowload".equals(action))
	{
		String[] str = path_filename.split("/");
		String filename = store_path + str[str.length-1];
		String cmd = "cmd.exe /c start " + shell + "dowload.exe " + url + " " + password + " " + path_filename + " " + filename;
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
%>
<%
		File f = new File(filename);
		if(f.exists())
		{
			out.print("下载完毕");
		}
		else
		{
			out.print("下载失败");
		}
	}
	if("del".equals(action))
	{
		String cmd = "cmd.exe /c start " + shell + "del.exe " + url + " " + password + " " + path_filename + " " + store_filename;
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
		InputStreamReader isr = new InputStreamReader(new FileInputStream(store_filename),"UTF-8");
		BufferedReader br = new BufferedReader(isr);
		String s;
		while ((s = br.readLine()) != null)
		{
			if("1".equals(s))
			{
				out.print("删除成功");
			}
			else
			{
				out.print("删除失败");
			}
		}
	}
%>