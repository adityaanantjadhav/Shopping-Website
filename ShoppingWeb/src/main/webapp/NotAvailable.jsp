<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Not Available</title>
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
		    background-image: url('images/Carousel/NotAvailableBackground.jpeg'); /* Replace with the correct URL to your image */
		    background-size: cover; /* Adjust as needed */
		}
		
		.encapsule{
			display:flex;
			width:45%;
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
	<div class="outerbox">
		<div class="encapsule">
			<h1>So sorry this is currently unavailable</h1>
			<br>
			<p id="errorDetails">We will Update it soon</p>
		</div>
	</div>
</body>
</html>