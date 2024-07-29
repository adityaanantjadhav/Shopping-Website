<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopmate</title>
</head>
	<%@page import="java.sql.*" import="package1.MySqlConnect"%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
	<style>
        body{
            background-color: rgb(248, 247, 240);
        }

        .encapsulating-box{
            background-color: white;
        }
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .encapsulating-box {
            width: 50%;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
    </style>
</head>
<body>
	<%
	if((session!=null) && (session.getAttribute("email")!=null)){
		String email=(String)session.getAttribute("email");
		
		Connection conn= MySqlConnect.getDBConnection();
		
		String displayQuery = "SELECT name,email,address,password,city,state,zip from user where email=?";
		
		PreparedStatement ptsmt2=conn.prepareStatement(displayQuery);
		
		ptsmt2.setString(1,email);
		
		ResultSet orderSet=ptsmt2.executeQuery();
		
	 %>
    <div class="container center-container">
        <div class="encapsulating-box">
        	<%
    		while(orderSet.next()){
    			String name=orderSet.getString("name");
    			String password=orderSet.getString("password");
    			String address = orderSet.getString("address"); 
    			String cityProfile=orderSet.getString("city");
    			String state=orderSet.getString("state");
    			int zipProfile=orderSet.getInt("zip");
    		%>
            <h2>Edit</h2>
            <form action="EditProfile" class="row g-3" method="post">
                <div class="form-floating">
                    <input type="text" class="form-control" id="name" name="name"  value="<%=name%>" required>
                    <label for="name">Name</label>
                </div>
                <div class="form-floating">
                    <input type="email" class="form-control" id="email" name="email" value="<%=email%>" required>
                    <label for="email">Email address</label>
                </div>
                <div class="form-floating">
                <input type="password" class="form-control" id="password" name="password" value="<%=password%>" required>
                <label for="password">Password</label>
            </div>
            <div class="form-floating">
                <input type="text" class="form-control" id="address" name="address" value="<%=address%>" required>
                <label for="address">Address</label>
            </div>
            <div class="col-md-6">
                <label for="inputCity" class="form-label">City</label>
                <input type="text" class="form-control" id="inputCity" name="inputCity" value="<%=cityProfile%>" >
            </div>
            <div class="col-md-4">
                <label for="inputState" class="form-label">State</label>
                <input id="inputState" name="inputState" type="text" class="form-control" value="<%=state%>">
            </div>
            <div class="col-md-2">
                <label for="inputZip" class="form-label">Zip</label>
                <input type="number" class="form-control" name="inputZip" value="<%=zipProfile%>">
            </div>
            <div class="col-6">
                <button type="submit" class="btn btn-warning">Update</button>
            </div>
        </form>
        <%
    		}
        %>
    </div>
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