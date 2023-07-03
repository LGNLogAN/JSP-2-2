<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h1>접종예약조회</h1>
<script>
function aaa(){
    if(document.frm.resvno.value.length==0){
        alert("접종 예약번호가 입력되지 않았습니다.");        return false;
    }
    alert("입력이 끝났습니다.");
}
</script>
<form name="frm" action="action1.jsp"  method="get">
<table border=1>
<tr><td>예약번호를 입력하시오</td>
    <td align="left"><input type="number" name="resvno"></t d></tr>
<tr><td colspan=2><input type="submit" value="예약조회" onclick="return aaa();">
    <input type="reset" value="홈으로" onclick="location.href='index.jsp'"></td></tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>