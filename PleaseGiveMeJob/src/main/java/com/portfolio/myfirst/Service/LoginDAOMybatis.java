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
public class LoginDAOMybatis extends SqlSessionDaoSupport {
	@Autowired
	//Spring 컨테이너이가 자동으로 메소드를 호출해주고
	//applicationContext파일에 등록된 SqlSessionFactoryBean 객체를  인자로 받아서 메소드를 실행
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	
	public UserInfoVO getLoginInfo(UserInfoVO vo) {
		System.out.println("DAO 시작");
		return getSqlSession().selectOne("LoginDAO.getLoginInfo", vo);		
	}
	
	public void setJoinInfo(UserInfoVO vo) {
		getSqlSession().insert("LoginDAO.setJoinInfo", vo);		
	}
	public UserInfoVO getIdDuplCheck(UserInfoVO vo) {
		return getSqlSession().selectOne("LoginDAO.getIdDuplCheck", vo);		
	}
	public UserInfoVO getNicknameDuplCheck(UserInfoVO vo) {
		return getSqlSession().selectOne("LoginDAO.getNicknameDuplCheck", vo);		
	}
	
	
	public UserInfoVO getFindPwInfo(UserInfoVO vo) {
		return getSqlSession().selectOne("LoginDAO.getFindPwInfo", vo);		
	}
	
}
