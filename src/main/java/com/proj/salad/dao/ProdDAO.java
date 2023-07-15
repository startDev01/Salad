package com.proj.salad.dao;

import com.proj.salad.vo.ProdVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ProdDAO {
    public List<ProdVO> selectProdList() throws DataAccessException;
}
