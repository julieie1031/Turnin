package com.global.turnin;

public class addlist {


	private Integer num;
	private String userId;
	private String contents;
	private String regDate;
	private String checkbox;
	private String picName;

	public addlist() {

	}
	public addlist(Integer num, String userId, String contents) {
		super();
		this.num = num;
		this.userId = userId;
		this.contents = contents;
	}

	public addlist(String userId) {
		super();

		this.userId = userId;

	}
	public addlist(Integer num, String userId, String contents, String regDate, String checkbox, String picName) {
		this.num = num;
		this.userId = userId;
		this.contents = contents;
		this.regDate = regDate;
		this.checkbox = checkbox;
		this.picName = picName;
	}
	
	public addlist(String userId, String contents, String regDate, String checkbox, String picName) {
		super();
		this.userId = userId;
		this.contents = contents;
		this.regDate = regDate;
		this.checkbox = checkbox;
		this.picName = picName;
	}


	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}

	public String getPicName() {
		return picName;
	}

	public void setPicName(String picName) {
		this.picName = picName;
	}

}