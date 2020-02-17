package com.tengya.sales.controller;

import com.tengya.sales.entity.Stock;
import com.tengya.sales.services.StockService;
import com.tengya.sales.util.RequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/stock")
public class StockController {

    @Autowired
    private StockService stockService;

    /**
     * @desc 库存列表页
     * @param stock
     * @param model
     * @return
     */
    @RequestMapping("/selectStockList")
    public String selectStockList(Stock stock, Model model){

        List<Stock> stockList = stockService.selectStockList(stock);

        model.addAttribute("stockList",stockList);
        return  "stock/stockList";
    }

    /**
     * @desc 新增库存页
     * @param model
     * @return
     */
    @RequestMapping("/stockAdd")
    public String stockAdd(Model model){
        Stock stock = new Stock();
        List<Stock> stockList = stockService.selectStockList(stock);
        model.addAttribute("stockList",stockList);
        return  "stock/stockAdd";
    }

    /**
     * @desc 保存库存信息
     * @param stock
     * @param model
     * @return
     */
    @RequestMapping("/stockSave")
    public String stockSave(Stock stock, Model model, HttpServletRequest request){

        /* 更新库存信息 begin */
        Map<String, Object> searchMap = new HashMap<String, Object>();
        searchMap.put("productCode",stock.getProductCode());
        Stock newStock = stockService.getOrderVo(searchMap);
        if(newStock != null) {  // 有则更新----
            newStock.setModels(stock.getModels());  // 规格型号
            newStock.setUnit(stock.getUnit());  // 单位
            newStock.setCounts(stock.getCounts() + newStock.getCounts());   // 数量

            newStock.setModifyIp(RequestUtil.getRemortIP(request));
            newStock.setModifyTime(new Date());
            newStock.setModifyUserId("1");
            newStock.setModifyUserName("系统管理员");
            stockService.updateByPrimaryKey(newStock);
        }else{  // 无则插入----(预留代码，用于以后新增产品库存信息)
            stock.setCreateIp(RequestUtil.getRemortIP(request));
            stock.setCreateTime(new Date());
            stock.setCreateUserId("1");
            stock.setCreateUserName("系统管理员");
            stockService.insert(stock);
        }
        /* 更新库存信息 end */

        List<Stock> stockList = stockService.selectStockList(new Stock());
        model.addAttribute("stockList",stockList);
        return  "stock/stockList";
    }

    /**
     * @desc  缺料显示
     * @param stock
     * @param model
     * @return
     */
    @RequestMapping("/selectStockLackList")
    public String selectStockLackList(Stock stock, Model model){

        stock.setAttribute1("lack");  // 标记为缺料
        List<Stock> stockLackList = stockService.selectStockList(stock);

        model.addAttribute("stockLackList",stockLackList);
        return  "stock/stockLackList";
    }
}
