package com.portfolio.myfirst.Mapper;

public class StoryVO {
	private int idx;
	private String content;	
	private String img_path;
	private int user_idx;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getImg_path() {
		return this.img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
}
 