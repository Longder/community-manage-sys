package com.example.community.service.impl;

import com.example.community.entity.po.Goods;
import com.example.community.entity.po.ShoppingCartDetail;
import com.example.community.entity.po.SysUser;
import com.example.community.repository.GoodsRepository;
import com.example.community.repository.ShoppingCartDetailRepository;
import com.example.community.service.ShoppingCartManageService;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShoppingCartManageServiceImpl implements ShoppingCartManageService {
    @Resource
    private ShoppingCartDetailRepository shoppingCartDetailRepository;
    @Resource
    private GoodsRepository goodsRepository;

    /**
     * 查询当前用户的购物车里的内容
     *
     * @param sysUser
     * @return
     */
    @Override
    public List<ShoppingCartDetail> listAll(SysUser sysUser) {
        return shoppingCartDetailRepository.listByBuyer(sysUser);
    }

    /**
     * 添加到购物车
     *
     * @param goodsId
     * @param sysUser
     */
    @Override
    public void addToCart(Long goodsId, SysUser sysUser) {
        Goods goods = goodsRepository.getOne(goodsId);
        ShoppingCartDetail detail = shoppingCartDetailRepository.getByBuyerAndGoods(sysUser, goods);
        if (ObjectUtils.isEmpty(detail)) {//没有就新增一条
            detail = new ShoppingCartDetail();
            detail.setGoods(goods);
            detail.setBuyer(sysUser);
            detail.setCount(1);
        } else {//有就修改数量
            detail.setCount(detail.getCount() + 1);
        }
        detail.calculatePrice();
        shoppingCartDetailRepository.save(detail);
    }

    /**
     * 购物车中某个商品数量加一
     *
     * @param detailId
     */
    @Override
    public void addCount(Long detailId) {
        ShoppingCartDetail detail = shoppingCartDetailRepository.getOne(detailId);
        detail.setCount(detail.getCount() + 1);
        detail.calculatePrice();
        shoppingCartDetailRepository.save(detail);
    }

    /**
     * 购物车中某个商品数量减一
     *
     * @param detailId
     */
    @Override
    public void reduceCount(Long detailId) {
        ShoppingCartDetail detail = shoppingCartDetailRepository.getOne(detailId);
        if (detail.getCount() > 0) {
            detail.setCount(detail.getCount() - 1);
            detail.calculatePrice();
            shoppingCartDetailRepository.save(detail);
        }
    }

    /**
     * 从购物车中移除某个商品
     *
     * @param detailId
     */
    @Override
    public void removeDetail(Long detailId) {
        shoppingCartDetailRepository.deleteById(detailId);
    }
}
