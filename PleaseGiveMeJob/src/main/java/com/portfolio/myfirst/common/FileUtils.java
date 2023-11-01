package com.portfolio.myfirst.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.portfolio.myfirst.Mapper.FeedPhotoVO;

public class FileUtils {
	public List<FeedPhotoVO> parseFileInfo(int seq, HttpServletRequest request, 
			MultipartHttpServletRequest mhsr) throws IOException {
		if(ObjectUtils.isEmpty(mhsr)) {
			return null;
		}
		
		List<FeedPhotoVO> fileList = new ArrayList<FeedPhotoVO>();
		
		//������ ���� ��� ���
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "/upload/";
		
		//�� ����� ������ ������ ���� ����
		File file = new File(root_path + attach_path);
		if(file.exists() == false) {
			file.mkdir();
		}
		
		//���� �̸����� iterator�� ����
		Iterator<String> iterator = mhsr.getFileNames();
		
		while(iterator.hasNext()) {
			//���ϸ����� ���� ����Ʈ ��������
			List<MultipartFile> list = mhsr.getFiles(iterator.next());
			
			//���� ����Ʈ ���� ��ŭ ������ ���� ����Ʈ�� ����ְ� ����
			for(MultipartFile mf : list) {
				FeedPhotoVO boardFile = new FeedPhotoVO();
				boardFile.setFile_name(mf.getOriginalFilename());
				boardFile.setFile_path(root_path + attach_path);
				fileList.add(boardFile);
				
				file = new File(root_path + attach_path + mf.getOriginalFilename());
				mf.transferTo(file);
			}
		}
		return fileList;
	}
}
