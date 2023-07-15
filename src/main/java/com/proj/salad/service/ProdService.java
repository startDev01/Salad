package com.proj.salad.service;

import com.proj.salad.vo.ProdVO;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface ProdService {
    public List<ProdVO> selectProdList() throws DataAccessException;
}
