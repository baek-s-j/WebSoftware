<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@page import="java.io.Console"%>
<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="food.foodDAO"%>
<%@ page import="food.food"%>
<%@ page import="food.jjim"%>
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
		
		User user=new UserDAO().getinf(userID);
  %>

  <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0" style="border:3px solid green;">이름:<%=user.getUserName()%></p>
        <p class="text-white m-0" style="border:3px solid green;">아이디:<%=user.getUserID()%></p>
        <p class="text-white m-0" style="border:3px solid green;">메일:<%=user.getUserEmail()%></p>
      </div>
    </div>
    
    
    <!-- Page Content -->
  
    
    <header class="jumbotron my-4">
    <h1 class="mb-5">찜 목록</h1>
    
    <div class="row text-center">
    <%
    
						foodDAO foodDAO = new foodDAO();
    					food food;
						ArrayList<jjim> list = foodDAO.getjjim(userID);
						System.out.println(userID);
						System.out.println(list);
						for (int i = 0; i < list.size(); i++) {
							food = foodDAO.getfood(list.get(i).getfoodID());
					%>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src=<%=food.getfoodPhoto()%> alt="" width=500; height=325;>
          <div class="card-body">
            <h4 class="card-title"><%=food.getfoodTitle()%></h4>
            <p class="card-text"><%=food.getfoodIntro()%></p>
          </div>
          <div class="card-footer">
            <a href="view.jsp?foodID=<%=food.getfoodID()%>" class="btn btn-primary">자세히 보기</a>
            <br> <br>
             <form action="jjimdelete.jsp">
			<input type=hidden name="foodID" value="<%=food.getfoodID()%>">
			<input type=hidden name="userID" value="<%=userID%>">
			<input type="submit" class="btn btn-primary" value="찜 취소">
			</form>
           
            
          </div>
        </div>
      </div>
      
     
     
      
      
      <%}%>
      </div>
      </header>
      
       

 

  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">About</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">문의사항</a>
            </li>
           
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy; 오픈소스 웹소프트웨어 10조</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
           
            
            <li class="list-inline-item">
              <a href="main.jsp" onclick="alert('010-6372-9624');">
                <i class="icon-phone  fa-2x fa-fw"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>