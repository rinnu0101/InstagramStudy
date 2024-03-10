package com.portfolio.myfirst.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	//회원가입 정보 저장하기
	@Override
	public String setJoinInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		String result = "";
		
		// 회원정보 중복확인
		UserInfoVO chkID = LoginDAO.getIdDuplCheck(vo);
		UserInfoVO chkNN = LoginDAO.getNicknameDuplCheck(vo);
		if((chkID == null) && (chkNN == null))
		{
			// 회원가입 insert
			LoginDAO.setJoinInfo(vo);
			result = "JOIN_OK";
		}
		else
		{
			result = "JOIN_FAIL";
		}
				
		return result;
	}
	
	//ID 중복 체크
	@Override
	public String getIdDuplCheck(UserInfoVO vo) {
		// TODO Auto-generated method stub
		String result = "";

		// ID 중복확인
		UserInfoVO chkID = LoginDAO.getIdDuplCheck(vo);
		if(chkID == null)
		{
			result = "ID_OK";
		}
		else
		{
			result = "ID_FAIL";
		}
				
		return result;
	}
	
	//닉네임 중복 체크
	@Override
	public String getNicknameDuplCheck(UserInfoVO vo) {
		// TODO Auto-generated method stub
		String result = "";

		// 닉네임 중복확인
		UserInfoVO chkNN = LoginDAO.getNicknameDuplCheck(vo);
		if(chkNN == null)
		{
			result = "NN_OK";
		}
		else
		{
			result = "NN_FAIL";
		}
				
		return result;
	}
	
	//비밀번호 찾기
	@Override
	public UserInfoVO getFindPwInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		return LoginDAO.getFindPwInfo(vo);
	}

}
