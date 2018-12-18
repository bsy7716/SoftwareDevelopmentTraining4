package register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MovieRegisterDAO {
	
	private Connection conn;
	
	public MovieRegisterDAO() {
		try {
			String dbURL="jdbc:mysql://localhost/studydb?useSSL=false&serverTimezone=UTC";
			String dbID="study";
			String dbPassword="study";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(String MovieName, String Poster, String OpenDate) {
		String SQL = "INSERT INTO MOVIEINFO VALUES(?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, MovieName);
			pstmt.setString(2, Poster);
			pstmt.setString(3, OpenDate);
			return pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

}
