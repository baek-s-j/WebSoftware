<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />


<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	
</head>
<body>
	<%
	
	
	UserDAO userDAO = new UserDAO(); 
	
	String result = userDAO.pass(user.getUserID(),user.getUserName());				
	if(result == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 없습니다. 회원가입을 해주세요')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
		
	
	%>
	<button class="abcd" 
				onclick="location.href='main.jsp';"
				type="button">비밀번호는 [<%=result %>]입니다. 로그인을 해주세요</button>
	
</body>
</html>