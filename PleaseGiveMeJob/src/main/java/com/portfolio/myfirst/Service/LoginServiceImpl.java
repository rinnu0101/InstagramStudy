package com.portfolio.myfirst.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDAOMybatis LoginDAO;
	
	@Override
	public UserInfoVO getLoginInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		System.out.println("서비스 시작");
		return LoginDAO.getLoginInfo(vo);
	}
	
	@Override
	public String setJoinInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		String result = "";
		
		// ID 중복확인
		UserInfoVO chk = LoginDAO.getUserDuplCheck(vo);
		if(chk == null)
		{
			// 회원가입 insert
			LoginDAO.setJoinInfo(vo);
			result = "OK";
		}
		else {
			result = "FAIL";
		}
		
		return result;
	}
	
	@Override
	public UserInfoVO getFindPwInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		return LoginDAO.getFindPwInfo(vo);
	}

}
