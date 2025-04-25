<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

// ex06_ok.jsp?deptno=30 
String pdeptno = request.getParameter("deptno");

String sql = "select *"
		  + " from emp"
		  + " WHERE deptno = " + pdeptno;

int empno, mgr, deptno;
String ename, job;    
double sal, comm;     
LocalDateTime hiredate;

conn = DBConn.getConnection(); // 1, 2

System.out.println( conn );

// 3 CRUD
try {
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql); 
	
	if (rs.next()) {
		do {
			empno = rs.getInt("empno");
			mgr = rs.getInt("mgr");
			deptno = rs.getInt("deptno");
			ename = rs.getString("ename");
			job = rs.getString("job");    
			sal = rs.getDouble("sal");
			comm = rs.getDouble("comm");     
			hiredate = rs.getTimestamp("hiredate").toLocalDateTime();
			
			// 출력담당 jsp 내장 객체
			out.print(String.format("%d\t%s<br>", empno, ename));
			
		} while (rs.next());
		
	
} else{
	out.print(String.format("사원 존재 X<br>"));
}
}catch (SQLException e) {
	e.printStackTrace();
}finally {
	if (rs != null)
		try {
			rs.close();
			if (stmt != null) stmt.close();
				DBConn.close(); // 4
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

%>


</body>
</html>