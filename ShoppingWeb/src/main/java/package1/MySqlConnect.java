package package1;
import java.sql.*;

public class MySqlConnect {
	private static Connection conn=null;
	public static Connection getDBConnection() {
		// TODO Auto-generated method stub
		System.out.println("\n\n1\n\n");
		if(conn==null) {
			String url="jdbc:mysql://localhost:3306/shoppingsite2";
			String user="root";
			String password="";

			System.out.println("\n\n2\n\n");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection(url,user,password);

				System.out.println("\n\n3\n\n");
				if(conn.isClosed()) {
					System.out.println("\n\nConnection is not done\n\n");
				}
				else {
					System.out.println("\n\nConnected\n\n");
				}
				
			}
			catch(ClassNotFoundException | SQLException e) {

				System.out.println("\n\n5\n\n");
				e.printStackTrace();
				System.out.println("\n\nError is here in  MySqlConnect\n\n");
			}
		}
		return conn;
	}

}
