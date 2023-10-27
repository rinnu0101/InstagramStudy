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
	
	@RequestMapping(value="/getLoginInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public UserInfoVO getLoginInfo(UserInfoVO vo) throws JsonProcessingException {
		//자바에서 JSON 객체로 변환해주는 라이브러리
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
}
