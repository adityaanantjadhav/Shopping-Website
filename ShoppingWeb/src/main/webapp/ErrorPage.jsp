<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
	<style>
		*{
		
			margin:0px;
		}
		.outerbox {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 100%;
		    height: 100vh;
		    background-image: url('images/Carousel/WrongX.jpeg'); /* Replace with the correct URL to your image */
		    background-size: cover; /* Adjust as needed */
		}
		
		.encapsule{
			display:flex;
			width:70%;
			padding:20px 15px 20px 15px;
			background-color:white;
			flex-direction:column;
			border-radius:14px;
			background-color:lightblue;
		}
		
		#errorDetails{
			color:red;
			font-size:23px;
			word-wrap:break-word;
		}
	
	</style>
</head>
<body>
	<% if (exception!=null){ %>
	<div class="outerbox">
		<div class="encapsule">
			<h1>Ohh nohh Error occured!</h1>
			<br>
			<h3>Details</h3>
			<p id="errorDetails"><%=exception.getMessage()%></p>
		</div>
	</div>
	<%}
	else{
		out.print("<h1>no Error is there</h1>");
	}
	%>

</body>
</html>