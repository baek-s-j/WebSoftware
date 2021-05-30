<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.Console"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="food.foodDAO"%>
<%@ page import="food.food"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<head>
  <%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>
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
  <script>
  function click_event(){
	  System.out.println('ho');
	}
  </script>
</head>

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
      <a class="btn btn-primary" href="mypage.jsp" >my page</a>
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
		
		if(userID==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용가능합니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
  %>


  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      
     <h1 class="mb-5"><%=userID%>님이 원하는 대로!</h1>


    </header>
    <!-- /.row -->

  </div>
  
     <!-- Page Features -->
    <div class="row text-center">

		<%
		
		int pageNumber = 1; 

		
		if (request.getParameter("pageNumber") != null) {
			
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		
		
			foodDAO foodDAO = new foodDAO();
			String ab=request.getParameter("foodCate");
			String ac=request.getParameter("foodWhere");
			System.out.println(ab);
			System.out.println(ac);
			System.out.println(pageNumber);
			ArrayList<food> list = foodDAO.getSerch(pageNumber, ab,ac);
			System.out.println(list);
			if(list.size()==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('원하는 결과가 없습니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			for (int i = 0; i < list.size(); i++) {
				
		%>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
         <img class="card-img-top" src=<%=list.get(i).getfoodPhoto()%> alt="" width=500; height=325;>
          <div class="card-body">
            <h4 class="card-title"><%=list.get(i).getfoodTitle()%></h4>
            <p class="card-text"><%=list.get(i).getfoodIntro()%></p>
          </div>
          <div class="card-footer">
            <a href="view.jsp?foodID=<%=list.get(i).getfoodID()%>" class="btn btn-primary">자세히 보기</a>
          </div>
        </div>
      </div>
      
      <%} %>
      
   <div class="container">
			<div class="row">
				<div class="col">
				<ul class="pagination">
					<%if(foodDAO.getserchnumber(ab,ac)%4==0){ 
						for(int i = 1; i < (foodDAO.getserchnumber(ab,ac)/4)+1; i++){
							
						%><li class="page-item">
						<form action="serch.jsp?pageNumber=<%=i%>">
						<input type=hidden name="foodWhere" value="<%=ab%>">
						<input type=hidden name="foodWhere" value="<%=ac%>">
						<input type=hidden name="pageNumber" value="<%=i%>">
						<input type="submit" class="btn btn-primary" value="<%=i%>">
						</form>
						</li>
						
							
						<%} 
					}
					else{
					for(int i = 1; i < (foodDAO.getserchnumber(ab,ac)/4)+2; i++){
						
						%>
						<li class="page-item"><form action="serch.jsp?pageNumber=<%=i%>">
						<input type=hidden name="foodCate" value="<%=ab%>">
						<input type=hidden name="foodWhere" value="<%=ac%>">
						<input type=hidden name="pageNumber" value="<%=i%>">
						<input type="submit" class="btn btn-primary" value="<%=i%>">
						</form></li>
						
						
					
						
						
						
						<% } // 이런것도 js를 이용하여 이벤트 형식으로 그때그때 바꿔줄 수 있어요 
 						} %>
					</ul>
				</div>
			</div>
		</div>	
						
      
      
    </div>
    <script type="text/javascript" src="static/web.js"></script> 
    
  
  <!-- /.container -->
 <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>