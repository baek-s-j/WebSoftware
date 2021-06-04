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
  
  
  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="about.jsp">About</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="storeD.jsp">음식점 등록신청</a>
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
  
  <!-- /.container -->
 <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>