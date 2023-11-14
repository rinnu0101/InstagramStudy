package com.portfolio.myfirst.Mapper;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StoryPhotoVO {
	private int story_photo_idx;
	private int story_idx;
	private String file_name;
	private String file_path;
	private MultipartFile uploadFiles;
}
 