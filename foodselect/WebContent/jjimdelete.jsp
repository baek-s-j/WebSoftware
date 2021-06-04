<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="food.foodDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="food.food"%>
<%@ page import="food.pt"%>
<%@ page import="java.util.ArrayList"%>
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
	
	System.out.println(request.getParameter("foodID"));
		
	
	
	
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	System.out.println(userID);
	int food = new foodDAO().jjimex(userID, foodID);
	%>
	<script type="text/javascript">location.href="mypage.jsp";</script> 
</body>
</html>