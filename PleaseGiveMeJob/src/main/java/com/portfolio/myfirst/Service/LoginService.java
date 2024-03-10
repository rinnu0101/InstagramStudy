package com.portfolio.myfirst.Service;

import com.portfolio.myfirst.Mapper.UserInfoVO;

public interface LoginService {

	//
	public UserInfoVO getLoginInfo(UserInfoVO vo);

	//
	public String setJoinInfo(UserInfoVO vo);

	public UserInfoVO getFindPwInfo(UserInfoVO vo);

	public String getIdDuplCheck(UserInfoVO vo);

	public String getNicknameDuplCheck(UserInfoVO vo);
}
