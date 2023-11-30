package com.portfolio.myfirst.Mapper;
import lombok.Data;

@Data
public class UserInfoVO {
	private int user_idx;	
	private String user_id;	
	private String user_name;
	private String user_nickname;
	private String user_pw;	
	private String user_intro;	
	private String user_info;
	
	private String user_nickname_chg;	
	private String user_pw_chg;	
}
 