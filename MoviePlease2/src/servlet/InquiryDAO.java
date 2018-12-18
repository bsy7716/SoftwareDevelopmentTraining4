package servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.Inquiry;

public class InquiryDAO {
	private Connection connection;
	
	public void setConnection(Connection connection) {
		this.connection = connection;
	}
	
	public List<Inquiry> selectList() throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery("SELECT InquiryNo, InquiryTitle, UserName, UserEmail, InquiryDate, InquiryContent FROM INQUIRY");
			
			ArrayList<Inquiry> inquirys = new ArrayList<Inquiry>();
			
			while(rs.next()) {
				inquirys.add(new Inquiry()
						.setInquiryNo(rs.getInt("InquiryNo"))
						.setInquiryTitle(rs.getString("InquiryTitle"))
						.setUserName(rs.getString("UserName"))
						.setUserEmail(rs.getString("UserEmail"))
						.setInquiryDate(rs.getDate("InquiryDate"))
						.setInquiryContent(rs.getString("InquiryContent"))
				);
			}
			return inquirys;
		} catch (Exception e) {
			throw e;
		} finally {
			try {if(rs != null) rs.close();} catch(Exception e) {}
			try {if(stmt != null) stmt.close();} catch(Exception e) {}
		}
	}
	
	public int insert(Inquiry inquiry) throws Exception  {
	    PreparedStatement stmt = null;

	    try {
	      stmt = connection.prepareStatement(
	          "INSERT INTO INQUIRY(InquiryTitle,UserName,UserEmail,InquiryDate,InquiryContent)"
	              + " VALUES (?,?,?,NOW(),?)");
	      stmt.setString(1, inquiry.getInquiryTitle());
	      stmt.setString(2, inquiry.getUserName());
	      stmt.setString(3, inquiry.getUserEmail());
	      stmt.setString(4, inquiry.getInquiryContent());
	      return stmt.executeUpdate();

	    } catch (Exception e) {
	      throw e;

	    } finally {
	      try {if (stmt != null) stmt.close();} catch(Exception e) {}
	    }
	  }
	
	public int delete(int InquiryNo) throws Exception {  
	    Statement stmt = null;
	    try {
	      stmt = connection.createStatement();
	      return stmt.executeUpdate("DELETE FROM INQUIRY WHERE InquiryNo=" + InquiryNo);

	    } catch (Exception e) {
	      throw e;

	    } finally {
	      try {if (stmt != null) stmt.close();} catch(Exception e) {}
	    }
	  }
	
	public Inquiry selectOne(int InquiryNo) throws Exception { 
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	      stmt = connection.createStatement();
	      rs = stmt.executeQuery(
	          "SELECT InquiryNo,InquiryTitle,UserName,UserEmail,InquiryDate,InquiryContent FROM INQUIRY" + 
	              " WHERE InquiryNo=" + InquiryNo);    
	      if (rs.next()) {
	        return new Inquiry()
	        .setInquiryNo(rs.getInt("InquiryNo"))
	        .setInquiryTitle(rs.getString("InquiryTitle"))
	        .setUserName(rs.getString("UserName"))
	        .setUserEmail(rs.getString("UserEmail"))
	        .setInquiryDate(rs.getDate("InquiryDate"))
	        .setInquiryContent(rs.getString("InquiryContent"));

	      } else {
	        throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
	      }

	    } catch (Exception e) {
	      throw e;
	    } finally {
	      try {if (rs != null) rs.close();} catch(Exception e) {}
	      try {if (stmt != null) stmt.close();} catch(Exception e) {}
	    }
	  }
	
	public int update(Inquiry inquiry) throws Exception { 
	    PreparedStatement stmt = null;
	    try {
	      stmt = connection.prepareStatement(
	          "UPDATE INQUIRY SET InquiryTitle=?,UserName=?,UserEmail=?,InquiryDate=now(),InquiryContent=?"
	              + " WHERE InquiryNo=?");
	      stmt.setString(1, inquiry.getInquiryTitle());
	      stmt.setString(2, inquiry.getUserName());
	      stmt.setString(3, inquiry.getUserEmail());
	      stmt.setString(4, inquiry.getInquiryContent());
	      stmt.setInt(5, inquiry.getInquiryNo());
	      return stmt.executeUpdate();

	    } catch (Exception e) {
	      throw e;

	    } finally {
	      try {if (stmt != null) stmt.close();} catch(Exception e) {}
	    }
	  }

	public InquiryDAO() {
	}

}