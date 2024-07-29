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
        
        #broughtItemInfo{
        	margin-top:8px;
        	font-size:19px;
        }
		a{
			
    		text-decoration:none;
    		color:white;
		}

    </style>
</head>
<body>
	<%
	if((session!=null) && (session.getAttribute("email")!=null)){
		String email=(String)session.getAttribute("email");
		
		Connection conn=MySqlConnect.getDBConnection();
		
		if(request.getParameter("buyId")!=null){
			int id=Integer.parseInt(request.getParameter("buyId"));
			
			//Adding item to buy table
			String buyQuery="insert into orders(userid,itemid,purchase_date) values(?,?,?)";
			PreparedStatement ptsmt1=conn.prepareStatement(buyQuery);
			ptsmt1.setString(1,email);
			ptsmt1.setInt(2,id);
			
			LocalDate obj=LocalDate.now();
			java.sql.Date sqlDate=java.sql.Date.valueOf(obj);
			ptsmt1.setDate(3,sqlDate);
			ptsmt1.executeUpdate();
			
			
			//Removing items from cart
			String cartRemove="delete from cart where itemid=?";
			PreparedStatement pstmt3=conn.prepareStatement(cartRemove);
			pstmt3.setInt(1,id);
			pstmt3.executeUpdate();
			
			
			response.sendRedirect("PlacedOrders.jsp");
			
			
		}
		
		
		String displayQuery = "SELECT items.iname, items.iinfo, items.image, items.iprice, orders.purchase_date " +
                "FROM items INNER JOIN orders ON orders.itemid = items.id " +
                "WHERE orders.userid = ? " +
                "ORDER BY orders.purchase_date";
		
		PreparedStatement ptsmt2=conn.prepareStatement(displayQuery);
		
		ptsmt2.setString(1,email);
		
		ResultSet orderSet=ptsmt2.executeQuery();
		
	 %>
    <div class="container">
    	<%
    		while(orderSet.next()){
    			String name=orderSet.getString("iname");
    			String info = orderSet.getString("iinfo"); 
    			int price=orderSet.getInt("iprice");
    			String image=orderSet.getString("image");
    			java.sql.Date date=orderSet.getDate("purchase_date");
    			
    			
    			
    			LocalDate localdate=date.toLocalDate();    			
    			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    		    String formatedDate=formatter.format(localdate);
    	%>
         <div class="row cartrow">
	      <div class="col-2 "><img src="images/<%=image%>" class="img-fluid"></div>
	      <div class="col-5 text-center">
                <h2 class="text-wrap"><%=name%></h2>
                <p id="broughtItemInfo"><%=info%></p>
            </div>
            <div class="col-5 text-center ok" >
	         <h3><%=price%>Rs.</h3>
                <div class="mt-4">
					<h4>Date:<%=formatedDate%></h4>
                </div>
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