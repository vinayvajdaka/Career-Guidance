package in_sp_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_Connection {
public static Connection getconnection() {
	String path="jdbc:mysql://localhost:3306/CareerGuidanceDB";
	String user_name="root";
    String pass="Dreamyuga";	
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		}
	    try {
			 con=DriverManager.getConnection(path,user_name,pass);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	    return con;
		
	}
}
