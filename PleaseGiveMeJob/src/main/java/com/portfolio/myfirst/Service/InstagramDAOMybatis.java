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
}
