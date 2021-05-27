<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="food.food"%>
<%@ page import="food.pt"%>
<%@ page import="food.foodDAO"%>
<%@ page import="java.util.ArrayList"%>



<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>충북대 음식점 추천사이트</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="css/landing-page.min.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <%
		String userID=null;
		if(session.getAttribute("userID") != null){
			userID=(String)session.getAttribute("userID");
			
			%>
	<nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="main.jsp">충북대 음식점 추천사이트</a>
      <a class="btn btn-primary" href="logout.jsp" >log out</a>
      <a class="btn btn-primary" href="#" >my page</a>
    </div>
  </nav>
  <%}
		else{
  %>
  
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="main.jsp">충북대 음식점 추천사이트</a>
      <a class="btn btn-primary" href="login.jsp" >log in</a>
      <a class="btn btn-primary" href="register.html" >new Register</a>
    </div>
  </nav>
  <%
		}
  %>

  
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
		food food = new foodDAO().getfood(foodID);
		
		float result= 0;
		result=(float)food.getfoodValue()/(float)food.getfoodPerson();
		int avc = new foodDAO().jjimgoing(userID, foodID);
	%>
  
  
  
  
  
   <!-- Page Content -->
  <div class="container">

    <!-- Heading Row -->
    <div class="row align-items-center my-5">
      <div class="col-lg-7">
        <img class="img-fluid rounded mb-4 mb-lg-0" src=<%=food.getfoodPhoto()%> alt="" width=600; height=600;>
         
      </div>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5" style="background-color: #fdeae2;">
        <h1 class="font-weight-light"><%=food.getfoodTitle()%>(<%=food.getfoodWhere()%>)</h1>
        <%if(avc < 1 ){ %>
        <form action="jjim.jsp">
		<input type=hidden name="foodID" value="<%=food.getfoodID()%>">
		<input type="submit" class="btn btn-primary" value="찜">
		</form>
		<%} %>
        <img class="img-fluid rounded mb-4 mb-lg-0" src=<%=food.getfoodMenu()%> alt="" width=570; height=319;>
        <p><%=food.getfoodContent()%></p>
        <p style="border:3px solid green;">평점 ☞<%=String.format("%.1f", result)%>☜</p>
        <form method="post" action="staract.jsp?foodID=<%= foodID %>">
        <select name=foodValue >
						<option selected value="5">평점</option>
						<option value=1>&#9733; &#9734; &#9734; &#9734; &#9734;</option>
						<option value=2>&#9733; &#9733; &#9734; &#9734; &#9734;</option>
						<option value=3>&#9733; &#9733; &#9733; &#9734; &#9734;</option>
						<option value=4>&#9733; &#9733; &#9733; &#9733; &#9734;</option>
						<option value=5>&#9733; &#9733; &#9733; &#9733; &#9733;</option>
						</select>
		<input type="submit" class="btn btn-primary" value="좋아요">
        </form>
        
      </div>
      <!-- /.col-md-4 -->
    </div>
    
    <!-- /.row -->

    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0"><%=food.getfoodPlace()%></p>
      </div>
    </div>
    
  
     
</div>
<%
	foodDAO foodDAO = new foodDAO();
	ArrayList<pt> list = foodDAO.getpt(foodID);
	System.out.println(list);
	for (int i = 0; i < list.size(); i++) { 
	%>
	<div class="card mb-2">
	<div class="card-header bg-light">
	<i class="fa fa-comment fa"></i> <%=list.get(i).getuserID()%>님
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<h style="border:3px solid green; "><%=list.get(i).getdate()%></h>
				
			</div>
			<h><%=list.get(i).getcontent()%></h>
			</li>
			</ul>
			</div>
			</div>
			</div>
			<%} %>

    
    <div class="card mb-2">
	<div class="card-header bg-light">
	<i class="fa fa-comment fa"></i> 댓글쓰기
	</div>
	<form method="post" action="writeact.jsp?foodID=<%= foodID %>"  >
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<h><%=userID%>님</h>
				
			</div>
			<textarea class="form-control" name="content" rows="3"></textarea>
			
			<button type="submit" class="btn btn-dark mt-3">댓글 쓰기</button>
		    </li>
		</ul>
	</div>
	</form>
	</div>
    
    
    
    

</body>
</html>