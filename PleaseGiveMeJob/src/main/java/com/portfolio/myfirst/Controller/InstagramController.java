package com.portfolio.myfirst.Controller;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.FeedPhotoVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryListVO;
import com.portfolio.myfirst.Mapper.StoryPhotoVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;
import com.portfolio.myfirst.Service.InstagramService;

@Controller
public class InstagramController {
	
	@Autowired
	InstagramService Service;
	
	@RequestMapping(value="/instagram.do")
	public ModelAndView instagramMain(ModelAndView mav) {		
		mav.setViewName("/instagram/Login");
		return mav;
	}
	
	@RequestMapping(value="/join.do")
	public ModelAndView instagramJoin(ModelAndView mav) {		
		mav.setViewName("/instagram/Join");
		return mav;
	}
	
	@RequestMapping(value="/home.do")
	public ModelAndView instagramHome(ModelAndView mav, HttpSession session) {	
		String loginUserId = (String) session.getAttribute("user_id");
		mav.setViewName("/instagram/Home");
		return mav;
	}
	
	@RequestMapping(value="/profile.do")
	public ModelAndView instagramProfile(ModelAndView mav) {		
		mav.setViewName("/instagram/Profile");
		return mav;
	}
	
	@RequestMapping(value="/findPW.do")
	public ModelAndView instagramFindPW(ModelAndView mav) {		
		mav.setViewName("/instagram/FindPW");
		return mav;
	}
	
	
	//�� �Խù� ����
	/* 
	 * @RequestMapping(value="/setSaveNewFeed.do", produces =
	 * "application/text; charset=utf8")
	 * 
	 * @ResponseBody public String setSaveNewFeed(FeedListVO vo, HttpSession
	 * session) throws JsonProcessingException { //�ڹٿ��� JSON ��ü�� ��ȯ���ִ� ���̺귯�� int
	 * user_idx = Integer.parseInt((String)session.getAttribute("user_idx"));
	 * vo.setUser_idx(user_idx); Service.setSaveNewFeed(vo); return "OK"; }
	 */
	@ResponseBody
	@RequestMapping(value = "/setSaveNewFeed.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String setSaveNewFeed(
			@RequestParam("feed_file") List<MultipartFile> multipartFile
			, @RequestParam("feed_contents") String feed_contents
			, HttpSession session
			, HttpServletRequest request)
	{
		FeedListVO vo = new FeedListVO();
		int user_idx = Integer.parseInt((String)session.getAttribute("user_idx"));		
		vo.setUser_idx(user_idx);
		vo.setFeed_contents(feed_contents);
		Service.setSaveNewFeed(vo);
		int feed_idx = Service.getNewFeedIdx(vo);
		
		String fileRoot;
		try {
			// ������ ������ ź��.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = "D:\\uploads\\feed\\";
					
					String originalFileName = file.getOriginalFilename();	//�������� ���ϸ�
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
					String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��

					System.out.println(fileRoot + savedFileName);
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //���� ����
						
						//DB�� �������� �����ϱ�
						FeedPhotoVO vo2 = new FeedPhotoVO();
						vo2.setFeed_idx(feed_idx);
						vo2.setFile_name(savedFileName);
						Service.setSaveNewFeedFile(vo2);
						
					} catch (Exception e) {
						//���ϻ���
						FileUtils.deleteQuietly(targetFile);	//����� ���� ���� ����
						e.printStackTrace();
						break;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "OK";
	}
	
	//�� ���丮 ����
	/*
	 * @RequestMapping(value="/setSaveNewStory.do", produces =
	 * "application/text; charset=utf8")
	 * 
	 * @ResponseBody public String setSaveNewStory(StoryListVO vo, HttpSession
	 * session) throws JsonProcessingException { //�ڹٿ��� JSON ��ü�� ��ȯ���ִ� ���̺귯�� int
	 * user_idx = Integer.parseInt((String)session.getAttribute("user_idx"));
	 * vo.setUser_idx(user_idx); Service.setSaveNewStory(vo); return "OK"; }
	 */	
	@ResponseBody
	@RequestMapping(value = "/setSaveNewStory.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String setSaveNewStory(
			@RequestParam("story_file") List<MultipartFile> multipartFile
			, HttpSession session
			, HttpServletRequest request)
	{
		StoryListVO vo = new StoryListVO();
		int user_idx = Integer.parseInt((String)session.getAttribute("user_idx"));
		vo.setUser_idx(user_idx);
		Service.setSaveNewStory(vo);
		int story_idx = Service.getNewStoryIdx(vo);
		String fileRoot;
		try {
			// ������ ������ ź��.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file : multipartFile) {
					fileRoot = "D:\\uploads\\story\\";
					
					String originalFileName = file.getOriginalFilename();	//�������� ���ϸ�
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
					String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��

					System.out.println(fileRoot + savedFileName);
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //���� ����
						
						//DB�� �������� �����ϱ�
						StoryPhotoVO vo2 = new StoryPhotoVO();
						vo2.setStory_idx(story_idx);
						vo2.setFile_name(savedFileName);
						Service.setSaveNewStoryFile(vo2);
						
					} catch (Exception e) {
						//���ϻ���
						FileUtils.deleteQuietly(targetFile);	//����� ���� ���� ����
						e.printStackTrace();
						break;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "OK";
	}
	
	
	
	
	
	
	
	
	
	
	
	//���߿� ���پ���

	@RequestMapping(value="/getStoryList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getStoryList(UserInfoVO vo) throws JsonProcessingException {
		//�ڹٿ��� JSON ��ü�� ��ȯ���ִ� ���̺귯��
		List<UserInfoVO> story = Service.getStoryList(vo);
		
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("list", story); //null
		
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);
		return json;
	}

	@RequestMapping(value="/getStory.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getStory(StoryVO vo) throws JsonProcessingException {
		//�ڹٿ��� JSON ��ü�� ��ȯ���ִ� ���̺귯��
		List<StoryVO> story = Service.getStory(vo);
		Service.setViewStory(vo);
		
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("list", story); //null
		
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);
		return json;
	}
}
