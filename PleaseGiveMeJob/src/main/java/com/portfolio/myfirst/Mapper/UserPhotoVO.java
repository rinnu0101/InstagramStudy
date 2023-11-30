package com.portfolio.myfirst.Mapper;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserPhotoVO {
	private int user_photo_idx;
	private int user_idx;
	private String file_name;
	private String file_path;
	private MultipartFile uploadFiles;
}
 