<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="name" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/purple?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>
<sql:query dataSource="${name}" var="result">
SELECT * from data;
</sql:query>
<c:forEach var="row" items="${result.rows}">
<table border="1" id="t0">
<tr>
   <td><c:out value="${row.path}"/></td>
   <td><c:out value="${row.password}"/></td>
   <td><button id="${row.path}@${row.password}" onclick="jump(this)">执行</button></td>
</tr>
</table>
<br/>
<br/>
</c:forEach>