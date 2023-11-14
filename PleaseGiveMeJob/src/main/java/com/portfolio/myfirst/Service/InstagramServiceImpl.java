package com.portfolio.myfirst.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryListVO;
import com.portfolio.myfirst.Mapper.StoryPhotoVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;

@Service("InstagramService")
public class InstagramServiceImpl implements InstagramService{
	@Autowired
	private InstagramDAOMybatis InstagramDAO;

	//인스타 스토리 가져오기
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
	
	//새 피드 저장하기
	public void setSaveNewFeed(FeedListVO vo) {
		InstagramDAO.setSaveNewFeed(vo);		
	}
	
	//새 스토리 저장하기
	public void setSaveNewStory(StoryListVO vo) {
		InstagramDAO.setSaveNewStory(vo);		
	}

	@Override
	public int getNewStoryIdx(StoryListVO vo) {
		return InstagramDAO.getNewStoryIdx(vo);		
	}
	//새 스토리 이미지 파일 저장하기
	public void setSaveNewStoryFile(StoryPhotoVO vo) {
		InstagramDAO.setSaveNewStoryFile(vo);		
	}
}
