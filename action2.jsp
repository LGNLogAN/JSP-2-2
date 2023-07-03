<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<%
String a=request.getParameter("a");
out.print(a+"<br>");
try{
    Class.forName("oracle.jdbc.OracleDriver");
    Connection  con=DriverManager.getConnection
            ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
    Statement stmt=con.createStatement();
    String sql= " select count(*) cnt from KW_VACCRESV_2023 "+
    			" where RESVNO = '"+ a +"' ";
    ResultSet rs1 = stmt.executeQuery(sql);
    rs1.next();
    int su=rs1.getInt("cnt");
    if(su>=1){
    	response.sendRedirect("list.jsp?RESVNO="+ a);
    }
    else{
    	response.sendRedirect("error.jsp?RESVNO="+ a);
    }
    		
}catch(Exception e){
    e.printStackTrace();
}
%>
</table>
<h1><input type="submit" value="돌아가기" onclick="location.href='m2.jsp'"></h1>
<jsp:include page="footer.jsp"/>
</body>
</html> 