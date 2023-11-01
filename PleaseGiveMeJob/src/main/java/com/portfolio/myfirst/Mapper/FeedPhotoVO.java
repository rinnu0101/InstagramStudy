package com.portfolio.myfirst.Mapper;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FeedPhotoVO {
	private int feed_photo_idx;
	private int feed_idx;
	private String file_name;
	private String file_path;
	private MultipartFile uploadFiles;
}
 