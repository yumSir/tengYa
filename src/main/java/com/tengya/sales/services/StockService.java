package com.tengya.sales.services;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.tengya.sales.dao.StockMapper;
import com.tengya.sales.entity.Stock;

import java.util.List;
import java.util.Map;

@Service
public class StockService{

    @Resource
    private StockMapper stockMapper;

    
    public int deleteByPrimaryKey(Integer id) {
        return stockMapper.deleteByPrimaryKey(id);
    }

    
    public int insert(Stock record) {
        return stockMapper.insert(record);
    }

    
    public int insertSelective(Stock record) {
        return stockMapper.insertSelective(record);
    }

    
    public Stock selectByPrimaryKey(Integer id) {
        return stockMapper.selectByPrimaryKey(id);
    }

    public Stock getOrderVo(Map<String, Object> searchPara) {
        return stockMapper.getOrderVo(searchPara);
    }

    public List<Stock> selectStockList(Stock stock) {
        return stockMapper.selectStockList(stock);
    }

    public int updateByPrimaryKeySelective(Stock record) {
        return stockMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(Stock record) {
        return stockMapper.updateByPrimaryKey(record);
    }

}
