<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.apache.tomcat.jni.User"%>
<%@page import="java.io.*" %>
<%@ page import="user.UserDAO" %> <!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO(); //인스턴스생성
		String userName = request.getParameter("id");
		String password = request.getParameter("password");
		int result = userDAO.login(userName, password);
		//로그인 성공
		if(result == 1){
			response.sendRedirect("main.jsp");
			session.setAttribute("userID", userName);
			
		}
		//로그인 실패
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('1.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//아이디 없음
		else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('s.')");
		script.println("history.back()");
		script.println("</script>");
		}
		//DB오류
		else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('SQL을 실행시켜주세요')");
		script.println("history.back()");
		script.println("</script>");
		}		
	%>
</body>
</html>