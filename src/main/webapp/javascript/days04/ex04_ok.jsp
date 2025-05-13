<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

// jsp 기본 제공되는 객체 : request 객체
String subject = request.getParameter("subject");

%>

> 전송된 좋아하는 과목 : <%= subject %><br>
<br>
<br>
<br>
<a href="javascript:history.back();">뒤로 가기</a>
<a href="javascript:location.href='ex04.html';">뒤로 가기</a>
<br>
<input type="radio" name="subject" value="kor"><label for="">국어</label></input>
<input type="radio" name="subject" value="eng"><label for="">영어</label></input>
<input type="radio" name="subject" value="mat"><label for="">수학</label></input>
<input type="radio" name="subject" value="pe"><label for="">체육</label></input>
<br>
<%-- 	// JSP 문법에 EL(표현언어) ${} - 서버에서 EL 표현으로 인식하여 처리함 / 응답하기 전에 실행함. 주석된것 아님
//  서버에서 처리되어 전송 -> 소스에 value = pe로 되어있음 --%>

<script>
	let subject =  '<%= subject %>'; // let subject = kor ==> 식별자(변수명)으로 인식함
    document.querySelector(`input[type=radio][value=\${subject}]`).checked = true;
    
    // <%-- document.querySelector(`input[type=radio][value=<%= subject %>]`).checked = true; --%>
</script>
</body>
</html>
