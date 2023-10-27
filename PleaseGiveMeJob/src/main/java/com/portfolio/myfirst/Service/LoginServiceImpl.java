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
		System.out.println("���� ����");
		return LoginDAO.getLoginInfo(vo);
	}
	
	@Override
	public String setJoinInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		String result = "";
		
		// ID �ߺ�Ȯ��
		UserInfoVO chk = LoginDAO.getUserDuplCheck(vo);
		if(chk == null)
		{
			// ȸ������ insert
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
