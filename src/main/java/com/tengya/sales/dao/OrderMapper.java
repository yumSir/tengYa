package com.tengya.sales.dao;

import com.tengya.sales.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(@Param("id")Integer id);

    List<Order> selectOrderList(Order record);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}