package com.proj.salad.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.proj.salad.vo.ProdVO;

/* 김동혁 - DAO 추가 */
@Repository("prodDAO")
public class ProdDAOImpl implements ProdDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<ProdVO> selectProdList() throws DataAccessException {
        List<ProdVO> list = sqlSession.selectList("mapper.prod.selectProdList");
        return list;
    }


}
