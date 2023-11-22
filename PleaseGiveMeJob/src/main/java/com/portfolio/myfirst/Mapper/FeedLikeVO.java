package com.portfolio.myfirst.Mapper;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FeedLikeVO {
	private int feed_idx;
	private int user_idx;
	private int like_type;
}
 