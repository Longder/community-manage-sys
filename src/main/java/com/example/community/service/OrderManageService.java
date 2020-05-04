package com.example.community.service;


import com.example.community.entity.po.OrderDetail;
import com.example.community.entity.po.SysUser;

import java.util.List;

/**
 * 订单管理的业务层
 */
public interface OrderManageService {

    /**
     * 提交订单
     * @param buyer
     */
    void submitOrder(SysUser buyer);

    /**
     * 订单列表
     * @return
     */
    List<OrderDetail> listOrder();
}
