<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.time.LocalDateTime" import="java.time.format.DateTimeFormatter" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Header.jsp" %>
<style>
		.imageofitem{
			width:100%;
			height:100vh;
			object-fit:fill;
			margin-bottom:40px;
		
		}
        #info h2{

            margin: 8px 2px 8px 1px;
        }

        
        #aboutsection{
            width: 100%;
            height: 300px;
            padding: 8px;
            background-color: rgb(209, 249, 249);
            border-radius: 10px;
            font-size:17px;
            font-weight:450;
        }

        .itemrow {
            height: 90vh;
        }

        #buyingsection{
        	background-color:white;
            padding: 10px 15px 25px 15px ;
            border:1px solid rgb(33, 28, 48);
            border-radius: 8px;
            min-height:fit-content;
        }
        .itembtn{
        	border:1px solid green;
            background-color: rgb(237, 237, 55);
            font-size: medium;
            font-weight: 500;
        }
        
        #date{
        
        	font-size:16px;
        	font-weight:900;
        }
    </style>
</head>
<body>

	<%
	
		LocalDateTime obj=LocalDateTime.now();
		LocalDateTime deliveryobj=obj.plusDays(2);
	
		DateTimeFormatter objFormat=DateTimeFormatter.ofPattern("E, MMM dd yyyy");
		
		String deliveryDate=objFormat.format(deliveryobj);
	
	
		///////////////////////////////////////////////////////////////
		int idItem=Integer.parseInt(request.getParameter("id"));
	
		String query="select *from items where id=?";
		

		Connection conn=MySqlConnect.getDBConnection();
		
		try{
		PreparedStatement pstmt1=conn.prepareStatement(query);
		pstmt1.setInt(1,idItem);
		
		ResultSet set=pstmt1.executeQuery();
		

		String itemName,iInfo,image,iseller;
		iseller="Jadhav Industries";
		int iprice; 
		while(set.next()){
			itemName=set.getString("iname");
			iInfo=set.getString("iinfo");
			image=set.getString("image");
		 	iprice=set.getInt("iprice");
			iseller=set.getString("iseller");
		 	
		 	RequestDispatcher rdcart=request.getRequestDispatcher("Cart.jsp");

	%>
	<div class="container">
        <div class="row  mt-5 itemrow">
            <div class="col-6" id="imageofitem" >
                <img src="images/<%=image%>" class="img-fluid imageofitem" alt="product img" width="100%">
            </div>

   <!-- column2          -->
            <div class="col-3" id="info">
                <h2>
                    <%=itemName%>
                </h2>
                <hr>
                <h3>Rs. <%=iprice%></h3>

                <hr>
                <div class="aboutcontainer">

                    <h3>About</h3>
                    <div id="aboutsection" style="overflow: auto;">
                        <p>
						<%=iInfo%>
                        </p>
                    </div>
                </div>
            </div>

    <!-- column3     -->
            <div class="col-3" >
                    <div id="buyingsection">
                        <h2>Rs. <%=iprice%></h2>
                        <p id="date">Delivery date: <%=deliveryDate%><br>After 2 days</p>
                        <h4>In Stock</h4>
                        <p>Sold by <%=iseller%></p>
                        <div class="d-grid gap-2 mt-5">
                            <button id="addToCartButton" class="itembtn btn" type="button">Add to Cart</button>
                            <button class="itembtn btn" type="button" onclick='buyItem(<%=idItem%>)'>Buy Now</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>  

	<%}
		
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous">
    </script>
    
    <script>
    
	    document.addEventListener('DOMContentLoaded', function () {
	        const addToCartButton = document.getElementById('addToCartButton');
	        const buyNowButton = document.getElementById('buyNowButton');
	        const idItem = <%= idItem %>; // Get the idItem from your server-side code
	
	        addToCartButton.addEventListener('click', function () {
	            // Redirect to the "Add to Cart" page with idItem
	            window.location.href = 'Cart.jsp?id=' + idItem;
	        });
	    });
	    
	    
	    function buyItem(itemId){
    		window.location.href="PlacedOrders.jsp?buyId="+itemId;
    	}
	    
</script>
    </script>

</body>
</html>