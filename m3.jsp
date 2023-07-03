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
<h1>병원별 접종건수 통계</h1>

<table border=1 align=center>
<tr><th>병원주소</th><th>병원코드</th><th>접종건수</th></tr>
<%
try{
    Class.forName("oracle.jdbc.OracleDriver");
    Connection  con=DriverManager.getConnection
            ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
    Statement stmt=con.createStatement();
    String sql="select kh.hospcode hc, kh.hospname hn, "+
            " count(kh.hospcode) co, sum(count(kh.hospname)) over() tot "+
            " from KW_HOSP_2023 kh, KW_VACCRESV_2023 kv "+
            " where kh.hospcode = kv.hospcode "+
            " group by kh.hospcode, kh.hospname "+
            " order by kh.hospcode ";
    ResultSet rs=stmt.executeQuery(sql);
    String re="";
    while(rs.next()){
    	re = rs.getString("tot");
        out.print("<tr>");
        out.print("<td>"+rs.getString("hc")+"</td>");
        out.print("<td>"+rs.getString("hn")+"</td>");
        out.print("<td>"+rs.getString("co")+"</td>");
        out.print("</tr>");
    }
    out.print("<tr>");
    out.print("<td colspan=2>총합계</td>");
    out.print("<td>"+re+"</td>");
    out.print("</tr>");
}catch(Exception e){
    e.printStackTrace();
}
%>
</table>
<jsp:include page="footer.jsp"/>
</body>
</html> 