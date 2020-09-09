<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.String.*" %>

<%
		request.setCharacterEncoding("utf-8");
		String path = application.getRealPath(request.getRequestURI());
		path = path.replace("source\\upload.jsp","");
		String shell = path;
		path = path + "upfile\\";
        String sRet = "";
        File file = null;
        InputStream in = null;
        in = request.getInputStream();
        byte[] inBytes = new byte[request.getContentLength()];
        int nBytes;
        int start = 0;
        int end = 0;
        int size = 1024;
        String token = null;
            String filePath = null;
            while ((nBytes = in.read(inBytes, start, size)) != -1) {
                start += nBytes;
            }
            in.close();
            int i = 0;
            byte[] seperator;

            while (inBytes[i] != 13) {
                i++;
            }
            seperator = new byte[i];

            for (i = 0; i < seperator.length; i++) {
                seperator[i] = inBytes[i];
            }
            String dataHeader = null;
            i += 3;
            start = i;
            while (!(inBytes[i] == 13 && inBytes[i + 2] == 13)) {
                i++;
            }
            end = i - 1;
            dataHeader = new String(inBytes, start, end - start + 1);
            token = "filename=\"";
            start = dataHeader.indexOf(token) + token.length();
            token = "\"";
            end = dataHeader.indexOf(token, start) - 1;
            filePath = dataHeader.substring(start, end + 1);
            i += 4;
            start = i;
            end = inBytes.length - 1 - 2 - seperator.length - 2 - 2;
            File newFile = new File(path + filePath);
            FileOutputStream out1 = new FileOutputStream(newFile);
            out1.write(inBytes, start, end - start + 1);
            out1.close();
			out.print(filePath);
%>