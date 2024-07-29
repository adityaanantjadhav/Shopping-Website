<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@include file="Header.jsp" %>
    <style>
        .cartrow{
            margin:1%;
            padding: 8px;
            height: max-content;
            background-color: #fff;
        }

        .col-3 img{
            width: 100%;
            height: auto;
        }

        .cartbtn{
            box-sizing: border-box;
            background-color: rgb(237, 237, 55);
            font-size: medium;
            font-weight: 500;
            width: 43%;
        }

        .cartbtn:hover{
            background-color: greenyellow;
            border:2px solid rgb(237, 237, 55);
        }

        .ok{
            border-left: 1px solid rgba(89, 86, 86, 0.568);
            padding: 4px;
        }
        .last{
            width: 50%;
            padding: 15px 15px 15px 25px;
            margin: 40px;
        }


    </style>
</head>
<body>
	<%
		if((session!=null) && (session.getAttribute("email")!=null)){
			
			String email=(String)session.getAttribute("email");
			Connection conn=MySqlConnect.getDBConnection();
			
			
			
			//Removing Items from Cart
			if(request.getParameter("removeId")!=null){
				int removeId=Integer.parseInt(request.getParameter("removeId"));	
				String removeQuery="delete from cart where cartid=?";
				PreparedStatement ptsmt3=conn.prepareStatement(removeQuery);
				ptsmt3.setInt(1,removeId);
				ptsmt3.executeUpdate();

				response.sendRedirect("Cart.jsp");
			}
			
			
			//Inserting Items into cart
			if(request.getParameter("id")!=null){
				int idItem =Integer.parseInt(request.getParameter("id"));
				
				String addCart="insert into cart(userid,itemid) values(?,?)";
				
				PreparedStatement pstmt1=conn.prepareStatement(addCart);
				pstmt1.setString(1,email);
				pstmt1.setInt(2,idItem);
				pstmt1.executeUpdate();

				response.sendRedirect("Cart.jsp");
			}
			
			
			String displayCart="select cart.cartid,items.id,items.iname,items.iprice,items.image from items inner join cart on cart.itemid=items.id and cart.userid=?";
			PreparedStatement pstmt2=conn.prepareStatement(displayCart);
			pstmt2.setString(1,email);
			ResultSet cartSet=pstmt2.executeQuery();
			
	%>
    <div class="container">
    
    <%
	   while (cartSet.next()) {
	      String name = cartSet.getString("iname");
	      String image = cartSet.getString("image");
	      int price = cartSet.getInt("iprice");
	%>
	   <div class="row cartrow">
	      <div class="col-2"><img src="images/<%=image%>" class="img-fluid"></div>
	      <div class="col-5 text-center">
	         <h2 class="text-wrap"><%=name%></h2>
	      </div>
	      <div class="col-5 text-center ok" >
	         <h3><%=price%>Rs.</h3>
	         <div class="mt-3">
	            <button class="btn me-2 cartbtn" type="button" onclick='buyItem(<%=cartSet.getInt("id")%>)'>Buy</button>
	            <button class="btn cartbtn" type="button" onclick='removeItem(<%=cartSet.getInt("cartId")%>)'>Remove</button>
	         </div>
	      </div>
	   </div>
	<%
	   }
	%>
    </div>
    <div class="last">
        <button class="btn me-2 cartbtn" type="button" onclick="buyAll()">Buy All</button>
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
    <script type="text/javascript">
    	
    	function removeItem(cartId){
    		window.location.href="Cart.jsp?removeId="+cartId;
    	}
    
    	function buyItem(itemId){
    		window.location.href="PlacedOrders.jsp?buyId="+itemId;
    	}
    	
    	
    	///////////////////////////////////@@@@@@@@@@@  AJAX   @@@@@@@@@@@@@@@@@//////////////////////////////////////////////////
    	function buyAll(){
            // Use AJAX to send a request to the server to buy all items in the cart
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // Handle the response if needed
                    console.log(this.responseText);
                    // Redirect to the desired page after buying all items
                    window.location.href = "PlacedOrders.jsp";
                }
            };
            xmlhttp.open("POST", "BuyAllItemsServlet", true);
            xmlhttp.send();
        }    	
    	///////|||||||||||||||||||\\\\\\\\\\\\\\\\\\\???///////////////////////||||\\\\\\\\\\\\\\
    </script>    
</body>
</html>