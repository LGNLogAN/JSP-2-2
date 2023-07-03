<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연동</title>
</head>
<body>
<h3> Data base a </h3>
<hr>
<% /* 자바 DB 연동 프로그램 */
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection
			("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	if(con != null){
		out.println("Database Connct : ["+" <b>success</b> ]<br>");
	}
	else{
		out.println("Database Connect : ["+" <b>fail</b> ]<br>");
	};
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select sysdate from dual");
	while(rs.next()){
		out.print("Today date : " + rs.getString(1) + "<hr>");
	}
	stmt.close();
	con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>