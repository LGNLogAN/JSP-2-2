<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접종예약조회</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<%
String resvno=request.getParameter("RESVNO");
%>
<h1>예약번호: <%= resvno%>의 접종예약조회</h1>

<table border=1>
<tr><th>이름</th><th>주민번호</th><th>성별</th><th>전화번호</th><th>예약일자</th><th>예약시간</th><th>병원명</th><th>대표전화</th><th>병원주소</th><th>백신 종류</th></tr>
<%
try{
    Class.forName("oracle.jdbc.OracleDriver");
    Connection  con=DriverManager.getConnection
            ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
    Statement stmt=con.createStatement();
    String sql= " select kj.pname as pna, kj.jumin as jum, "+
            	" case substr(kj.jumin,8,1) when '1' then '남' when '2' then '여' end as sex, "+
    			" kj.tel as tel ,substr(kv.resvdate,1,4)||'년'||substr(kv.resvdate,5,2)||'월'||substr(kv.resvdate,7,2)||'일' as dat, "+
            	" substr(kv.resvtime,1,2)||':'||substr(kv.resvtime,3,4) as tim, kh.hospname as hna,kh.hosptel as hte, kh.hospaddr as had, "+
    			" case kv.vcode when 'V001' then 'A백신' when 'V002' then 'B백신' when 'V003' then 'C백신' end as vco "+
            	" from KW_JUMIN_2023 kj,KW_HOSP_2023 kh, KW_VACCRESV_2023 kv "+
            	" where kh.hospcode = kv.hospcode and kj.jumin=kv.jumin and kv.RESVNO='"+ resvno +"' ";
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
    out.print("<tr>");
    out.print("<td>"+rs.getString("pna")+"</td>");
    out.print("<td>"+rs.getString("jum")+"</td>");
    out.print("<td>"+rs.getString("sex")+"</td>");
    out.print("<td>"+rs.getString("tel")+"</td>");
    out.print("<td>"+rs.getString("dat")+"</td>");
    out.print("<td>"+rs.getString("tim")+"</td>");
    out.print("<td>"+rs.getString("hna")+"</td>");
    out.print("<td>"+rs.getString("hte")+"</td>");
    out.print("<td>"+rs.getString("had")+"</td>");
    out.print("<td>"+rs.getString("vco")+"</td>");
    out.print("</tr>");
    rs.close();
}catch(Exception e){
    e.printStackTrace();
}
%>

</table>
<h1><input type="submit" value="돌아가기" onclick="location.href='m2.jsp'"></h1>
<jsp:include page="footer.jsp"/>
</body>
</html> 