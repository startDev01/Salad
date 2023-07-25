package com.proj.salad.mypage.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.proj.salad.user.vo.UserVO;

public interface MyPageDAO {
	//회원정보상세
	public UserVO selectMyDetailInfo(String userId) throws DataAccessException;
	//회원정보수정
	public void updateMyInfo(Map userMap) throws DataAccessException;
	//회원정보탈퇴
	public int deleteUser(String userId) throws DataAccessException;
	
	
}
