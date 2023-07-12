package com.proj.salad.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.salad.dao.ProdDAO;
import com.proj.salad.vo.ProdVO;

/* 김동혁 - Service 추가 */
@Service
public class ProdService {
    @Autowired
    ProdVO prodVO;
    @Autowired
    SqlSession sqlSession;
    @Autowired
    ProdDAO prodDAO;
    public List<ProdVO> selectProdList() {
        List list = prodDAO.selectProdList();
        return list;
    }
}
