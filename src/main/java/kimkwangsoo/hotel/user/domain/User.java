package kimkwangsoo.hotel.user.domain;

import java.sql.Date;

public class User {
	private String userId;
	private String userName;
	private String userPwd;
	private String userEmail;
	private String userTel;
	private String userBirth;
	private String userAddr;
	private Date userReg;
	private String userClass;
	private char userStatus;
	
	public String getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getUserTel() {
		return userTel;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public Date getUserReg() {
		return userReg;
	}

	public void setUserRegDate(Date userReg) {
		this.userReg = userReg;
	}

	public char getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(char userStatus) {
		this.userStatus = userStatus;
	}

	public String getUserClass() {
		return userClass;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public void setUserClass(String userClass) {
		this.userClass = userClass;
	}

	@Override
	public String toString() {
		return userId;
	}
}
