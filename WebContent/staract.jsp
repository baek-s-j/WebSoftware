<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.foodDAO"%>
<%@ page import="food.food"%>
<!-- Bbsdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.io.Console"%>



<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>





<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
	int foodID = 0;
	if (request.getParameter("foodID") != null) {
		foodID = Integer.parseInt(request.getParameter("foodID"));
	}
	if (foodID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}


	
	
	
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		System.out.println(request.getParameter("foodValue"));
		script.println("<script>");
		script.println("alert('로그인 후 이용가능 합니다..')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	else{
		foodDAO foodDAO = new foodDAO();
		int result = foodDAO.update(foodID, Integer.parseInt(request.getParameter("foodValue")));
		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('실패')");

			script.println("history.back()");

			script.println("</script>");

		} else {

			PrintWriter script = response.getWriter();

			script.println("<script>");
			
			script.println("alert('회원님의 의견은 소중합니다.')");
			script.println("</script>");
			%>
			<script type="text/javascript">location.href="view.jsp?foodID=<%=foodID%>";</script> 	
			<%

			

			

		}
	}
	%>
	
</body>
</html>