package com.portfolio.myfirst.Mapper;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FeedReplyVO {
	private int feed_reply_idx;
	private int feed_idx;
	private int user_idx;
	private String feed_reply_contents;
	private int pidx;
}
 