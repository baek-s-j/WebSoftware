<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>충대생을위한, 안전한 거래 충대 장터</title>
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

		input[type=submit] {
		  width: 100%;
		  background-color: #4CAF50;
		  color: white;qnsau
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		}

		input[type=submit]:hover {
		  background-color: #45a049;
		}


		input[type=reset] {
		  width: 100%;
		  background-color: #00BFFF;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		}

		input[type=reset]:hover {
		  background-color: #1E90FF;
		}

		div {
		  border-radius: 5px;
		  background-color: #f2f2f2;
		  padding: 20px;
		}	    
 

	</style>
</head>
<body>

<div>	
	<form action="pass2.jsp" method="POST" >
	  <h2>충대장터 비밀번호 찾기</h2>
	   <p>
	    <label>이름 <span>*</span></label>
	   <input type="text" placeholder="User name" name="userID"  id="userID" required>
	  </p>
	  <p>
	    <label>아이디 <span>*</span></label>
	    <input type="text" placeholder="User id" name="userName"  id="userName" required>
	  </p>
	 <input type="submit" name="submitButton" value="비밀번호 찾기" id="submitButton">
	 

	</form>
</div>
</body>
</html>