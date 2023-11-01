package com.portfolio.myfirst.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.portfolio.myfirst.Mapper.FeedPhotoVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;
import com.portfolio.myfirst.Service.InstagramService;
import com.portfolio.myfirst.Service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService Service;
	
	@RequestMapping(value="/setJoinInfo.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String setJoinInfo(UserInfoVO vo) throws JsonProcessingException {
	//자바에서 JSON 객체로 변환해주는 라이브러리
		return Service.setJoinInfo(vo);
	}
	@RequestMapping(value="/getIdDuplCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getIdDuplCheck(UserInfoVO vo) throws JsonProcessingException {
		//자바에서 JSON 객체로 변환해주는 라이브러리
			return Service.getIdDuplCheck(vo);
	}
	@RequestMapping(value="/getNicknameDuplCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getNicknameDuplCheck(UserInfoVO vo) throws JsonProcessingException {
		//자바에서 JSON 객체로 변환해주는 라이브러리
			return Service.getNicknameDuplCheck(vo);
	}
	
	@RequestMapping(value="/getLoginInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public UserInfoVO getLoginInfo(UserInfoVO vo) throws JsonProcessingException {
		//System.out.println(vo.getUser_id());
		//System.out.println(vo.getUser_pw());
		System.out.println("컨트롤러 시작");
		UserInfoVO result = Service.getLoginInfo(vo);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/getFindPwInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public UserInfoVO getFindPwInfo(UserInfoVO vo) throws JsonProcessingException {
		UserInfoVO result = Service.getFindPwInfo(vo);
		System.out.println(result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/file-upload.do", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = "D:/uploads/";
					System.out.println(fileRoot);
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}
	
}
