package com.portfolio.myfirst.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class InstagramDAOMybatis extends SqlSessionDaoSupport {
	@Autowired
	//Spring �����̳��̰� �ڵ����� �޼ҵ带 ȣ�����ְ�
	//applicationContext���Ͽ� ��ϵ� SqlSessionFactoryBean ��ü��  ���ڷ� �޾Ƽ� �޼ҵ带 ����
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	//�ν�Ÿ ���丮 ��������
	public List<UserInfoVO> getStoryList(UserInfoVO vo) {
		return getSqlSession().selectList("InstagramDAO.getStoryList", vo);
	}
	public List<StoryVO> getStory(StoryVO vo) {
		return getSqlSession().selectList("InstagramDAO.getStory", vo);
	}
	public void setViewStory(StoryVO vo) {
		getSqlSession().insert("InstagramDAO.setViewStory", vo);
	}
	
	//�� �ǵ� �����ϱ�
	public void setSaveNewFeed(FeedListVO vo) {
		getSqlSession().insert("InstagramDAO.setSaveNewFeed", vo);		
	}
	public int getNewFeedIdx(FeedListVO vo) {
		return getSqlSession().selectOne("InstagramDAO.getNewFeedIdx", vo);		
	}
	
	//�� �ǵ� ���� �����ϱ�
	public void setSaveNewFeedFile(FeedPhotoVO vo) {
		getSqlSession().insert("InstagramDAO.setSaveNewFeedFile", vo);		
	}
	
	//�� ���丮 �����ϱ�
	public void setSaveNewStory(StoryListVO vo) {
		getSqlSession().insert("InstagramDAO.setSaveNewStory", vo);		
	}
	public int getNewStoryIdx(StoryListVO vo) {
		return getSqlSession().selectOne("InstagramDAO.getNewStoryIdx", vo);		
	}

	//�� ���丮 ���� �����ϱ�
	public void setSaveNewStoryFile(StoryPhotoVO vo) {
		getSqlSession().insert("InstagramDAO.setSaveNewStoryFile", vo);		
	}
	
	//Ȩ �ǵ� ����Ʈ ��������
	public List<FeedListVO> getFeedTemp() {
		return getSqlSession().selectList("InstagramDAO.getFeedTemp", null);		
	}
	
	//������ Ȩ �ǵ� �˾�
	public FeedListVO getFeedPopup(FeedListVO vo) {
		return getSqlSession().selectOne("InstagramDAO.getFeedPopup", vo);		
	}
	
	//�ǵ� ���ƿ� �߰�
	public void setInsertFeedLike(FeedLikeVO vo) {
		getSqlSession().insert("InstagramDAO.setInsertFeedLike", vo);
	}
	//�ǵ� ���ƿ� ����
	public void setDeleteFeedLike(FeedLikeVO vo) {
		getSqlSession().delete("InstagramDAO.setDeleteFeedLike", vo);
	}
	
	//�ǵ� ��� ����
	public void setFeedReply(FeedReplyVO vo) {
		getSqlSession().insert("InstagramDAO.setFeedReply", vo);
	}
	
	//������ �ǵ� ����Ʈ ��������
	public List<FeedListVO> getProfileFeedList(FeedListVO vo) {
		return getSqlSession().selectList("InstagramDAO.getProfileFeedList", vo);		
	}

	//������ ���� ����(&����)
	public void setProfileInfo(UserInfoVO vo) {
		getSqlSession().update("InstagramDAO.setProfileInfo", vo);
	}
	//������ �̹��� ����
	public void insertProfileImgFile(UserPhotoVO vo) {
		getSqlSession().insert("InstagramDAO.insertProfileImgFile", vo);		
	}
	//������ �̹��� ����
	public void updateProfileImgFile(UserPhotoVO vo) {
		getSqlSession().update("InstagramDAO.updateProfileImgFile", vo);		
	}
	//������ �̹��� ��ȸ
	public UserPhotoVO selectProfileImgFile(UserPhotoVO vo) {		
		return getSqlSession().selectOne("InstagramDAO.selectProfileImgFile", vo);
	}
	
	//�ȷο�
	public void setInsertFollow(FollowVO vo) {
		getSqlSession().insert("InstagramDAO.setInsertFollow", vo);
	}
	//���ȷο�
	public void setDeleteFollow(FollowVO vo) {
		getSqlSession().delete("InstagramDAO.setDeleteFollow", vo);
	}

	//�ȷ��� ����Ʈ ��������
	public List<FollowVO> getfollowing(FollowVO vo) {
		return getSqlSession().selectList("InstagramDAO.getfollowing", vo);
	}
	//�ȷο� ����Ʈ ��������
	public List<FollowVO> getfollower(FollowVO vo) {
		return getSqlSession().selectList("InstagramDAO.getfollower", vo);
	}
}
