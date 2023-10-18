package com.portfolio.myfirst.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;

@Service("InstagramService")
public class InstagramServiceImpl implements InstagramService{
	@Autowired
	private InstagramDAOMybatis InstagramDAO;

	public List<UserInfoVO> getStoryList(UserInfoVO vo) {
		return InstagramDAO.getStoryList(vo);
	}	
	public List<StoryVO> getStory(StoryVO vo) {
		return InstagramDAO.getStory(vo);
	}	
	public void setViewStory(StoryVO vo)
	{
		InstagramDAO.setViewStory(vo);
	}
}
