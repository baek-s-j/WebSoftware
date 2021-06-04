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

  <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">무엇을 먹을지 고민된다면 잘 왔다.</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form action="serch.jsp" method="POST">
            <div class="form-row" >
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <select name=foodCate class="form-control form-control-lg" >
						<option selected value=" ">종류</option>
						<option value=한식>종류는 한식</option>
						<option value=양식>종류는 양식</option>
						<option value=분식>종류는 분식</option>
						<option value=중식>종류는 중식</option>
						</select>
				<select name=foodWhere class="form-control form-control-lg" >
						<option selected value=" ">장소</option>
						<option value=정문>장소는 정문</option>
						<option value=중문>장소는 중문</option>
						<option value=서문>장소는 서문</option>
						<option value=후문>장소는 후문</option>
						</select>	
              </div>
							
              	
              <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-block btn-lg btn-primary">검색</button> 
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </header>

  <!-- Icons Grid -->
  <section class="features-icons bg-light text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex"> 
            <i class="icon-menu m-auto text-primary" onClick="location.href='category.jsp'"></i>
            </div>
            <h3>종류별 추천받기</h3>
            <p class="lead mb-0">한식, 양식, 중식, 분식을 선택하여 추천받아봐요</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
            <i class="icon-map m-auto text-primary" onClick="location.href='where.jsp'"></i>
            </div>
            <h3>위치별 추천받기</h3>
            <p class="lead mb-0">중문, 정문, 서문, 위치에 따라 추천받기</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-star m-auto text-primary" onClick="location.href='rating.jsp'"></i>
            </div>
            <h3>평점별 추천받기</h3>
            <p class="lead mb-0">사람들에게 인기 있는 곳으로!</p>
          </div>
        </div>
      </div>
    </div>
  </section>

 

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