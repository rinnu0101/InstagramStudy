package com.portfolio.myfirst.Mapper;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FeedListVO {
	private int feed_idx;
	private int user_idx;
	private String feed_contents;
	private String regdate;
	
	//JOIN
	//FEED_PHOTO
	private String file_names;

	//USER_INFO
	private String user_nickname;
	
	//FEED_LIKE
	private String like_type; 
	private int like_count;
}
 