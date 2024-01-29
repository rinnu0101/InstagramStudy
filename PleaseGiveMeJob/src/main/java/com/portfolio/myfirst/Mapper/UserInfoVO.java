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
	
	//프로필에서 팔로우 정보 가져오기 위해 추가
	private int session_user_idx;
	private int follower_user_idx;
	
	//프로필 이름&닉네임&패스워드 변경값 있는지 chk
	private String user_name_chg;
	private String user_nickname_chg;	
	private String user_pw_chg;
	
	//프로필 사진 파일명 가져오기
	private String file_name;	
	
	//프로필 상단 피드 갯수, 팔로우&팔로워 수 카운트
	private int feed_cnt;
	private int follow_cnt;
	private int follower_cnt;
}
 