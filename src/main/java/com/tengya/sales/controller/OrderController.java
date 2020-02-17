package com.tengya.sales.controller;

import com.tengya.sales.entity.Order;
import com.tengya.sales.entity.Stock;
import com.tengya.sales.services.OrderService;
import com.tengya.sales.services.StockService;
import com.tengya.sales.util.RequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private StockService stockService;

    /**
     * @desc 订单列表页
     * @param order
     * @param model
     * @return
     */
    @RequestMapping("/selectOrderList")
    public String index(Order order, Model model){

        List<Order> orderList = orderService.selectOrderList(order);
        model.addAttribute("orderList",orderList);
        return  "order/orderList";
    }

    /**
     * @desc 新增订单页
     * @param model
     * @return
     */
    @RequestMapping("/orderAdd")
    public String orderAdd(Model model){
        Stock stock = new Stock();
        List<Stock> stockList = stockService.selectStockList(stock);
        model.addAttribute("stockList",stockList);
        return  "order/orderAdd";
    }

    /**
     * @desc 保存订单信息
     * @param order
     * @param model
     * @return
     */
    @RequestMapping("/orderSave")
    public String orderSave(Order order, Model model, HttpServletRequest request){

        order.setCreateIp(RequestUtil.getRemortIP(request));
        order.setCreateTime(new Date());
        order.setCreateUserId("1");
        order.setCreateUserName("系统管理员");
        int result = orderService.insert(order);
        if(result == 1 ){  // 插入成功，开始扣减库存
            Map<String, Object> searchMap = new HashMap<String, Object>();
            searchMap.put("productCode",order.getProductCode());
            Stock stock = stockService.getOrderVo(searchMap);
            stock.setCounts(stock.getCounts() - order.getCounts());

            stock.setModifyIp(RequestUtil.getRemortIP(request));
            stock.setModifyTime(new Date());
            stock.setModifyUserId("1");
            stock.setModifyUserName("系统管理员");
            stockService.updateByPrimaryKey(stock);
        }
        List<Order> orderList = orderService.selectOrderList(order);
        model.addAttribute("orderList",orderList);
        model.addAttribute("result",result);
        return  "order/orderList";
    }


}
