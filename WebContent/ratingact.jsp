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

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      
     <h1 class="mb-5">평점별 추천!</h1>
		
		<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form action="ratingact.jsp" method="POST">
            <div class="form-row" >
              <div class="col-12 col-md-9 mb-2 mb-md-0">
               <select name=foodValue class="form-control form-control-lg" >
						<option selected value="5">평점</option>
						<option value=0>&#9734; &#9734; &#9734; &#9734; &#9734; ~ &#9733; &#9734; &#9734; &#9734; &#9734;</option>
						<option value=1>&#9733; &#9734; &#9734; &#9734; &#9734; ~ &#9733; &#9733; &#9734; &#9734; &#9734;</option>
						<option value=2>&#9733; &#9733; &#9734; &#9734; &#9734; ~ &#9733; &#9733; &#9733; &#9734; &#9734;</option>
						<option value=3>&#9733; &#9733; &#9733; &#9734; &#9734; ~ &#9733; &#9733; &#9733; &#9733; &#9734;</option>
						<option value=4>&#9733; &#9733; &#9733; &#9733; &#9734; ~ &#9733; &#9733; &#9733; &#9733; &#9733;</option>
						</select>
              </div>
							
              	
              <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-block btn-lg btn-primary">검색</button>
              </div>
            </div>
          </form>
        </div>
		
    </header>
    <!-- /.row -->

  </div>
  <%
  double ad=Double.parseDouble(request.getParameter("foodValue"));
  



  %>
  
  <!-- Page Features -->
    <div class="row text-center">

		<%
		
		int pageNumber = 1; 

		
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		
						ArrayList<food> list;
						foodDAO foodDAO = new foodDAO();
						if(ad==4.0){
							list = foodDAO.getgrade(pageNumber,ad,ad+1.1);
						}
						else{
							list = foodDAO.getgrade(pageNumber,ad,ad+1.0);
						}
						System.out.println(list);
						for (int i = 0; i < list.size(); i++) {
							
					%>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src=<%=list.get(i).getfoodPhoto()%> alt=""><!-- -제가 점수를 주는 기능을 하고있는데..기존 sQL에 들엉있는 값에다가 더하고싶은데 어떤 방식으로해야하나요..?         들어가서 그런거 같아요 그러면 영문이나 숫자만 되나요? 아뇨 되는 특수문자가 있는데 - 이건 특별한 특수문자여서 안되는거 같아요 _는 될겁니다--> 
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
      
      
    </div>
    
  
  
  
  
  <!-- /.container -->
 <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>