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
<h1>판매등록</h1>
<script>
function aaa(){
    if(document.frm.a.value.length==0){
    	frm.a.focus();
        alert("접종 예약번호가 입력되지 않았습니다.");        return false;
    }
    if(document.frm.b.value.length==0){
    	frm.b.focus();
        alert("주민번호가 입력되지 않았습니다.");        return false; 
    }
    if(document.frm.c.value.length==0){
    	frm.c.focus();
        alert("백신코드가 입력되지 않았습니다.");        return false;
    }
    if(document.frm.d.value.length==0){
    	frm.d.focus();
        alert("병원코드가 입력되지 않았습니다.");        return false;
    }
    if(document.frm.e.value.length==0){
    	frm.e.focus();
        alert("예약일자가 입력되지 않았습니다.");        return false;
    }
    if(document.frm.f.value.length==0){
    	frm.f.focus();
        alert("예약시간이 입력되지 않았습니다.");        return false;
    }
    alert("입력이 끝났습니다.");
}
</script>
<form name="frm" action="action.jsp"  method="get">
<table border=1>
<tr><td>접종 예약번호</td>
    <td id=special><input type="number" name="a">예) 2021001</td></tr>
<tr><td>주민번호</td>
    <td id=special><input type="text" name="b">예) 710101-1000001</td></tr>
<tr><td>백신코드</td>
    <td id=special><input type="text" name="c">예) V001-V003</td></tr>
<tr><td>병원코드</td>
    <td id=special><input type="text" name="d">예) H001</td></tr>
<tr><td>예약일자</td>
    <td id=special><input type="text" name="e">예) 20211231</td></tr>
<tr><td>예약시간</td>
    <td id=special><input type="text" name="f">예) 12:30</td></tr>
<tr><td colspan=2><input type="submit" value="등록" onclick="return aaa();">
    <input type="reset" value="초기화"></td></tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>