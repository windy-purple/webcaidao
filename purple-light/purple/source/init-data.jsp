<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="name" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/information_schema?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>

<sql:update dataSource="${name}" var="ok">
create database purple;
</sql:update>
<sql:setDataSource var="name1" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/purple?useUnicode=true&characterEncoding=utf-8"
     user="root"  password="root"/>
<sql:update dataSource="${name1}" var="ok">
create table data(
path char(50) not null,
password char(20) not null
);
</sql:update>
<sql:update dataSource="${name1}" var="ok">
create table users(
password char(100) not null
);
</sql:update>
<sql:update dataSource="${name1}" var="ok">
insert into users (password) VALUES ('5F4DCC3B5AA765D61D8327DEB882CF99');
</sql:update>
<%out.print("数据库purple创建完毕。。。<br/>数据表创建完毕。。。<br/>相关数据写入完毕。。。");%>
