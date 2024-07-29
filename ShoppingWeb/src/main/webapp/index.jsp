<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" errorPage="ErrorPage.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Index</title>
    <%@include file="Header.jsp" %>
    <style type="text/css">
      .card img {
        max-width: 100%; /* Ensure the image doesn't exceed the card width */
        height: 220px; /* Set the desired fixed height */
		object-fit: fill; /* Maintain the aspect ratio of the image */
      }

      .scrolling {
        margin: 20px 17px 20px 17px;
        /* padding:5px; */
        background-color: white;
      }

      .row::-webkit-scrollbar {
        display: none;
      }

      .scrolling-btns {
        font-weight: 900;
        font-size: xx-large;
        position: absolute;
        padding-top: 15px;
        top: 92%;
        transform: translateY(-50%);
        width: 40px;
        height: 70px;
        background-color: rgb(254, 253, 253);
        border-radius: 10%;
        border: 1px solid rgb(223, 222, 222);
        text-align: center;
        line-height: 30px;
        cursor: pointer;
        margin-left: 30px;
        margin-right: 30px;
        z-index: 900;
      }

      .scrolling-btns:hover {/* 
        background-color: rgba(255, 255, 255, 1); */
        background-color: black;
      }

      .scroll-left-btn {
        left: 0;
      }

      .scroll-right-btn {
        right: 0;
      }
      
      .fixed-height-image {
		   /* Preserve aspect ratio; cover the entire element */
		}
		
		.itemName{
			font-size:18px;
			font-weight:700;
		
		}
      
    </style>
  </head>
  <body>
    <div id="carouselExample" class="carousel slide">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="images/Carousel/carousel2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img
            src="images/Carousel/carousel1.jpg"
            class="d-block w-100"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="images/Carousel/carousel3.jpg"
            class="d-block w-100"
            alt="..."
          />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExample"
        data-bs-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExample"
        data-bs-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    
    
    
    
    
    
    <div class="scrolling">
      <div class="container pt-2">
        <div class="scrolling-btns scroll-left-btn" onclick="scrollLeft()">&#9665;</div>

        <h4><b>Top Deals</b></h4>
        
        <div class="row flex-nowrap overflow-auto" id="scroller1">
        <%
        Connection conn = MySqlConnect.getDBConnection();
        String query1 = "select *from items where icategory=1";
        Statement stmt1 = conn.createStatement();
        ResultSet set = stmt1.executeQuery(query1);

		
		while(set.next()) {
			int category=set.getInt("icategory");
			int id=set.getInt("id");
			String name=set.getString("iname");
			String image=set.getString("image");
			%>
		        	<div class="col-5 col-md-4 col-lg-3 p-2 bg-white" >
		          		<a href="itemDetail.jsp?id=<%=id%>">
		            	<div class="card bg-light">
			              <!-- Your item content here -->
			              <img
			                src="images/<%=image%>"
			                class="card-img-top img-fluid"
			                alt="Item <%=name%>"
			              />
			              <div class="card-body">
			                <p class="card-text itemName"><%=name%></p>
			              </div>
			            </div>
			            </a>
		            </div>
		
			<%
		}
        %>
	    </div>
        <div class="scrolling-btns scroll-right-btn" onclick="scrollRight()">&#9655;</div>
        
	    </div>
	    </div>
        
        
		
	  <div class="scrolling">
      <div class="container pt-2">
        <div class="scrolling-btns scroll-left-btn" onclick="scrollLeft()">&#9665;</div>

        <h4><b>Today's Special</b></h4>        
        <div class="row flex-nowrap overflow-auto" id="scroller2">
        
		<%
		String query2 = "select *from items where icategory=2";
        Statement stmt2 = conn.createStatement();
        ResultSet set2 = stmt2.executeQuery(query2);

		while(set2.next()) {
			int category=set2.getInt("icategory");
			int id=set2.getInt("id");
			String name=set2.getString("iname");
			String image=set2.getString("image");       	
				%>
			
		          <div class="col-5 col-md-4 col-lg-3 p-2 bg-white">
					<a href="itemDetail.jsp?id=<%=id%>">
			            <div class="card bg-light">
			              <!-- Your item content here -->
			              <img
			                src="images/<%=image%>"
			                class="card-img-top img-fluid"
			                alt="Item <%=name%>"
			              />
			              <div class="card-body">
			                <p class="card-text itemName" ><%=name%></p>
			              </div>
			            </div>
			       	</a>
		          </div>
			<%
		}
        %>
        </div>
        <div class="scrolling-btns scroll-right-btn" onclick="scrollRight()">&#9655;</div>
        
	    </div>
	    </div>
        
   
    
    
    


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous">
	</script>
    <script type="text/javascript">
    
	
    function scrollLeft() {
      document.getElementById("scroller1").scrollLeft += 150;
    }

    function scrollRight() {
      document.getElementById("scroller1").scrollLeft += 150;
    }
    
    
    
    </script>
    
  </body>
</html>
