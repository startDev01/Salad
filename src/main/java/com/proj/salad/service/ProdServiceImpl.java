package com.proj.salad.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.proj.salad.dao.ProdDAOImpl;
import com.proj.salad.vo.ProdVO;

/* 김동혁 - Service 추가 */
@Service
public class ProdServiceImpl {
    @Autowired
    ProdVO prodVO;
    @Autowired
    SqlSession sqlSession;
    @Autowired
    ProdDAOImpl prodDAOImpl;
    public List<ProdVO> selectProdList() throws DataAccessException {
        List list = prodDAOImpl.selectProdList();
        return list;
    }
}
