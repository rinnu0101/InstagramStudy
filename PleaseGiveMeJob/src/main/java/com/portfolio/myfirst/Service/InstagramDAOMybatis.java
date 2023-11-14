package com.portfolio.myfirst.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.myfirst.Mapper.FeedListVO;
import com.portfolio.myfirst.Mapper.InstagramVO;
import com.portfolio.myfirst.Mapper.StoryListVO;
import com.portfolio.myfirst.Mapper.StoryPhotoVO;
import com.portfolio.myfirst.Mapper.StoryVO;
import com.portfolio.myfirst.Mapper.UserInfoVO;

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
}
