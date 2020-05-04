package com.example.community.service;

import com.example.community.entity.po.Goods;

import java.util.List;

/**
 * 商品管理业务
 */
public interface GoodsManageService {

    /**
     * 查询所有商品
     * @return
     */
    List<Goods> listAllGoods();

    /**
     * 添加一个商品
     * @param goods
     */
    void addOrUpdateOneGoods(Goods goods);

    /**
     * 查询获取一个商品
     * @param GoodsId
     * @return
     */
    Goods getOneGoods(Long GoodsId);

    /**
     * 修改商品库存
     * @param goods
     */
    void editGoodsCount(Goods goods);
}
