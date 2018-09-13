//20163623 王莉
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class DBUtil {
	
	    public static Connection getConnection() {
	    	
		     String dbDriver = "oracle.jdbc.driver.OracleDriver";
		    
		   String dbURL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		    
		    String dbUser = "scott";
		   
		   String dbPwd = "tiger";
		   
		     Connection con = null;
		    
		    Statement stat = null;
		    String sql = null;
		    ResultSet rs = null;
	        try {
	
	            Class.forName(dbDriver);
	            con = DriverManager.getConnection(dbURL, dbUser, dbPwd);
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	       
	        return con;

		
	}
	

	public static void close(Connection connection ) {
		try {
			if (connection != null) {
				connection.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement preparedStatement ) {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet resultSet ) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
