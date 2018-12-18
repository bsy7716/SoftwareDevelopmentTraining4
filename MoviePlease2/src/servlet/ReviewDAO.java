package servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.Inquiry;
import vo.Review;

public class ReviewDAO {
	private Connection connection;
	
	public void setConnection(Connection connection) {
		this.connection = connection;
	}
	
	public List<Review> selectList() throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery("SELECT ReviewNo, ID, ReviewType, MovieName, ReviewTitle, ReviewContent, MovieScore, ReviewDate FROM REVIEW");
			
			ArrayList<Review> reviews = new ArrayList<Review>();
			
			while(rs.next()) {
				reviews.add(new Review()
						.setReviewNo(rs.getInt("ReviewNo"))
						.setID(rs.getString("ID"))
						.setReviewType(rs.getString("ReviewType"))
						.setMovieName(rs.getString("MovieName"))
						.setReviewTitle(rs.getString("ReviewTitle"))
						.setReviewContent(rs.getString("ReviewContent"))
						.setMovieScore(rs.getString("MovieScore"))
						.setReviewDate(rs.getDate("ReviewDate"))
				);
			}
			return reviews;
		} catch (Exception e) {
			throw e;
		} finally {
			try {if(rs != null) rs.close();} catch(Exception e) {}
			try {if(stmt != null) stmt.close();} catch(Exception e) {}
		}
	}
	
	public int register(Review review) throws Exception  {
	    PreparedStatement stmt = null;

	    try {
	      stmt = connection.prepareStatement(
	          "INSERT INTO REVIEW(ID,ReviewType,MovieName,ReviewTitle,ReviewContent,MovieScore,ReviewDate)"
	              + " VALUES (?,?,?,?,?,?,NOW())");
	      stmt.setString(1, review.getID());
	      stmt.setString(2, review.getReviewType());
	      stmt.setString(3, review.getMovieName());
	      stmt.setString(4, review.getReviewTitle());
	      stmt.setString(5, review.getReviewContent());
	      stmt.setString(6, review.getMovieScore());
	      return stmt.executeUpdate();

	    } catch (Exception e) {
	      throw e;

	    } finally {
	      try {if (stmt != null) stmt.close();} catch(Exception e) {}
	    }
	  }
	
	public int delete(int ReviewNo) throws Exception {  
	    Statement stmt = null;
	    try {
	      stmt = connection.createStatement();
	      return stmt.executeUpdate("DELETE FROM REVIEW WHERE ReviewNo=" + ReviewNo);

	    } catch (Exception e) {
	      throw e;

	    } finally {
	      try {if (stmt != null) stmt.close();} catch(Exception e) {}
	    }
	  }
	
	public Review selectOne(int ReviewNo) throws Exception { 
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	      stmt = connection.createStatement();
	      rs = stmt.executeQuery(
	          "SELECT ReviewNo,ID,ReviewType,MovieName,ReviewTitle,ReviewContent,MovieScore,ReviewDate FROM REVIEW" + 
	              " WHERE ReviewNo=" + ReviewNo);    
	      if (rs.next()) {
	        return new Review()
	        .setReviewNo(rs.getInt("ReviewNo"))
	        .setID(rs.getString("ID"))
	        .setReviewType(rs.getString("ReviewType"))
	        .setMovieName(rs.getString("MovieName"))
	        .setReviewTitle(rs.getString("ReviewTitle"))
	        .setReviewContent(rs.getString("ReviewContent"))
	        .setMovieScore(rs.getString("MovieScore"))
	        .setReviewDate(rs.getDate("ReviewDate"));

	      } else {
	        throw new Exception("�ش� ��ȣ�� ȸ���� ã�� �� �����ϴ�.");
	      }

	    } catch (Exception e) {
	      throw e;
	    } finally {
	      try {if (rs != null) rs.close();} catch(Exception e) {}
	      try {if (stmt != null) stmt.close();} catch(Exception e) {}
	    }
	  }
	
	public int update(Review review) throws Exception { 
	    PreparedStatement stmt = null;
	    try {
	      stmt = connection.prepareStatement(
	          "UPDATE REVIEW SET ID=?,ReviewType=?,MovieName=?,ReviewTitle=?,ReviewContent=?,MovieScore=?,ReviewDate=now()"
	              + " WHERE ReviewNo=?");
	      stmt.setString(1, review.getID());
	      stmt.setString(2, review.getReviewType());
	      stmt.setString(3, review.getMovieName());
	      stmt.setString(4, review.getReviewTitle());
	      stmt.setString(5, review.getReviewContent());
	      stmt.setString(6, review.getMovieScore());
	      stmt.setInt(7, review.getReviewNo());
	      return stmt.executeUpdate();

	    } catch (Exception e) {
	      throw e;

	    } finally {
	      try {if (stmt != null) stmt.close();} catch(Exception e) {}
	    }
	  }
	
	public ArrayList<Review> getList(String ReviewType, String searchType, String search) {

		if(ReviewType.equals("��ü")) {

			ReviewType = "";

		}

		ArrayList<Review> ReviewList = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		String SQL = "";

		try {

			if(searchType.equals("�ֽż�")) {

				SQL = "SELECT * FROM REVIEW WHERE ReviewType LIKE ? AND CONCAT(MovieName, ReviewType, ReviewTitle, ReviewContent) LIKE ? ORDER BY ReviewNo DESC LIMIT ";

			}

			pstmt = connection.prepareStatement(SQL);

			pstmt.setString(1, "%" + ReviewType + "%");

			pstmt.setString(2, "%" + search + "%");

			rs = pstmt.executeQuery();

			ReviewList = new ArrayList<Review>();

			while(rs.next()) {
				Review review = new Review()
						.setReviewNo(rs.getInt("ReviewNo"))
				        .setID(rs.getString("ID"))
				        .setReviewType(rs.getString("ReviewType"))
				        .setMovieName(rs.getString("MovieName"))
				        .setReviewTitle(rs.getString("ReviewTitle"))
				        .setReviewContent(rs.getString("ReviewContent"))
				        .setMovieScore(rs.getString("MovieScore"))
				        .setReviewDate(rs.getDate("ReviewDate"));
				ReviewList.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ReviewList;
	}

	public ReviewDAO() {
	}

}