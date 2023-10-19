package com.portfolio.myfirst.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.portfolio.myfirst.Mapper.InstagramVO;
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
	public ModelAndView instagramHome(ModelAndView mav) {		
		mav.setViewName("/instagram/Home");
		return mav;
	}
	
	@RequestMapping(value="/profile.do")
	public ModelAndView instagramProfile(ModelAndView mav) {		
		mav.setViewName("/instagram/Profile");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//나중에 갖다쓰기

	@RequestMapping(value="/getStoryList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getStoryList(UserInfoVO vo) throws JsonProcessingException {
		//자바에서 JSON 객체로 변환해주는 라이브러리
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
		//자바에서 JSON 객체로 변환해주는 라이브러리
		List<StoryVO> story = Service.getStory(vo);
		Service.setViewStory(vo);
		
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("list", story); //null
		
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(hashMap);
		return json;
	}
}
