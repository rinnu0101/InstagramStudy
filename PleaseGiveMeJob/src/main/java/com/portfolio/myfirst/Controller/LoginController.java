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

import javax.servlet.http.HttpSession;
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


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

	@Autowired
	LoginService Service;	
	
	//회원가입 정보 저장하기
	@RequestMapping(value="/setJoinInfo.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String setJoinInfo(UserInfoVO vo) throws JsonProcessingException {
	//자바에서 JSON 객체로 변환해주는 라이브러리
		return Service.setJoinInfo(vo);
	}
	//ID 중복 체크
	@RequestMapping(value="/getIdDuplCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getIdDuplCheck(UserInfoVO vo) throws JsonProcessingException {
		//자바에서 JSON 객체로 변환해주는 라이브러리
		return Service.getIdDuplCheck(vo);
	}
	//닉네임 중복 체크
	@RequestMapping(value="/getNicknameDuplCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getNicknameDuplCheck(UserInfoVO vo) throws JsonProcessingException {
		//자바에서 JSON 객체로 변환해주는 라이브러리
		return Service.getNicknameDuplCheck(vo);
	}

	//로그인 정보 가져오기
	@RequestMapping(value="/getLoginInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public UserInfoVO getLoginInfo(UserInfoVO vo, HttpServletRequest request) throws JsonProcessingException {
		//System.out.println(vo.getUser_id());
		//System.out.println(vo.getUser_pw());
		System.out.println("컨트롤러 시작");
		UserInfoVO result = Service.getLoginInfo(vo);
		
		if(result.getUser_id() != null)
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("user_id", result.getUser_id()); 
			session.setAttribute("user_idx", result.getUser_idx());
			session.setAttribute("user_name", result.getUser_name());
			session.setAttribute("user_nickname", result.getUser_nickname());
		}
		System.out.println(result);
		return result;
	}

	//비밀번호 찾기
	@RequestMapping(value="/getFindPwInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public UserInfoVO getFindPwInfo(UserInfoVO vo) throws JsonProcessingException {
		UserInfoVO result = Service.getFindPwInfo(vo);
		System.out.println(result);
		return result;
	}	
}
