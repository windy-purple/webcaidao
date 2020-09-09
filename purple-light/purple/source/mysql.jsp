<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.String.*" %>
<%
	String url = request.getParameter("url");
	String password = request.getParameter("password");
	String user = request.getParameter("user");
	String pw = request.getParameter("pw");
	String dbname = request.getParameter("dbname");
	String port = request.getParameter("port");
	String sql = request.getParameter("sql");
	String path = application.getRealPath(request.getRequestURI());
	path = path.replace("source\\mysql.jsp","");
	String shell = path;
	shell = shell + "shell\\";
	path = path + "store\\";
	String store_path = path;
	String filename = store_path + "sql.txt";
	String cmd ="cmd.exe /c start " + shell + "mysql.exe " + url + " " + password + " " + dbname + " " + user + " " + pw + " " + port + " " + filename + " " + sql;
	try
	{
		Process rt = Runtime.getRuntime().exec(cmd);
	}
	catch(IOException e)
	{
		out.print("123");
	}
	Thread.sleep(2000);
	response.setContentType("text/html;charset=UTF-8");
	InputStreamReader isr = new InputStreamReader(new FileInputStream(filename), "GBK");
    BufferedReader br = new BufferedReader(isr);
	out.print("结果:");
	String sb = "<table border=\"1\" id=\"t1\">";
    String s;
	String[] th = sql.split(" ");
	if(th[1].contains(","))
	{
		String[] k = th[1].split(",");
		sb = sb + "<tr>";
		for(int m=0;m<k.length;m++)
		{
			sb = sb + "<th>" + k[m] + "</th>";
		}
		sb = sb + "</tr>";
	}
	else
	{
		if(!("*".equals(th[1])))
		{
			sb = sb + "<tr><th>" + th[1] + "</th></tr>";
		}
	}
    while ((s = br.readLine()) != null) 
	{
		s = s.replace("\n","").replace("\r\n","");
        if(s.contains("@"))
		{
			sb = sb + "<tr>";
			String[] str = s.split("@");
			for(int i=0;i<str.length;i++)
			{
				sb = sb + "<td>" + str[i] + "</td>";
			}
			sb = sb + "</tr>";
		}
		else
		{
			sb = sb + "<tr><td>" + s + "</td></tr>";
		}
    }
	sb = sb + "</table>";
	out.print(sb);
    br.close();
    isr.close();
%>