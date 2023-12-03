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
	//Spring 컨테이너이가 자동으로 메소드를 호출해주고
	//applicationContext파일에 등록된 SqlSessionFactoryBean 객체를  인자로 받아서 메소드를 실행
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	//인스타 스토리 가져오기
	public List<UserInfoVO> getStoryList(UserInfoVO vo) {
		return getSqlSession().selectList("InstagramDAO.getStoryList", vo);
	}
	public List<StoryVO> getStory(StoryVO vo) {
		return getSqlSession().selectList("InstagramDAO.getStory", vo);
	}
	public void setViewStory(StoryVO vo) {
		getSqlSession().insert("InstagramDAO.setViewStory", vo);
	}
	
	//새 피드 저장하기
	public void setSaveNewFeed(FeedListVO vo) {
		getSqlSession().insert("InstagramDAO.setSaveNewFeed", vo);		
	}
	public int getNewFeedIdx(FeedListVO vo) {
		return getSqlSession().selectOne("InstagramDAO.getNewFeedIdx", vo);		
	}
	
	//새 피드 파일 저장하기
	public void setSaveNewFeedFile(FeedPhotoVO vo) {
		getSqlSession().insert("InstagramDAO.setSaveNewFeedFile", vo);		
	}
	
	//새 스토리 저장하기
	public void setSaveNewStory(StoryListVO vo) {
		getSqlSession().insert("InstagramDAO.setSaveNewStory", vo);		
	}
	public int getNewStoryIdx(StoryListVO vo) {
		return getSqlSession().selectOne("InstagramDAO.getNewStoryIdx", vo);		
	}

	//새 스토리 파일 저장하기
	public void setSaveNewStoryFile(StoryPhotoVO vo) {
		getSqlSession().insert("InstagramDAO.setSaveNewStoryFile", vo);		
	}
	
	//홈 피드 리스트 가져오기
	public List<FeedListVO> getFeedTemp() {
		return getSqlSession().selectList("InstagramDAO.getFeedTemp", null);		
	}
	
	//선택한 홈 피드 팝업
	public FeedListVO getFeedPopup(FeedListVO vo) {
		return getSqlSession().selectOne("InstagramDAO.getFeedPopup", vo);		
	}
	
	//피드 좋아요 추가
	public void setInsertFeedLike(FeedLikeVO vo) {
		getSqlSession().insert("InstagramDAO.setInsertFeedLike", vo);
	}
	//피드 좋아요 삭제
	public void setDeleteFeedLike(FeedLikeVO vo) {
		getSqlSession().delete("InstagramDAO.setDeleteFeedLike", vo);
	}
	
	//피드 댓글 저장
	public void setFeedReply(FeedReplyVO vo) {
		getSqlSession().insert("InstagramDAO.setFeedReply", vo);
	}
	
	//프로필 피드 리스트 가져오기
	public List<FeedListVO> getProfileFeedList(FeedListVO vo) {
		return getSqlSession().selectList("InstagramDAO.getProfileFeedList", vo);		
	}

	//프로필 정보 저장(&수정)
	public void setProfileInfo(UserInfoVO vo) {
		getSqlSession().update("InstagramDAO.setProfileInfo", vo);
	}
	//프로필 이미지 저장
	public void insertProfileImgFile(UserPhotoVO vo) {
		getSqlSession().insert("InstagramDAO.insertProfileImgFile", vo);		
	}
	//프로필 이미지 수정
	public void updateProfileImgFile(UserPhotoVO vo) {
		getSqlSession().update("InstagramDAO.updateProfileImgFile", vo);		
	}
	//프로필 이미지 조회
	public UserPhotoVO selectProfileImgFile(UserPhotoVO vo) {		
		return getSqlSession().selectOne("InstagramDAO.selectProfileImgFile", vo);
	}
	
	//팔로우
	public void setInsertFollow(FollowVO vo) {
		getSqlSession().insert("InstagramDAO.setInsertFollow", vo);
	}
	//언팔로우
	public void setDeleteFollow(FollowVO vo) {
		getSqlSession().delete("InstagramDAO.setDeleteFollow", vo);
	}

	//팔로잉 리스트 가져오기
	public List<FollowVO> getfollowing(FollowVO vo) {
		return getSqlSession().selectList("InstagramDAO.getfollowing", vo);
	}
	//팔로워 리스트 가져오기
	public List<FollowVO> getfollower(FollowVO vo) {
		return getSqlSession().selectList("InstagramDAO.getfollower", vo);
	}
}
