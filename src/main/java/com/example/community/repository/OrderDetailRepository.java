package com.example.community.repository;



import com.example.community.entity.po.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * 订单表操作
 */
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    /**
     * 根据买方id查询
     * @param buyerId
     * @return
     */
    @Query("SELECT O FROM OrderDetail O where O.buyer.id = :buyerId")
    List<OrderDetail> listByBuyerId(Long buyerId);
}
