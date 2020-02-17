package com.tengya.sales.controller;

import com.tengya.sales.entity.Order;
import com.tengya.sales.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private OrderService orderService;


    @RequestMapping("/")
    public String index(Order order, Model model){

        List<Order> orderList = orderService.selectOrderList(order);
        model.addAttribute("orderList",orderList);
        return  "order/orderList";
    }
}
