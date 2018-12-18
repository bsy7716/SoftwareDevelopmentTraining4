package memberDTO;

public class Member {
	
	protected String userId;
	protected String userPassword;
	protected String userName;
	protected String userSex;
	protected int userBirthday;
	protected String userAddress;
	protected int userPhoneNumber;
	protected String userEmail;
	
	public String getUserId() {
		return userId;
	}
	public Member setUserId(String userId) {
		this.userId = userId;
		return this;
	}
	
	public String getUserPassword() {
		return userPassword;
	}
	public Member setUserPassword(String userPassword) {
		this.userPassword = userPassword;
		return this;
	}
	
	public String getUserName() {
		return userName;
	}
	public Member setUserName(String userName) {
		this.userName = userName;
		return this;
	}
	
	public String getUserSex() {
		return userSex;
	}
	public Member setUserSex(String userSex) {
		this.userSex = userSex;
		return this;
	}
	
	public int getUserBirthday() {
		return userBirthday;
	}
	public Member setUserBirthday(int userBirthday) {
		this.userBirthday = userBirthday;
		return this;
	}
	
	public String getUserAddress() {
		return userAddress;
	}
	public Member setUserAddress(String userAddress) {
		this.userAddress = userAddress;
		return this;
	}
	
	public int getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public Member setUserPhoneNumber(int userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
		return this;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public Member setUserEmail(String userEmail) {
		this.userEmail = userEmail;
		return this;
	}
}
