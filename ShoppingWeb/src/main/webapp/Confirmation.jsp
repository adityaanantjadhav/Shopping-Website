<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<style>
				.outer{
			display:flex;
			justify-content:center;
			align-items:center;
			height:100vh;		
		}
		.encapsulate{
			display:flex;
			flex-direction:column;
			padding:15px 10px 15px 10px;
			border:2px solid darkblue;
			border-radius:20px;
			justify-content:center;
            align-items: center;
            height: 35%;
		}
        
        .encapsulate>h1{
                margin-bottom: 012%;
        }
	</style>


</head>
<body>
	<%
	if((session!=null) && (session.getAttribute("email")!=null))
	{
		
	    String a=String.valueOf(request.getAttribute("a"));		
	    
		String message="";
		if(a.equals(null)){										//when nothing is entered
			System.out.print("a is null");
		}
		else if(a.equals("done")){
			message="Item is Successfully added";
		%>
		<%
	    }
		else if(a.equals("fail")){
		    message="Failed to add Item Try again";
		}
		%>
		    <div class="outer">
			<div class="encapsulate">
			
				<h1><%=message%></h1>
				<div>
				<button type="button" class="btn btn-primary" onclick="window.location.href='AddItems.jsp'">Return</button>
				<button type="button" class="btn btn-primary me-5" onclick="window.location.href='index.jsp'">Home</button>
				</div>
			</div>
			
			
			
			</div>
		    
		    
		    
		    
		<%
		}
		%>

<!-- Your page content here -->

<!-- Modal -->


<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smX4PjLDpGak2wE9eHjCNMbi8" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script>
    function redirectTo(page) {
        window.location.href = page;
    }
</script>
</body>
</html>