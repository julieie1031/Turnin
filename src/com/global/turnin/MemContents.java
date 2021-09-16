package com.global.turnin;

public class MemContents {

	private Integer num;
	private String contents;
	private String checkbox;
	private String picName;
	private String regDate;
	private String userId;


	public MemContents() {

	}
	public MemContents(Integer num, String contents, String checkbox, String picName, String regDate, String userId) {
		this.num = num;
		this.contents = contents;
		this.checkbox = checkbox;
		this.picName = picName;
		this.regDate = regDate;
		this.userId = userId;
	}
	public MemContents(String contents) {
		super();
		this.contents = contents;

	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}



}
