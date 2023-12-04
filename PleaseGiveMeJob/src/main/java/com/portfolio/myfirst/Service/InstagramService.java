package com.portfolio.myfirst.Service;

import java.util.List;

import com.portfolio.myfirst.Mapper.FeedLikeVO;
import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.FeedPhotoVO;
import com.portfolio.myfirst.Mapper.FeedReplyVO;
import com.portfolio.myfirst.Mapper.FollowVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryListVO;
import com.portfolio.myfirst.Mapper.StoryPhotoVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;
import com.portfolio.myfirst.Mapper.UserPhotoVO;

public interface InstagramService {
	//�ν�Ÿ ���丮 ��������
	public List<UserInfoVO> getStoryList(UserInfoVO vo);
	public List<StoryVO> getStory(StoryVO vo);
	public void setViewStory(StoryVO vo);
	
	//�� �ǵ� �����ϱ�
	public void setSaveNewFeed(FeedListVO vo);
	public int getNewFeedIdx(FeedListVO vo);
	
	//�� �ǵ� �̹��� ���� �����ϱ�
	public void setSaveNewFeedFile(FeedPhotoVO vo);
	
	//�� ���丮 �����ϱ�
	public void setSaveNewStory(StoryListVO vo);
	public int getNewStoryIdx(StoryListVO vo);
	
	//�� ���丮 �̹��� ���� �����ϱ�
	public void setSaveNewStoryFile(StoryPhotoVO vo);
	
	//Ȩ �ǵ� ����Ʈ ��������
	public List<FeedListVO> getFeedTemp();
	
	//������ Ȩ �ǵ� �˾�
	public FeedListVO getFeedPopup(FeedListVO vo);
	
	//�ǵ� ���ƿ� ó��
	public void setLikeClick(FeedLikeVO vo);
	
	//�ǵ� ��� ����
	public void setFeedReply(FeedReplyVO vo);
	
	//������ ���� ����(&����)
	public String setProfileInfo(UserInfoVO vo);
	
	//������ �̹��� ����
	public void setProfileImgFile(UserPhotoVO vo);
	
	//������ �ǵ� ����Ʈ �ҷ�����
	public List<FeedListVO> getProfileFeedList(FeedListVO vo);
	
	//������ ��� �������� ��������
	public List<UserInfoVO> getProfileInfo(UserInfoVO vo);
	
	//�ȷο� ��� ����
	public void setfollow(FollowVO vo);

	//�ȷ��� ����Ʈ ��������
	public List<FollowVO> getfollowing(FollowVO vo);
	//�ȷο� ����Ʈ ��������
	public List<FollowVO> getfollower(FollowVO vo);
	
}
