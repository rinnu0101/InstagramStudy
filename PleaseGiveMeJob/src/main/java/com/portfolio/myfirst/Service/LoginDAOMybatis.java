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
	//Spring �����̳��̰� �ڵ����� �޼ҵ带 ȣ�����ְ�
	//applicationContext���Ͽ� ��ϵ� SqlSessionFactoryBean ��ü��  ���ڷ� �޾Ƽ� �޼ҵ带 ����
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	
	public UserInfoVO getLoginInfo(UserInfoVO vo) {
		System.out.println("DAO ����");
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
