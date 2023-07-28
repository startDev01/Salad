package com.proj.salad.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MyPageController {
	
	//회원정보상세
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	//회원정보수정
	public ResponseEntity modifyMyInfo(@RequestParam("attribute") String attribute,
                                       @RequestParam("value") String value,
                                       HttpServletRequest request, HttpServletResponse response)  throws Exception;
	//회원정보탈퇴
	public ModelAndView removeUser(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
