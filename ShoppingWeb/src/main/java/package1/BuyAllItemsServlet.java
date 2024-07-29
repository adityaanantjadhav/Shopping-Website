package package1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class BuyAllItemsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyAllItemsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Connection conn=MySqlConnect.getDBConnection();
		if(session!=null && session.getAttribute("email")!=null) {
			String email=(String)session.getAttribute("email");
			
			 try {
			//Retrieving the itemid of items in cart of userid=email
			String query1="select itemid from cart where userid=?";
			PreparedStatement ptstmt1=conn.prepareStatement(query1);
			ptstmt1.setString(1,email);
			List<Integer> l=new ArrayList<>();
			ResultSet set1=ptstmt1.executeQuery();
			while(set1.next()) {
				l.add(set1.getInt("itemid"));
			}
			
			String query2="insert into orders(userid,itemid,purchase_date)values(?,?,?)";
			PreparedStatement ptstmt2=conn.prepareStatement(query2);
			
			LocalDate date1=LocalDate.now();
			Date date2=Date.valueOf(date1);
			ptstmt2.setDate(3,date2);
			ptstmt2.setString(1,email);
			
			for(int i:l) {
				ptstmt2.setInt(2,i);
				ptstmt2.addBatch();
			}
			
			int addB[]=ptstmt2.executeBatch();
			
			String clearCartQuery = "DELETE FROM cart WHERE userid=?";
            PreparedStatement clearCartStmt = conn.prepareStatement(clearCartQuery);
            clearCartStmt.setString(1, email);
            int rowsAffected = clearCartStmt.executeUpdate();
            
            if (rowsAffected > 0) {
				/* RequestDispatcher r=request.getRequestDispatcher("PlacedOrders.jsp"); */
                response.getWriter().write("<div class='alert alert-success' role='alert'>"
                		+ "Items Successfully added"
                		+ "</div>");
				/* r.include(request, response); */
            } else {
				/* RequestDispatcher r=request.getRequestDispatcher("Cart.jsp"); */
                response.getWriter().write("<div class='alert alert-warning' role='alert'>"
                		+ "Failed to add Items"
                		+ "</div>");
				/* r.include(request, response); */
            }
			
		}
		catch (SQLException e) {
             e.printStackTrace();
             response.getWriter().write("Database error. Please try again.");
         }
     } else {
         response.getWriter().write("User not logged in. Please log in.");
     }
	}	

}



/*CHATGPT CODE
 * 
 * // ... (existing imports)

@WebServlet("/BuyAllItemsServlet")
public class BuyAllItemsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = MySqlConnect.getDBConnection();
        
        if (session != null && session.getAttribute("email") != null) {
            String email = (String) session.getAttribute("email");
            
            try {
                // Retrieving the itemid of items in the cart of userid=email
                List<Integer> cartItemIds = getCartItemIds(conn, email);
                
                // Move items from cart to buy table
                moveItemsToBuyTable(conn, email, cartItemIds);

                // Clear the cart after buying all items
                clearCart(conn, email);

                response.getWriter().write("<div class='alert alert-success' role='alert'>"
                        + "Items Successfully bought"
                        + "</div>");
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("<div class='alert alert-danger' role='alert'>"
                        + "Failed to buy items. Please try again."
                        + "</div>");
            }
        } else {
            response.getWriter().write("<div class='alert alert-warning' role='alert'>"
                    + "User not logged in. Please log in."
                    + "</div>");
        }
    }

    private List<Integer> getCartItemIds(Connection conn, String email) throws SQLException {
        String query = "SELECT itemid FROM cart WHERE userid=?";
        try (PreparedStatement ptstmt = conn.prepareStatement(query)) {
            ptstmt.setString(1, email);
            ResultSet resultSet = ptstmt.executeQuery();
            
            List<Integer> itemIds = new ArrayList<>();
            while (resultSet.next()) {
                itemIds.add(resultSet.getInt("itemid"));
            }
            return itemIds;
        }
    }

    private void moveItemsToBuyTable(Connection conn, String email, List<Integer> itemIds) throws SQLException {
        String insertQuery = "INSERT INTO orders(userid, itemid, purchase_date) VALUES (?, ?, ?)";
        try (PreparedStatement ptstmt = conn.prepareStatement(insertQuery)) {
            LocalDate currentDate = LocalDate.now();
            Date currentDateSql = Date.valueOf(currentDate);

            ptstmt.setString(1, email);
            ptstmt.setDate(3, currentDateSql);

            for (int itemId : itemIds) {
                ptstmt.setInt(2, itemId);
                ptstmt.addBatch();
            }

            ptstmt.executeBatch();
        }
    }

    private void clearCart(Connection conn, String email) throws SQLException {
        String clearCartQuery = "DELETE FROM cart WHERE userid=?";
        try (PreparedStatement clearCartStmt = conn.prepareStatement(clearCartQuery)) {
            clearCartStmt.setString(1, email);
            clearCartStmt.executeUpdate();
        }
    }
}

 * 
 * 
 */
