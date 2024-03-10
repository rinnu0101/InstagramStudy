package com.portfolio.myfirst.Service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.portfolio.myfirst.Mapper.UserInfoVO;

@Repository
public class LoginDAOMybatis extends SqlSessionDaoSupport {
	@Autowired
	//Spring 컨테이너이가 자동으로 메소드를 호출해주고
	//applicationContext파일에 등록된 SqlSessionFactoryBean 객체를  인자로 받아서 메소드를 실행
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//로그인 정보 가져오기
	public UserInfoVO getLoginInfo(UserInfoVO vo) {
		System.out.println("DAO 시작");
		return getSqlSession().selectOne("LoginDAO.getLoginInfo", vo);		
	}
	
	//회원가입 정보 저장하기
	public void setJoinInfo(UserInfoVO vo) {
		getSqlSession().insert("LoginDAO.setJoinInfo", vo);		
	}
	//ID 중복 체크
	public UserInfoVO getIdDuplCheck(UserInfoVO vo) {
		return getSqlSession().selectOne("LoginDAO.getIdDuplCheck", vo);		
	}
	//닉네임 중복 체크
	public UserInfoVO getNicknameDuplCheck(UserInfoVO vo) {
		return getSqlSession().selectOne("LoginDAO.getNicknameDuplCheck", vo);		
	}
	
	//비밀번호 찾기
	public UserInfoVO getFindPwInfo(UserInfoVO vo) {
		return getSqlSession().selectOne("LoginDAO.getFindPwInfo", vo);		
	}
	
}
