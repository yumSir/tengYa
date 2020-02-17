package com.tengya.sales.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.tengya.sales.dao.OrderMapper;
import com.tengya.sales.entity.Order;

import java.util.List;

@Service
public class OrderService{

    @Autowired
    private OrderMapper orderMapper;

    public int deleteByPrimaryKey(Integer id) {
        return orderMapper.deleteByPrimaryKey(id);
    }

    
    public int insert(Order record) {
        return orderMapper.insert(record);
    }

    
    public int insertSelective(Order record) {
        return orderMapper.insertSelective(record);
    }

    
    public Order selectByPrimaryKey(Integer id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    public List<Order> selectOrderList(Order order) {
        return orderMapper.selectOrderList(order);
    }

    
    public int updateByPrimaryKeySelective(Order record) {
        return orderMapper.updateByPrimaryKeySelective(record);
    }

    
    public int updateByPrimaryKey(Order record) {
        return orderMapper.updateByPrimaryKey(record);
    }

}
