package com.portfolio.myfirst.Service;

import java.util.List;

import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;

public interface InstagramService {
	//인스타 스토리 가져오기
	public List<UserInfoVO> getStoryList(UserInfoVO vo);
	public List<StoryVO> getStory(StoryVO vo);
	public void setViewStory(StoryVO vo);
	
	//새 피드 저장하기
	public void setSaveNewFeed(FeedListVO vo);
}
