<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="Header.jsp" %>
	<title>Document</title>
    <style>
        .boxx{
            display: flex;
            justify-content: center;
            align-items:center ;
            height: 85vh;
        }

        .AdditemsForm{
            width: 50%;
            border:2px solid brown;
            padding: 30px;
            border-radius: 10px;
            background-color: white;
        }
        
        #sellItem{
        	color:darkblue;
        	font-size:32px;
        	font-weight:700;
        	text-align:center;
        }
    </style>
</head>
<body>
	<%
	if((session!=null) && (session.getAttribute("email")!=null))
	{
			
	%>
		<h1 id="sellItem">Sell Items</h1>
	    <div class="boxx">
	    <form class="AdditemsForm" action="AddingItemServlet" method="post" enctype="multipart/form-data">
	        <div class="row mb-3">
	          <label for="itemName" class="col-sm-2 col-form-label">ItemName</label>
	          <div class="col-sm-10">
	            <input type="text" class="form-control" id="itemName" name="itemName" required>
	          </div>
	        </div>
	        <div class="row mb-3">
	          <label for="itemInfo" class="col-sm-2 col-form-label">Information</label>
	          <div class="col-sm-10">
	            <textarea class="form-control" id="itemInfo" name="itemInfo"></textarea>
	          </div>
	        </div>
	        <div class="row mb-3">
	            <label for="itemCategory" class="col-sm-2 col-form-label">Category</label>
	            <div class="col-sm-6">
	                <select class="form-select" aria-label="Default select example" id="itemCategory" name="itemCategory">
	                    <option value="0" selected>Not Selected</option>
	                    <option value="1">Top trending</option>
	                    <option value="2">Today's Special</option>
	                </select>
	            </div>
	        </div>
	        <div class="row mb-3">
	            <label for="itemCategory2" class="col-sm-2 col-form-label">Category</label>
	            <div class="col-sm-6">
	                <select class="form-select" aria-label="Default select example" id="itemCategory2" name="itemCategory2">
	                    <option value="Nothing" selected>Not Selected</option>
	                    <option value="Electronic">Electronic</option>
	                    <option value="Clothes">Clothes</option>
	                    <option value="Footware">Footwear</option>
	                    <option value="Phone">Phone</option>
	                </select>
	            </div>
	        </div>
	        
	        <div class="row mb-3">
			    <label for="itemImage" class="col-sm-2 col-form-label">Image</label>
			    <div class="col-sm-6">
			        <input type="file" class="form-control" id="itemImage" name="itemImage">
			    </div>
			</div>
			
		 	<div class="row mb-3">
				<label for="itemPrice" class="col-sm-2 col-form-label">Price</label>
		 		<div class="col-sm-4">
			        <input type="number" class="form-control" id="itemPrice" name="itemPrice">
			    </div>
			    <p class="fs-6 col-sm-2">Rs.</p>	
			</div>
						
	        <button type="submit" class="btn btn-warning">Add</button>
	      </form>
	    </div>
	<%}
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