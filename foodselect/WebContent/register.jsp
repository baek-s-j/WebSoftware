<%@page import="java.io.*" %>
<%@include file = "checkDuplicate.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	
</head>
<body>

	<%
		try{
			// Get parameter value from HTML
			String userID = request.getParameter("userID");
			String userName = request.getParameter("userName");
			String email = request.getParameter("userEmail");
			String password = request.getParameter("userPassword");

			// File path
			String strPath = getServletContext().getRealPath("/") + "register.txt";

			File strFile = new File(strPath);
			
			if (!strFile.exists())
				strFile.createNewFile();
			

			boolean isDuplicated = checkDuplicate(userName, email, strPath);
			if(isDuplicated){
				out.print("<script>alert('The user name or email already exists!');</script>");
				out.println("<script>window.history.back();</script>");
			}else{

				// File appending
				Writer objWriter = new BufferedWriter(new FileWriter(strFile, true));
				objWriter.write(userName+ "," +userID + "," + email + "," + password);
				objWriter.write("\n");
				
				objWriter.flush();
				objWriter.close();
				objWriter = null;
			}
			
		}catch(IOException e){
			out.println(e.getMessage());
		}
	%>

	
</body>
</html>