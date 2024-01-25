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
import com.portfolio.myfirst.Mapper.FeedLikeVO;
import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.FeedPhotoVO;
import com.portfolio.myfirst.Mapper.FeedReplyVO;
import com.portfolio.myfirst.Mapper.FollowVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryListVO;
import com.portfolio.myfirst.Mapper.StoryPhotoVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;
import com.portfolio.myfirst.Mapper.UserPhotoVO;
import com.portfolio.myfirst.Service.InstagramService;

@Controller
public class InstagramController {
	
	@Autowired
	InstagramService Service;

	
	@RequestMapping(value="/instagram.do")
	public ModelAndView instagramLogin(ModelAndView mav) {
		mav.setViewName("/instagram/Login");
		return mav;
	}
	
	@RequestMapping(value="/join.do")
	public ModelAndView instagramJoin(ModelAndView mav) {		
		mav.setViewName("/instagram/Join");
		return mav;
	}
	
	@RequestMapping(value="/main.do")
	public ModelAndView instagramMain(ModelAndView mav, HttpSession session) {	
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());
		
		mav.setViewName("/instagram/Main");
		return mav;
	}
	
	@RequestMapping(value="/home.do")
	public ModelAndView instagramHome(ModelAndView mav) {		
		mav.setViewName("/instagram/Home");
		return mav;
	}
	
	@RequestMapping(value="/profile.do")
	public ModelAndView instagramProfile(ModelAndView mav, Integer user_idx) {		
		mav.setViewName("/instagram/Profile");
		mav.addObject("pUser_idx", user_idx == null ? "" : user_idx);
		return mav;
	}
	
	@RequestMapping(value="/profileChange.do")
	public ModelAndView profileChange(ModelAndView mav) {		
		mav.setViewName("/instagram/ProfileChange");
		return mav;
	}
	
	@RequestMapping(value="/findPW.do")
	public ModelAndView instagramFindPW(ModelAndView mav) {		
		mav.setViewName("/instagram/FindPW");
		return mav;
	}
	
	//�˻� ������ ��������
	@RequestMapping(value="/getSearchList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<UserInfoVO> getSearchList() {
		return Service.getSearchList();
	}
	
	
	//�� �Խù� ����
	/* 
	 * @RequestMapping(value="/setSaveNewFeed.do", produces =
	 * "application/text; charset=utf8")
	 * 
	 * @ResponseBody public String setSaveNewFeed(FeedListVO vo, HttpSession
	 * session) throws JsonProcessingException { //�ڹٿ��� JSON ��ü�� ��ȯ���ִ� ���̺귯�� int
	 * user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());
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
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());		
		vo.setUser_idx(user_idx);
		vo.setFeed_contents(feed_contents);
		Service.setSaveNewFeed(vo);
		int feed_idx = Service.getNewFeedIdx(vo);
		
		String fileRoot;
		try {
			// ������ ������ ź��.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = "C:\\mygit\\PleaseGiveMeJob\\src\\main\\webapp\\images\\feed_img\\";
					
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
	 * user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());
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
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());
		vo.setUser_idx(user_idx);
		Service.setSaveNewStory(vo);
		int story_idx = Service.getNewStoryIdx(vo);
		String fileRoot;
		try {
			// ������ ������ ź��.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file : multipartFile) {
					fileRoot = "C:\\mygit\\PleaseGiveMeJob\\src\\main\\webapp\\images\\story_img\\";
					
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
	
	//Ȩ ���丮 ����Ʈ ��������
	@RequestMapping(value="/getStoryList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<StoryListVO> getStoryList(StoryListVO vo) {
		return Service.getStoryList(vo);
	}
	
	//������ ���丮 �˾�
	@RequestMapping(value="/getStoryPopup.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<StoryListVO> getStoryPopup(StoryListVO vo) {
		return Service.getStoryPopup(vo);
	}
	
	//�ǵ� ���ƿ� ó��
	@RequestMapping(value="/setLikeClick.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String setLikeClick(FeedLikeVO vo, HttpSession session) throws JsonProcessingException {
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());		
		vo.setUser_idx(user_idx);
		Service.setLikeClick(vo);
		return "OK";
	}
	

	//Ȩ �ǵ� ����Ʈ ��������
	@RequestMapping(value="/getFeedList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<FeedListVO> getFeedList() {
		return Service.getFeedList();
	}
	
	//������ �ǵ� �˾�
	@RequestMapping(value="/getFeedPopup.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public FeedListVO getFeedPopup(FeedListVO vo) {
		return Service.getFeedPopup(vo);
	}
	
	//�ǵ� ��� ����
	@RequestMapping(value="/setFeedReply.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String setFeedReply(FeedReplyVO vo, HttpSession session) throws JsonProcessingException {
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());		
		vo.setUser_idx(user_idx);
		Service.setFeedReply(vo);
		return "OK";
	}
	
	//������ �ǵ� ����Ʈ ��������
	@RequestMapping(value="/getProfileFeedList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<FeedListVO> getProfileFeedList(FeedListVO vo, HttpSession session) {
		return Service.getProfileFeedList(vo);
	}
	
	//������ ��� �������� ��������
	@RequestMapping(value="/getProfileInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public UserInfoVO getProfileInfo(UserInfoVO vo, HttpSession session) {
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());		
		vo.setSession_user_idx(user_idx);
		return Service.getProfileInfo(vo);
	}
	
	//������ ���� ���� (&����)
	@ResponseBody
	@RequestMapping(value = "/setProfileInfo.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String setProfileInfo(
			@RequestParam("file") List<MultipartFile> fileList
			, @RequestParam("profile_img_chg") String profile_img_chg
			, @RequestParam("user_nickname_chg") String user_nickname_chg
			, @RequestParam("user_pw_chg") String user_pw_chg
			, @RequestParam("user_nickname") String user_nickname
			, @RequestParam("user_pw") String user_pw
			, HttpSession session
			, HttpServletRequest request)
	{
		String result = "OK";
		UserInfoVO vo = new UserInfoVO();
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());		
		vo.setUser_idx(user_idx);
		vo.setUser_nickname(user_nickname);
		vo.setUser_pw(user_pw);
		vo.setUser_nickname_chg(user_nickname_chg);
		vo.setUser_pw_chg(user_pw_chg);
		
		if("Y".equals(user_nickname_chg) || "Y".equals(user_pw_chg))
		{
			result = Service.setProfileInfo(vo);
			
			if("Y".equals(user_nickname_chg))
			{
				session.setAttribute("user_nickname", user_nickname);
			}
		}
		
		if("Y".equals(profile_img_chg))
		{
			String fileRoot;
			try {
				// ������ ������ ź��.
				if(fileList != null) {
					//fileList�� ù��° ���� file�� �Ҵ�
					MultipartFile file = fileList.get(0);
					
					fileRoot = "C:\\mygit\\PleaseGiveMeJob\\src\\main\\webapp\\images\\profile_img\\";
					
					String originalFileName = file.getOriginalFilename();	//�������� ���ϸ�
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
					String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��
	
					System.out.println(fileRoot + savedFileName);
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //���� ����
						
						//DB�� �������� �����ϱ�
						UserPhotoVO vo2 = new UserPhotoVO();
						vo2.setUser_idx(user_idx);
						vo2.setFile_name(savedFileName);
						Service.setProfileImgFile(vo2);
						session.setAttribute("file_name", "images\\profile_img\\" + savedFileName);
						
					} catch (Exception e) {
						//���ϻ���
						FileUtils.deleteQuietly(targetFile);	//����� ���� ���� ����
						e.printStackTrace();
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//�ȷο� ��� ����
	@RequestMapping(value="/setfollow.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String setfollow(FollowVO vo, HttpSession session) throws JsonProcessingException {
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());		
		vo.setFollower_user_idx(user_idx);
		Service.setfollow(vo);
		return "OK";
	}

	//�ȷ��� ����Ʈ ��������
	@RequestMapping(value="/getfollowing.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<FollowVO> getfollowing(FollowVO vo) {
		return Service.getfollowing(vo);
	}
	//�ȷο� ����Ʈ ��������
	@RequestMapping(value="/getfollower.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<FollowVO> getfollower(FollowVO vo) {
		return Service.getfollower(vo);
	}
	
	//���� ��õ ����Ʈ ��������
	@RequestMapping(value="/getRecommendList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public List<UserInfoVO> getRecommendList(UserInfoVO vo, HttpSession session) {
		int user_idx = Integer.parseInt(session.getAttribute("user_idx").toString());		
		vo.setUser_idx(user_idx);
		return Service.getRecommendList(vo);
	}
	
	//�ǵ� ����
	@RequestMapping(value="/deleteFeed.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteFeed(FeedListVO vo, HttpSession session) throws JsonProcessingException {
		Service.deleteFeed(vo);
		return "Feed Delete Confirm";
	}
	
	//���丮 ����
	@RequestMapping(value="/deleteStory.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteStory(StoryListVO vo, HttpSession session) throws JsonProcessingException {
		Service.deleteStory(vo);
		return "Story Delete Confirm";
	}
	
	//�ǵ� ��� ����
	@RequestMapping(value="/deleteReply.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteReply(FeedReplyVO vo, HttpSession session) throws JsonProcessingException {
		Service.deleteReply(vo);
		return "Feed Reply Delete Confirm";
	}
}
