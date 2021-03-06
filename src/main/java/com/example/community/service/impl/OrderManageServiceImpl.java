package com.example.community.service.impl;

import com.example.community.entity.po.Goods;
import com.example.community.entity.po.OrderDetail;
import com.example.community.entity.po.ShoppingCartDetail;
import com.example.community.entity.po.SysUser;
import com.example.community.repository.GoodsRepository;
import com.example.community.repository.OrderDetailRepository;
import com.example.community.repository.ShoppingCartDetailRepository;
import com.example.community.service.OrderManageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 订单管理业务层
 */
@Service
public class OrderManageServiceImpl implements OrderManageService {

    @Resource
    private ShoppingCartDetailRepository shoppingCartDetailRepository;
    @Resource
    private OrderDetailRepository orderDetailRepository;
    @Resource
    private GoodsRepository goodsRepository;

    /**
     * 提交订单
     *
     * @param buyer
     */
    @Override
    @Transactional
    public void submitOrder(SysUser buyer) {
        //查询出买家购物车中的所有内容
        List<ShoppingCartDetail> detailList = shoppingCartDetailRepository.listByBuyer(buyer);
        List<OrderDetail> orderDetailList = new ArrayList<>();
        detailList.forEach(detail -> {
            //一个商品生成一个订单详情
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setBuyer(buyer);
            Goods goods = detail.getGoods();
            orderDetail.setGoods(goods);
            orderDetail.setCount(detail.getCount());
            orderDetail.setTotal(detail.getPrice());
            orderDetailList.add(orderDetail);
            //商品数量减少
            goods.setCount(goods.getCount() - detail.getCount());
            goodsRepository.save(goods);
        });
        orderDetailRepository.saveAll(orderDetailList);
        //清空用户的购物车
        shoppingCartDetailRepository.deleteAll(detailList);
    }

    /**
     * 订单列表
     * @return
     */
    @Override
    public List<OrderDetail> listOrder() {
        return orderDetailRepository.findAll();
    }
}
