package package1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		String query="select(password) from user where email=?";
		Connection conn=MySqlConnect.getDBConnection();
		

		PrintWriter out=response.getWriter();
		
		try(PreparedStatement pstmt=conn.prepareStatement(query)){
				pstmt.setString(1,email);
		
				try(ResultSet set=pstmt.executeQuery()){
					if(set.next()){
						String passwordReal=set.getString("password");
						if(password.equals(passwordReal)) {
							HttpSession session=request.getSession();
							session.setAttribute("email",email);
							response.sendRedirect("index.jsp");
						}
						else {
							out.print("<div class='alert alert-danger' role='alert'>"
									+"Wrong password"
									+"</div>");
							
							RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
							rd.include(request, response);
						}
					}
					else {
						out.print("<div class='alert alert-danger' role='alert'>"
								+"Wrong Email id"
								+"</div>");
						
						RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
						rd.include(request, response);
					}
				}
		}
		catch(SQLException e) {
		    e.printStackTrace();
		}
	}

}
