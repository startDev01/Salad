package com.proj.salad.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.proj.salad.user.vo.UserVO;

/* 서승희 userDAO */
@Repository("userDAO")
public class UserDAOImpl  implements UserDAO{
	
	@Autowired   //의존성주입
	private SqlSession sql;	

	@Override
	public UserVO login(Map loginMap) throws DataAccessException {  //로그인
		UserVO user=(UserVO)sql.selectOne("mapper.user.login",loginMap);
		return user;
	}

	@Override
	public void insertNewUser(UserVO userVO) throws DataAccessException {  //회원가입
		sql.insert("mapper.user.insertNewUser",userVO);
	}

	@Override
	public String selectOverlappedID(String userId) throws DataAccessException {  //ID 중복검사
		String result =  sql.selectOne("mapper.user.selectOverlappedID",userId);
		return result;
	}

}
