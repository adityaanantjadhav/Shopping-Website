<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />


	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-GLhlTQ8i6NDuymepzTpkjBc0IQN2L+Zl2nYUxuZHr/6Z1oM48PshI5tfc2GgAMb" crossorigin="anonymous">



    <%@page import="java.sql.*" import="package1.MySqlConnect" %>
    
    <style>
    	a{
    		text-decoration:none;
    		color:white;
    	}
      body {
        background-color: rgb(250, 215, 231);

      }

      .header {
        padding-top: 10px;
        background-color: #1d1616;
        color: white;
        z-index: 1030;
      }

      .headi {
        text-align: center;
        font-size: 18px;
        font-weight: 500;

      }

       .headi:hover {
          border: 1px solid white;
          border-radius: 9px;
      }
      #searchbar {
        text-align: center;
        font-size: 18px;
        font-weight: 500;
      }

      .headi > p {
        font-size: 12px;
        margin: 0px;
      }

      .headi > h5 {
        padding: 8px;
        margin: 0px;
      }

      .p-2 {
        font-weight: 400;
        color: white;
        background-color: rgb(55, 50, 67);
      }

      .navbar-toggler {
        font-weight: 400;
        color: white;
      }

      .p-2:hover {
        border: 1px solid white;
        border-radius: 2px;
      }

      .sidenav {
        height: 100%; /* 100% Full-height */
        width: 370px; /* 0 width - change this with JavaScript */
        position: fixed; /* Stay in place */
        z-index: 2000; /* Stay on top */
        top: 0; /* Stay at the top */
        left: -370px;
        background-color: #fcfbfb; /* Black*/
        overflow-x: hidden; /* Disable horizontal scroll */
        transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
      }

      .sidenav h1 {
        padding: 0.8em 8px 10px 32px;
        font-size: 20px;
        font-weight: bolder;
        background-color: rgb(55, 50, 67);
        color: white;
      }

      .sidenav h2 {
        padding: 10px 8px 5px 32px;
        font-size: 17px;
        font-weight: bolder;
        color: rgb(0, 0, 0);
      }

      /* The navigation menu links */
      .sidenav a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 14px;
        font-weight: 500;
        color: rgb(55, 50, 67);
        display: block;
        transition: 0.3s;
      }

      /* When you mouse over the navigation links, change their color */
      .sidenav a:hover {
        background-color: #d6d1d1;
      }

      /* Position and style the close button (top right corner) */
      .closebtn {
        border: 0px;
        font-size: 40px;
        color: rgb(254, 251, 251);
        position: absolute;
        top: 20px;
        left: -40px;
        /* font-size: 36px; */
        z-index: 2000;
        transition: 0.5s;
      }

		#cartIcon{
			padding:5px;
			margin-top:5px;
			margin-right:15px;
		}

      /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
      @media screen and (max-height: 450px) {
        .sidenav {
          padding-top: 15px;
        }
        .sidenav a {
          font-size: 18px;
        }
      }
    </style>
  </head>
  <body>
  	<%
  		String username="sign in";
  		String city="your_city ";
  		int zip=000000;
  	
  	 	if((session!=null) && (session.getAttribute("email")!=null)){
	  		String email=(String)session.getAttribute("email");
	  		String headquery="SELECT name, city, zip FROM user WHERE email=?";
	  		
	  		Connection conn=MySqlConnect.getDBConnection();
	  		PreparedStatement headpstmt=conn.prepareStatement(headquery);
			headpstmt.setString(1,email);
			
	  		ResultSet headset=headpstmt.executeQuery();
	  		while(headset.next()){
	  			username=headset.getString("name");
	  			city=headset.getString("city");
	  			zip=headset.getInt("zip");
	  		}

  	 	}
  	
  	%>
  
  
    <div class="header container-fluid sticky-top">
      <div class="row justify-content-between">
        <div class="headi col-auto">
          <a href="index.jsp"
            ><img src="images/Carousel/Logo.png" width="120px" height="40px"
          /></a>
        </div>
        <div class="headi col-auto">
          <p>Delivering to</p>
           <%=city+" "+zip%>
        </div>

        <div class="col-5" id="searchbar">
          <form class="d-flex" role="search">
            <div class="input-group mb-3">
              <button
                class="btn btn-secondary dropdown-toggle"
                type="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                All
              </button>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <a class="dropdown-item" href="#">Something else here</a>
                </li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="#">Separated link</a></li>
              </ul>
              <input
                class="form-control"
                type="search"
                placeholder="Search"
                aria-label="Search with dropdown button"
              />
              <button class="btn btn-success" type="submit">Search</button>
            </div>
          </form>
        </div>

        <div class="col-auto">
          <button
            class="btn btn-secondary"
            type="button"
            aria-expanded="false"
            onclick="window.location.href='AddItems.jsp'"
          >
            <b>Sell</b>
          </button>
        </div>
        <div class="headi col-auto"><h5><a href="PlacedOrders.jsp">Returns & Orders</a></h5></div>
	    <div class="headi col-auto" id="cartIcon"><a href="Cart.jsp"><i style="font-size: 30px" class="fa">&#xf07a;</i></a></div>
	    

		
      </div>
    </div>

    <!-- this is second line ////////////////////////////////////////////////////////-->

    <div
      class="d-flex flex-row"
      style="z-index: 0; background-color: rgb(55, 50, 67)"
    >
      <div class="p-2">
        <button class="navbar-toggler" type="button" onclick="openNav()">
          <i style="font-size: 24px" class="fa">&#xf039;</i>
        </button>
      </div>
      <div class="p-2">Fresh</div>
      <div class="p-2">Amazon mini tv</div>
      <div class="p-2">Sell</div>
      <div class="p-2">Best seller</div>
      <div class="p-2">Today's deal</div>
      <div class="p-2">Mobiles</div>
      <div class="p-2">Customer service</div>
      <div class="p-2">Electronic</div>
      <div class="p-2">Amazon pay</div>
      <div class="p-2">Fasion</div>
      <div class="p-2">prime</div>
      <div class="p-2">New release</div>
      <div class="p-2">Home and Kitchen</div>
    </div>

    <div id="mySidenav" class="sidenav">
      <h1>Hello,<%=username%></h1>
      <div class="d-flex flex-column">
      	<a href="Profile.jsp"><b>Profile</b></a>
        <a href="PlacedOrders.jsp"><b>Orders</b></a>
        <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"><b>Log Out</b></a>
      	<hr />
        <h2>Trending</h2>
        <a href="NotAvailable.jsp">Best Seller</a>
        <a href="NotAvailable.jsp">New Release</a>
        <a href="NotAvailable.jsp">Movers and Shakers</a>
        <hr />
        <h2>Digital Devices</h2>
        <a href="NotAvailable.jsp">Fire TV</a>
        <a href="NotAvailable.jsp">Echo & Alexa</a>
        <a href="NotAvailable.jsp">Kindle</a>
        <a href="NotAvailable.jsp">Audible</a>
        <a href="NotAvailable.jsp">Amazon Prime Video</a>
        <a href="NotAvailable.jsp">Amazon Prime Music</a>
      </div>
    </div>

    <a
      href="javascript:void(0)"
      id="CLOSE"
      class="closebtn"
      onclick="closeNav()"
      >&times;
      </a>
      
      
      
      
      
      

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Log Out</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       Do You want to Logout
       Click on Logout text
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="logoutBtn"><a href="LogOutServlet">Logout</a></button>
      </div>
    </div>
  </div>
</div>
      
      
      
      
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>

    <script>
      function openNav() {
        document.getElementById("mySidenav").style.left = "0px";
        document.getElementsByClassName("closebtn")[0].style.left = "370px";
      }

      /* Set the width of the side navigation to 0 */
      function closeNav() {
        document.getElementById("mySidenav").style.left = "-370px";
        document.getElementsByClassName("closebtn")[0].style.left = "-40px";
      }
      
      
  
      
    </script>
  </body>
</html>
