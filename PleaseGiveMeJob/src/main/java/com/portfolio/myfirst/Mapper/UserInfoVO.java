package com.portfolio.myfirst.Mapper;

public class UserInfoVO {
	private int idx;
	private String user_name;	
	private String img_path;
	private String view_yn;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getImg_path() {
		return this.img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	
	public String getView_yn() {
		return this.view_yn;
	}
	public void setView_yn(String view_yn) {
		this.view_yn = view_yn;
	}
}
 