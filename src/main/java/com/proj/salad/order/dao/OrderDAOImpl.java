package com.proj.salad.order.dao;

import java.util.List;

import com.proj.salad.order.vo.OrderMenuVO;
import com.proj.salad.order.vo.OrderVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.proj.salad.cart.vo.CartListVO;


@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
    private SqlSession sqlSession;

	@Override
	public List<CartListVO> selectOrderList(String userId) throws DataAccessException {
		List<CartListVO> cartListVO = sqlSession.selectList("mapper.order.selectOrderList", userId);
		return cartListVO;
	}

	@Override
	public void newOrder(OrderVO orderVO) throws DataAccessException {
		sqlSession.insert("mapper.order.newOrder", orderVO);
	}

	@Override
	public void newOrderMenu(OrderMenuVO orderMenuVO) throws DataAccessException {
		sqlSession.insert("mapper.order.newOrderMenu", orderMenuVO);
	}

	@Override
	public void deleteCartList(String userId) throws DataAccessException {
		sqlSession.delete("mapper.order.deleteCartList", userId);
	}
}
