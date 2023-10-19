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
public class LoginController {
	
	@Autowired
	InstagramService Service;
	
	@RequestMapping(value="/setJoinInfo.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String setJoinInfo(UserInfoVO vo) throws JsonProcessingException {
	//�ڹٿ��� JSON ��ü�� ��ȯ���ִ� ���̺귯��
		
		return "";
	}
}
