package com.proj.salad.cart.service;

import com.proj.salad.cart.vo.CartListVO;
import com.proj.salad.cart.vo.CartVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

/* CartService 김동혁 추가(23.07.19) */
public interface CartService {
    public void addCart(CartVO cartVO) throws DataAccessException;
    public List<CartListVO> cartById(String userId) throws DataAccessException;
    public void delCart(int cartNum) throws DataAccessException;
    public void updateCart(CartVO cartVO) throws DataAccessException;
}
