package com.proj.salad.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.proj.salad.order.vo.OrderVO;
import com.proj.salad.user.vo.UserVO;

public interface MyPageService {
	//회원정보상세
	public UserVO myDetailInfo(String userId) throws DataAccessException;
	//회원정보수정
	public UserVO modifyMyInfo(Map userMap) throws DataAccessException;
	//회원정보탈퇴
	public int removeUser(String userId)  throws DataAccessException;
	//주문내역 리스트
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
	//주문제품 리스트 
	public List<OrderVO> listMyOrderGoods(String userId) throws Exception;
	//주문상세 
	public List findMyOrderInfo(int orderNum) throws Exception;
	//주문취소 
	public void cancelOrder(int orderNum) throws Exception;
}
