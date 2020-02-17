package com.tengya.sales.dao;

import com.tengya.sales.entity.Order;
import com.tengya.sales.entity.Stock;

import java.util.List;
import java.util.Map;

public interface StockMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Stock record);

    int insertSelective(Stock record);

    Stock selectByPrimaryKey(Integer id);

    Stock getOrderVo(Map<String, Object> searchPara);

    List<Stock> selectStockList(Stock record);

    int updateByPrimaryKeySelective(Stock record);

    int updateByPrimaryKey(Stock record);
}