package com.global.turnin;

public class Member {

	private String userId;
	private String email;
	private String userpwd;
	
	public Member() {
		
	}
	public Member(String userId, String email, String userpwd) {
		this.userId = userId;
		this.email = email;
		this.userpwd = userpwd;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

}