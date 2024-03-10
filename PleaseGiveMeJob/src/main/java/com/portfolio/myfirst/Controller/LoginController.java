package com.portfolio.myfirst.Controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.portfolio.myfirst.Mapper.UserInfoVO;
import com.portfolio.myfirst.Service.LoginService;



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
		return Service.getIdDuplCheck(vo);
	}
	//닉네임 중복 체크
	@RequestMapping(value="/getNicknameDuplCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getNicknameDuplCheck(UserInfoVO vo) throws JsonProcessingException {
		return Service.getNicknameDuplCheck(vo);
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/getFindPwInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public UserInfoVO getFindPwInfo(UserInfoVO vo) throws JsonProcessingException {
		UserInfoVO result = Service.getFindPwInfo(vo);
		System.out.println(result);
		return result;
	}	

	//로그인 정보 가져오기
	@RequestMapping(value="/getLoginInfo.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public UserInfoVO getLoginInfo(UserInfoVO vo, HttpServletRequest request) throws JsonProcessingException {
		
		UserInfoVO result = Service.getLoginInfo(vo);
		//로그인한 유저 정보 가져와 세션에 저장
		if(result.getUser_id() != null)
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("user_id", result.getUser_id()); 
			session.setAttribute("user_idx", result.getUser_idx());
			session.setAttribute("user_name", result.getUser_name());
			session.setAttribute("user_nickname", result.getUser_nickname());
			session.setAttribute("user_intro", result.getUser_intro());
			if(result.getFile_name() == null)
			{
				session.setAttribute("file_name", "images\\profile_img\\profile.png");
			}
			else
			{
				session.setAttribute("file_name", "images\\profile_img\\" + result.getFile_name());
			}
		}
		System.out.println(result);
		return result;
	}	
}
