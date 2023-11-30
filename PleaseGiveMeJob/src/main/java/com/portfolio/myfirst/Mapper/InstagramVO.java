package com.portfolio.myfirst.Mapper;

import lombok.Data;

@Data
public class InstagramVO {
	private int idx;
	private String content;	
	private String type;
	private String img_path;
	
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
}
 