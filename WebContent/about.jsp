<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  %>
  
  <header class="jumbotron my-4">
    <h1 class="mb-5">소개</h1>
    
    <div class="row text-center">
    <p class="text-black m-0" style="font-size:20px;" >안녕하세요. 충북대 음식점 추천 사이트입니다.<br> 이 웹사이트는 충북대학생들을 대상으로 점심이나 저녁을 먹어야하는 상황에서 어떠한 음식점을 골라야 할때 도움을 주기 위한 사이트로,  사용자에 요구사항을 입력받아 그에 따른 음식점을 추천하는 목적을 가지고 있습니다. <br> 또한 음식점 주인들은 음식점 등록 신청을 통해 자신의 음식점을 홍보 할수 있는 효과를 가져올 수 있습니다. <br> 관심을 주셔서 감사합니다.</p>
    
    </div>
      </header>

 <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0" style="font-size:20px;">1.충북대학교 근처에 위치한 음식점들을 찾아볼수있다.</p>
      </div>
    </div>
     <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0" style="font-size:20px;">3.위치별, 평점별, 종류별로 검색이 가능하고 또한 통합검색으로 자신이 원하는 요구사항에 따라 찾아 볼 수 있다..</p>
      </div>
    </div>
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0" style="font-size:20px;">3.음식점마다 사용자들의 의견과 평점을 볼수 있으므로 의사소통이 가능하다.</p>
      </div>
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

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>