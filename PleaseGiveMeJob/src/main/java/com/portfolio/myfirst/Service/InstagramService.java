package com.portfolio.myfirst.Service;

import java.util.List;

import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;

public interface InstagramService {
	//�ν�Ÿ ���丮 ��������
	public List<UserInfoVO> getStoryList(UserInfoVO vo);
	public List<StoryVO> getStory(StoryVO vo);
	public void setViewStory(StoryVO vo);
	
	//�� �ǵ� �����ϱ�
	public void setSaveNewFeed(FeedListVO vo);
}
