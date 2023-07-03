<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String a=request.getParameter("a");
String b=request.getParameter("b");
String c=request.getParameter("c");
String d=request.getParameter("d");
String e=request.getParameter("e");
String f=request.getParameter("f");

int a1=Integer.parseInt(a);
try{
    Class.forName("oracle.jdbc.OracleDriver");
    Connection  con=DriverManager.getConnection
            ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
    Statement stmt=con.createStatement();
    String sql=" insert all "+
               " into KW_VACCRESV_2023 values('"+a1+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"') "+
               " select * from dual ";
    stmt.executeUpdate(sql);
    response.sendRedirect("m1.jsp");
}catch(Exception e1){
    e1.printStackTrace();
}
%>
</body>
</html>