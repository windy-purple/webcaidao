<%@page language="java" contentType="application/x-msdownload" pageEncoding="gb2312"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>

<%  
	String fileName = request.getParameter("name");
	String path = application.getRealPath(request.getRequestURI());
	path = path.replace("source\\file_dowload.jsp","");
	String shell = path;
	shell = shell + "shell\\";
	path = path + "dowload\\";
    String filePath = path;
 
    out.clear();
    response.reset();
    response.setContentType("application/x-download");
    response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
    OutputStream os = response.getOutputStream();
    try {
        FileInputStream fis = new FileInputStream(filePath + fileName);
        try {
            byte[] buffer = new byte[1024 * 10];
            for (int read; (read = fis.read(buffer)) != -1;) {
                os.write(buffer, 0, read);
            }
        } finally {
            fis.close();
        }
    } finally {
        os.close();
    }
%>  