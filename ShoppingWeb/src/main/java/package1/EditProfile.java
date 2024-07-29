package package1;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.*;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("html/text");
	
		HttpSession session1=request.getSession();
		String preEmail=(String)session1.getAttribute("email");
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		String inputCity=request.getParameter("inputCity");
		String inputState=request.getParameter("inputState");
		int inputZip=Integer.parseInt(request.getParameter("inputZip"));
		
		Connection conn=MySqlConnect.getDBConnection();
		
		
		String query = "UPDATE user SET name=?, email=?, password=?, address=?, city=?, state=?, zip=? WHERE email=?";

		try {
			PreparedStatement pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			pstmt.setString(3, password);
			pstmt.setString(4,address);
			pstmt.setString(5,inputCity);
			pstmt.setString(6,inputState);
			pstmt.setInt(7, inputZip);
			pstmt.setString(8,preEmail);
			
			int a=pstmt.executeUpdate();
			
			if(a>0) {
				response.sendRedirect("Profile.jsp");
			}
			else {
				RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
				PrintWriter out=response.getWriter();
				out.print("<div class='alert alert-danger' role='alert'>"
						+ "Failed to UPDATE"
						+ "</div>");
				rd.include(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
