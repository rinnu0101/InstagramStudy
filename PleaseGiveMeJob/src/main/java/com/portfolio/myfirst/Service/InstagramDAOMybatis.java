package com.portfolio.myfirst.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.myfirst.Mapper.InstagramVO;
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

	public List<UserInfoVO> getStoryList(UserInfoVO vo) {
		return getSqlSession().selectList("InstagramDAO.getStoryList", vo);
	}
	public List<StoryVO> getStory(StoryVO vo) {
		return getSqlSession().selectList("InstagramDAO.getStory", vo);
	}
	public void setViewStory(StoryVO vo) {
		getSqlSession().insert("InstagramDAO.setViewStory", vo);
	}
}
