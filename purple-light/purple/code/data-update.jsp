<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>test</title>
</head>
<sql:setDataSource var="name" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/purple?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>

<sql:update dataSource="${name}" var="result">
INSERT INTO data (path,password) VALUES ('${param.path}','${param.password}');
</sql:update>