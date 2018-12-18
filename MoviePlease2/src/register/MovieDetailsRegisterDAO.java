package register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MovieDetailsRegisterDAO {
	
	private Connection conn;
	
	public MovieDetailsRegisterDAO() {
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
	
	public int upload(String MovieName, String OpenDate, String MovieType, String Director, String Actor, String RunningTime, String AgeGrade, String Plot, String MovieTrailer, String PosterOne, String PosterTwo, String PosterThree) {
		String SQL = "INSERT INTO MOVIEDETAILS VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, MovieName);
			pstmt.setString(2, OpenDate);
			pstmt.setString(3, MovieType);
			pstmt.setString(4, Director);
			pstmt.setString(5, Actor);
			pstmt.setString(6, RunningTime);
			pstmt.setString(7, AgeGrade);
			pstmt.setString(8, Plot);
			pstmt.setString(9, MovieTrailer);
			pstmt.setString(10, PosterOne);
			pstmt.setString(11, PosterTwo);
			pstmt.setString(12, PosterThree);
			return pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

}
