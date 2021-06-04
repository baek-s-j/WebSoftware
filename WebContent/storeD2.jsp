<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@ page import="food.foodDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="food" class="food.food" scope="page" />
<jsp:setProperty name="food" property="foodTitle" />
<jsp:setProperty name="food" property="foodContent" />
<jsp:setProperty name="food" property="foodPlace" />
<jsp:setProperty name="food" property="foodCate" /> 

<!DOCTYPE html>
<html>
<head>
	<title></title>
	
</head>
<body>
	<%
	foodDAO foodDAO = new foodDAO(); //인스턴스생성
	if(food.getfoodCate() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('종류 입력은 필수입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
		//신청성공
	else {
		int result = foodDAO.join(food);				
		if(result == -1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 신청하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
		PrintWriter script = response.getWriter();			
		script.println("<script>");
		script.println("alert('신청 되었습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
		}
	}
	%>
</body>
</html>