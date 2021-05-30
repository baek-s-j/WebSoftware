<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.foodDAO"%>

<%@ page import="java.io.PrintWriter"%>
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
	
	
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}else{
		if(request.getParameter("content") == null){
			System.out.println(request.getParameter("content"));
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			foodDAO foodDAO = new foodDAO();
			int result = foodDAO.write(foodID, userID, request.getParameter("content"));
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
                script.println("history.back()");
                script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				%>
				<script type="text/javascript">location.href="view.jsp?foodID=<%=foodID%>";</script> 	
				<%
			}
		}
	}
	%>
</body>
</html>