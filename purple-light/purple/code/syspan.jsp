<%@ page import="java.io.*" %>
<%@ page import="java.lang.String.*" %>

<%
	String path = application.getRealPath(request.getRequestURI());
	path = path.replace("source\\syspan.jsp","");
	String shell = path;
	shell = shell + "shell\\";
	path = path + "store\\";
	String store_path = path;
	String flag = request.getParameter("flag");
	String url = request.getParameter("url");
	String password = request.getParameter("password");
	String filename_url = "";
	if((url.contains(":")))
	{
		filename_url = url.replace("http","").replace(":","").replace("php","").replace(".","").replace("/","");
	}
	else
	{
		filename_url = url.replace("http","").replace("php","").replace(".","").replace("/","");
	}
	String filename = filename_url + "syspan.txt";
	String store_filename = store_path + filename;
	File f = new File(store_filename);
	if("1".equals(flag))
	{
		if(!f.exists())
		{
			String cmd1 ="cmd.exe /c start " + shell + "syspan.exe " + url + " " + password + " " + store_filename;
			try
			{
				Process rt1 = Runtime.getRuntime().exec(cmd1);
			}
			catch(IOException e)
			{
				out.print("123");
			}
		}
	}
	if("0".equals(flag))
	{
		String cmd1 = "cmd.exe /c start " + shell + "rm.exe " + store_filename;
		try
		{
			Process rt = Runtime.getRuntime().exec(cmd1);
		}
		catch(IOException e)
		{
			out.print("123");
		}
		Thread.sleep(1000);
		String cmd = "cmd.exe /c start " + shell + "syspan.exe " + url + " " + password + " " + store_filename;
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
    InputStreamReader isr = new InputStreamReader(new FileInputStream(store_filename),"UTF-8");
    BufferedReader br = new BufferedReader(isr);
    String s;
	String str = "<table border=\"1\" id=\"settable_1\"><tr>";
    while ((s = br.readLine()) != null) 
	{
        str = str + "<td onclick=\"getmulu(this)\">" + s + ":/</td>";
    }
	str = str + "</tr></table>";
	out.print(str);
    br.close();
    isr.close();
%>