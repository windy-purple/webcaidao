<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
	String path = application.getRealPath(request.getRequestURI());
	path = path.replace("source\\upfile.jsp","");
	String shell = path;
	shell = shell + "shell\\";
	path = path + "upfile\\";
	String filename_1 = request.getParameter("f1");
	String filename_2 = request.getParameter("f2");
	String password = request.getParameter("password");
	String ip = request.getParameter("url");
	filename_1 = path + filename_1;
	String cmd = "cmd.exe /c start " + shell + "upload.exe " + filename_1 + " " + filename_2 + " " + ip + " " + password;
	try
	{
		Process rt = Runtime.getRuntime().exec(cmd);
	}
	catch(IOException e)
	{
		out.print("123");
	}
	Thread.sleep(1000);
	response.setContentType("text/html;charset=UTF-8");
	out.print("<br/>上传完毕");
%>