package com.example.community.repository;

import com.example.community.entity.po.Goods;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 商品表数据操作
 */
public interface GoodsRepository extends JpaRepository<Goods,Long> {
}
