package com.portfolio.myfirst.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

@Service("InstagramService")
public class InstagramServiceImpl implements InstagramService{
	@Autowired
	private InstagramDAOMybatis InstagramDAO;

	@Autowired
	private LoginDAOMybatis LoginDAO;

	//�ν�Ÿ ���丮 ��������
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
	
	//�� �ǵ� �����ϱ�
	public void setSaveNewFeed(FeedListVO vo) {
		InstagramDAO.setSaveNewFeed(vo);		
	}
	public int getNewFeedIdx(FeedListVO vo) {
		return InstagramDAO.getNewFeedIdx(vo);		
	}
	
	//�� �ǵ� �̹��� ���� �����ϱ�
	public void setSaveNewFeedFile(FeedPhotoVO vo) {
		InstagramDAO.setSaveNewFeedFile(vo);		
	}
	
	//�� ���丮 �����ϱ�
	public void setSaveNewStory(StoryListVO vo) {
		InstagramDAO.setSaveNewStory(vo);		
	}
	public int getNewStoryIdx(StoryListVO vo) {
		return InstagramDAO.getNewStoryIdx(vo);		
	}

	//�� ���丮 �̹��� ���� �����ϱ�
	public void setSaveNewStoryFile(StoryPhotoVO vo) {
		InstagramDAO.setSaveNewStoryFile(vo);		
	}
	
	//Ȩ �ǵ� ����Ʈ ��������
	public List<FeedListVO> getFeedTemp() {
		return InstagramDAO.getFeedTemp();		
	}
	
	//������ Ȩ �ǵ� �˾�
	public FeedListVO getFeedPopup(FeedListVO vo) {
		return InstagramDAO.getFeedPopup(vo);		
	}
	
	//�ǵ� ���ƿ� ó��
	public void setLikeClick(FeedLikeVO vo) {
		int type = vo.getLike_type();
		if(type != 1)
		{
			//���ƿ� �߰�
			InstagramDAO.setInsertFeedLike(vo);
		}
		else
		{
			//���ƿ� ����
			InstagramDAO.setDeleteFeedLike(vo);
		}
	}
	
	//�ǵ� ��� ����
	public void setFeedReply(FeedReplyVO vo) {
		InstagramDAO.setFeedReply(vo);		
	}
	
	//������ �ǵ� ����Ʈ ��������
	public List<FeedListVO> getProfileFeedList(FeedListVO vo) {
		return InstagramDAO.getProfileFeedList(vo);		
	}
	
	//������ ��� �������� ��������
	public List<UserInfoVO> getProfileInfo(UserInfoVO vo) {
		return InstagramDAO.getProfileInfo(vo);	
	}
	
	//������ ���� ����(&����)
	public String setProfileInfo(UserInfoVO vo) {
		
		String result = "OK";
		UserInfoVO check = new UserInfoVO();
		if("Y".equals(vo.getUser_nickname_chg())) {
			check = LoginDAO.getNicknameDuplCheck(vo);
		}
		
		if(check == null)
		{		
			InstagramDAO.setProfileInfo(vo);
		}
		else
		{
			result = "DUPL";
		}
		
		return result;
	}
	
	//������ �̹��� ����
	public void setProfileImgFile(UserPhotoVO vo) {
		UserPhotoVO result = InstagramDAO.selectProfileImgFile(vo);
		if(result != null) {
			InstagramDAO.updateProfileImgFile(vo);	
		}
		else {
			InstagramDAO.insertProfileImgFile(vo);	
		}
			
	}
	
	//�ǵ� ���ƿ� ó��
	public void setfollow(FollowVO vo) {
		String type = vo.getFollow_yn();
		if("Y".equals(type))
		{
			//�ȷο�
			InstagramDAO.setInsertFollow(vo);
		}
		else
		{
			//���ȷο�
			InstagramDAO.setDeleteFollow(vo);
		}
	}

	//�ȷ��� ����Ʈ(�ȷο�) ��������
	public List<FollowVO> getfollowing(FollowVO vo) {
		return InstagramDAO.getfollowing(vo);		
	}
	//�ȷο� ����Ʈ(�ȷο�) ��������
	public List<FollowVO> getfollower(FollowVO vo) {
		return InstagramDAO.getfollower(vo);		
	}
}
