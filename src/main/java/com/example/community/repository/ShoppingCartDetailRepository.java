package com.example.community.repository;

import com.example.community.entity.po.Goods;
import com.example.community.entity.po.ShoppingCartDetail;
import com.example.community.entity.po.SysUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ShoppingCartDetailRepository extends JpaRepository<ShoppingCartDetail, Long> {

    /**
     * 根据买家查询购物车
     * @param buyer
     * @return
     */
    @Query("select d from ShoppingCartDetail d where d.buyer = :buyer")
    List<ShoppingCartDetail> listByBuyer(@Param("buyer") SysUser buyer);

    /**
     * 根据买方id查询
     * @return
     */
    @Query("select d from ShoppingCartDetail d where d.buyer.id = :buyerId")
    List<ShoppingCartDetail> listByBuyerId(@Param("buyerId")Long buyerId);

    /**
     * 根据买家，商品，查询唯一的一条购物车详情
     */
    @Query("select d from ShoppingCartDetail d where d.buyer=:buyer and d.goods=:goods")
    ShoppingCartDetail getByBuyerAndGoods(@Param("buyer") SysUser buyer, @Param("goods") Goods goods);

}
