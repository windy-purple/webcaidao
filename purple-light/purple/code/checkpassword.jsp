<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.lang.String.*" %>

<%
	String password = request.getParameter("password");
%>
<sql:setDataSource var="name" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/purple?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>
	 
<sql:query dataSource="${name}" var="result">
select * from users limit 0,1;
</sql:query>
<c:set var="test" value="${result.rows[0]}" />
<%
	String pw = String.valueOf(pageContext.getAttribute("test"));
	String[] attr = pw.split("=");
	String str = String.valueOf(attr[1]);
	String pw1 = str.substring(0,str.length()-1);
	if(password.equals(pw1))
	{
		response.sendRedirect("../../../purple/admin.jsp");
	}
	else
	{
		out.print("<script>alert(\"密码错误\");</script>");
		response.sendRedirect("../../../purple/login.jsp");
	}
%>