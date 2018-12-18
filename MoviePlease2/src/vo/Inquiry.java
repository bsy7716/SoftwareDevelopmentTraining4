package vo;

import java.util.Date;

public class Inquiry {
	protected int InquiryNo;
	protected String InquiryTitle;
	protected String UserName;
	protected String UserEmail;
	protected Date InquiryDate;
	protected String InquiryContent;
	public int getInquiryNo() {
		return InquiryNo;
	}
	public Inquiry setInquiryNo(int inquiryNo) {
		this.InquiryNo = inquiryNo;
		return this;
	}
	public String getInquiryTitle() {
		return InquiryTitle;
	}
	public Inquiry setInquiryTitle(String inquiryTitle) {
		this.InquiryTitle = inquiryTitle;
		return this;
	}
	public String getUserName() {
		return UserName;
	}
	public Inquiry setUserName(String userName) {
		this.UserName = userName;
		return this;
	}
	public String getUserEmail() {
		return UserEmail;
	}
	public Inquiry setUserEmail(String userEmail) {
		this.UserEmail = userEmail;
		return this;
	}
	public Date getInquiryDate() {
		return InquiryDate;
	}
	public Inquiry setInquiryDate(Date inquiryDate) {
		this.InquiryDate = inquiryDate;
		return this;
	}
	public String getInquiryContent() {
		return InquiryContent;
	}
	public Inquiry setInquiryContent(String inquiryContent) {
		this.InquiryContent = inquiryContent;
		return this;
	}
	
	
}
