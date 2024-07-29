<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.time.*" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="Header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .outerbody{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .outerbody>h1{
            margin-bottom: 15px;
        }
        .information{
            display: flex;
            flex-direction: column;
            width:fit-content;
            padding: 20px 18px 20px 18px;
            box-shadow: 4px 2px 4px 2px lightblue;
        }

        .bullet{
            font-size: larger;
            font-weight: 700;
            font-family: 'Times New Roman', Times, serif ;
        }
        .bulletval{
            font-size: larger;
            font-weight: 400;
            font-family: 'Times New Roman', Times, serif ;
            word-wrap: break-word;
        }
    </style>
</head>
<body>
	<%
	if((session!=null) && (session.getAttribute("email")!=null)){
		String email=(String)session.getAttribute("email");
		
		Connection conn=MySqlConnect.getDBConnection();
		
		String displayQuery = "SELECT name,email,address,city,state,zip from user where email=?";
		
		PreparedStatement ptsmt2=conn.prepareStatement(displayQuery);
		
		ptsmt2.setString(1,email);
		
		ResultSet orderSet=ptsmt2.executeQuery();
		
	 %>
    <div class="container">
    	<%
    		while(orderSet.next()){
    			String name=orderSet.getString("name");
    			String address = orderSet.getString("address"); 
    			String cityProfile=orderSet.getString("city");
    			String state=orderSet.getString("state");
    			int zipProfile=orderSet.getInt("zip");
    	%>        
        <div class="outerbody">
        <h1>Your Information</h1>
        <div class="information">
            <div class="row"><p class="bullet col-lg-3">Name:</p><p class="bulletval col-lg-9"><%=name%></p></div>
            <div class="row"><p class="bullet col-lg-3">Email:</p><p class="bulletval col-lg-9"><%=email%></p></div>
            <div class="row"><p class="bullet col-lg-3">Address:</p><p class="bulletval col-lg-9"><%=address%></p></div>
            <div class="row"><p class="bullet col-lg-2">City:</p><p class="bulletval col-lg-4"><%=cityProfile%><p class="bullet col-lg-2">State: </p><p class="bulletval col-lg-4"><%=state%></p></div>
            <div class="row"> <p class="bullet col-lg-2">Zip:</p><p class="bulletval col-lg-9"><%=zipProfile%></p></div>
            <button class="btn btn-warning" type="button" onclick="window.location.href='ProfileEdit.jsp';">Edit</button>
        </div>
    	</div>
        <%
    		}
        %>
    </div>
	<%
	}
	else{
		response.sendRedirect("Login.jsp");
		
	}
	%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous">
    </script>
</body>
</html>