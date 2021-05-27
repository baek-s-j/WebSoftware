<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
      
     <h1 class="mb-5">종류별 추천!</h1>


   
    <!-- Page Features -->
    <div class="row text-center">

      <div class="col-lg-3 col-md-6 mb-4">
       
          <img class="card-img-top" src="https://cdn.pixabay.com/photo/2017/08/08/09/44/food-photography-2610863_960_720.jpg" onClick="location.href='han.jsp'" width= 300px; height= 150px;>
          <h4 class="card-title">한식</h4>
          
        
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
       
          <img class="card-img-top" src="https://cdn.pixabay.com/photo/2018/12/04/15/20/chinese-3855829_960_720.jpg" onClick="location.href='jung.jsp'" width= 300px; height= 150px;>
          <h4 class="card-title">중식</h4>
        
      </div>

       <div class="col-lg-3 col-md-6 mb-4">
       
          <img class="card-img-top" src="https://cdn.pixabay.com/photo/2021/04/13/11/44/tomahawk-6175482__340.jpg" onClick="location.href='yang.jsp'" width= 300px; height= 150px;>
          <h4 class="card-title">양식</h4>
        
      </div>

       <div class="col-lg-3 col-md-6 mb-4">
       
          <img class="card-img-top" src="https://cdn.pixabay.com/photo/2017/09/10/14/23/toppokki-2735719__340.jpg" onClick="location.href='bun.jsp'" width= 300px; height= 150px;>
          <h4 class="card-title">분식</h4>
        
      </div>

    </div>
    </header>
    <!-- /.row -->


  </div>
  <!-- /.container -->
 <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>