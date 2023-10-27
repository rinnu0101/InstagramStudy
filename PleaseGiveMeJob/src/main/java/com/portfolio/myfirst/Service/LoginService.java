package com.portfolio.myfirst.Service;

import java.util.List;

import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;

public interface LoginService {
	public UserInfoVO getLoginInfo(UserInfoVO vo);

	public String setJoinInfo(UserInfoVO vo);

	public UserInfoVO getFindPwInfo(UserInfoVO vo);
}
