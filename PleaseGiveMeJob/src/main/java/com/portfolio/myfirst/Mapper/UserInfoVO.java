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
	
	//프로필 닉네임&패스워드 변경값 있는지 chk
	private String user_nickname_chg;	
	private String user_pw_chg;
	
	//프로필 사진 파일명 가져오기
	private String file_name;
}
 