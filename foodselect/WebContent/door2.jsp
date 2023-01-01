<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.Console"%>
<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="food.foodDAO"%>
<%@ page import="food.food"%>
<%@ page import="java.util.ArrayList"%>
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
      
     <h1 class="mb-5">위치별 추천!</h1>


     <!-- Page Features -->
    <div class="row text-center">

      <div class="col-lg-3 col-md-6 mb-4">
       
          <img class="card-img-top" src="img/door1.jpg" onClick="location.href='door1.jsp'" width= 300px; height= 150px;>
          <h4 class="card-title">정문</h4>
          
        
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
       
          <img class="card-img-top" src="img/door2.PNG" onClick="location.href='door2.jsp'" width= 300px; height= 150px;>
          <h4 class="card-title">중문</h4>
        
      </div>

       <div class="col-lg-3 col-md-6 mb-4">
       
          <img class="card-img-top" src="img/door3.jpg" onClick="location.href='door3.jsp'" width= 300px; height= 150px;>
          <h4 class="card-title">서문</h4>
        
      </div>


       

    </div>
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
						String ab="중문";
						ArrayList<food> list = foodDAO.getWhere(pageNumber, ab);
						System.out.println(list);
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
      
      
      <%}%>
      <div class="container" >
			<div class="row">
				<div class="col">
				<ul class="pagination">
						<%if(foodDAO.getdoor("중문")%4==0){
							for(int i = 1; i < (foodDAO.getdoor("중문")/4)+1; i++){
							%><li class="page-item"><a class="page-link" href="door2.jsp?pageNumber=<%=i%>"><%=i%></a></li>
							
								
							<%}
						}
						else{
						for(int i = 1; i < (foodDAO.getdoor("중문")/4)+2; i++){
							%>
			
						<li class="page-item"><a class="page-link" href="door2.jsp?pageNumber=<%=i%>"><%=i%></a></li>
						
							
							
							
						<%}
							}%>
						</ul>
				</div>
			</div>
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
  
  
  
  
  
  
  
  
  
  
  
  
  <!-- /.container -->
 <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>