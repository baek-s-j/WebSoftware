<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
		body {font-family: Arial, Helvetica, sans-serif;}
		span {
			color:red;
		}

		input[type=text], input[type=email], input[type=password] {
		  width: 100%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  box-sizing: border-box;
		}

		

		input[type=submit]:hover {
		  background-color: #45a049;
		}


		

		div {
		  border-radius: 5px;
		  background-color: #f2f2f2;
		  padding: 20px;
		}	    
 

	</style>
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
<body>

<div>	
	<form action="storeD2.jsp" method="POST" >
	  <h2>음식점 등록 신청서</h2>
	   <p>
	    <label>음식점 이름 <span>*</span></label>
	   <input type="text" placeholder="음식점 이름" name="foodTitle"  id="foodTitle" required>
	  </p>
	  <p>
	    <label>자세한 내용 <span>*</span></label>
	    <input type="text" placeholder="자세한 내용" name="foodContent"  id="foodContent" required>
	  </p>
	 
	  <p>
	    <label>음식점 주소 <span>*</span></label>
	     <input type="text" placeholder="음식점 주소" name="foodPlace"  id="foodPlace" required>
	  </p>
	 
	  <p>
	    <label>음식 종류 <span>*</span></label>
	    <select name="foodCate" >
						<option selected value="">-선택-</option>
						<option value=한식>한식</option>
						<option value=중식>중식</option>
						<option value=분식>분식</option>
						<option value=양식>양식</option>
						</select>
	  </p>
	  <p>
	    <input type="submit" class="btn btn-primary" value="신청하기">
	    <button class="btn btn-primary" onclick="location='main.jsp'">닫기</button>
	  </p>

	</form>
</div>
</body>
</html>