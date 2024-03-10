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
		System.out.println("���� ����");
		return LoginDAO.getLoginInfo(vo);
	}
	
	//ȸ������ ���� �����ϱ�
	@Override
	public String setJoinInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		String result = "";
		
		// ȸ������ �ߺ�Ȯ��
		UserInfoVO chkID = LoginDAO.getIdDuplCheck(vo);
		UserInfoVO chkNN = LoginDAO.getNicknameDuplCheck(vo);
		if((chkID == null) && (chkNN == null))
		{
			// ȸ������ insert
			LoginDAO.setJoinInfo(vo);
			result = "JOIN_OK";
		}
		else
		{
			result = "JOIN_FAIL";
		}
				
		return result;
	}
	
	//ID �ߺ� üũ
	@Override
	public String getIdDuplCheck(UserInfoVO vo) {
		// TODO Auto-generated method stub
		String result = "";

		// ID �ߺ�Ȯ��
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
	
	//�г��� �ߺ� üũ
	@Override
	public String getNicknameDuplCheck(UserInfoVO vo) {
		// TODO Auto-generated method stub
		String result = "";

		// �г��� �ߺ�Ȯ��
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
	
	//��й�ȣ ã��
	@Override
	public UserInfoVO getFindPwInfo(UserInfoVO vo) {
		// TODO Auto-generated method stub
		return LoginDAO.getFindPwInfo(vo);
	}

}
