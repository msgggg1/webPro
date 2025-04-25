<!-- %@ 페이지 지시자. 서버에서 자바쓴다.그런데 자바밖에 없어서 안써도 됨 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>ex05_ok.jsp</h3>

<!-- jsp 스크립트 요소 3가지 : 스크립트릿, 표현식 -->

<!-- 서버 처리 코딩 / 응답한 내역에는 없음. 순수한 html로 날아감 -->
<%
	/* % -> 서버에서 실행됨. 전부 자바코딩 들어감 */
	//http://localhost/webPro/html/days05/ex05_ok.jsp
	//? 뒤: QueryString
	//id=hong
	//&
	//passwd=1234 : get 방식. 보안상 좋지 않음
	//&
	//파라미터명=파라미터값
	// 						id, passwd 넘어옴
	// jsp 기본 제공 내장 객체(9): request(요청) 객체  클라이언트-> 서버 모든 정보 얘가 가지고 있음.  
/* 	String id = request.getParameter("id");  name 속성 있어야 server로 submit됨*/  
	String id = request.getParameter("id"); 
	String passwd = request.getParameter("passwd");

%>

전송된 아이디 : <%= id %><br><!-- 출력하기 위한 표현식 -->
전송된 비밀번호 : <%= passwd %><br>

</body>
</html>