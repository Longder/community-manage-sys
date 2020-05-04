package com.example.community.repository;



import com.example.community.entity.po.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 订单表操作
 */
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

}
