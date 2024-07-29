package package1;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class AddingItemServlet extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		
		System.out.print("its working");
		Part file=request.getPart("itemImage");
		
		String fileName=file.getSubmittedFileName();
		System.out.println("filename:"+fileName);
		
		
		String filePath="C:/Users/yj261/MavenProjects/ShoppingSite/ShoppingWeb/src/main/webapp/images/"+fileName;
		System.out.println("filepath:"+filePath);
		FileOutputStream fos=new FileOutputStream(filePath);
		InputStream is=file.getInputStream();
		
		try {
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		Connection conn=MySqlConnect.getDBConnection();
		
		System.out.print("\n\n1\n\n");
				
		String name=request.getParameter("itemName");
		String info=request.getParameter("itemInfo");
		int category=Integer.parseInt(request.getParameter("itemCategory"));
		String category2=request.getParameter("itemCategory");
		int price=Integer.parseInt(request.getParameter("itemPrice"));
		
		System.out.print("\n\n2\n\n");
		
		String insert="insert into items(iname,iinfo,icategory,icategory2,image,iprice,iseller) values(?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement stat=conn.prepareStatement(insert);
			
			
			System.out.print("\n\n3\n\n");
			
			stat.setString(1,name);
			stat.setString(2,info);
			stat.setInt(3,category);
			stat.setString(4,category2);
			stat.setString(5,fileName);
			stat.setInt(6, price);
			stat.setString(7,email);
			
			int a=stat.executeUpdate();
			
			System.out.print("\n\n4\n\n");
			
			
			if(a>0) {
				System.out.println("item added");
				request.setAttribute("a","done");
				
			}
			else {
				System.out.println("item not added");
				request.setAttribute("a","fail");
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("Confirmation.jsp");
			rd.forward(request, response);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		

	}

}

