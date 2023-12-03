package com.portfolio.myfirst.Mapper;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FollowVO {
	private int follow_idx;
	private int following_user_idx;
	private int follower_user_idx;
	private String follow_yn;
	
	//JOIN
	//USER_INFO
	private int user_idx;
	private String user_nickname;
	
	//USER_PHOTO
	private String file_name;
}
 