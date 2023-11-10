package com.portfolio.myfirst.Mapper;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FeedListVO {
	private int feed_idx;
	private int user_idx;
	private String feed_contents;
}
 