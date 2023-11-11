package com.portfolio.myfirst.Mapper;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StoryListVO {
	private int story_idx;
	private int user_idx;
	private String use_yn;
}
 