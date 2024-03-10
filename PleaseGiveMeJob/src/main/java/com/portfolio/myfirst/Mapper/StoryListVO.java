package com.portfolio.myfirst.Mapper;

import lombok.Data;

@Data
public class StoryListVO {
	private int story_idx;
	private int user_idx;
	private String use_yn;
	
	//JOIN
	//STORY_PHOTO
	private String story_file_name; //�÷��� �ߺ����� story_ �߰�		
	
	//USER_INFO
	private String user_nickname;
	
	//USER_PHOTO
	private String file_name;
}
 