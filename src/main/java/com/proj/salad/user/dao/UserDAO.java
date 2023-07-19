package com.proj.salad.user.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.proj.salad.user.vo.UserVO;

public interface UserDAO {
	public UserVO login(Map loginMap) throws DataAccessException;  //로그인
	
	public void insertNewUser(UserVO userVO) throws DataAccessException;  //회원가입
	
	public String selectOverlappedID(String userId) throws DataAccessException;  //ID 중복검사
}
