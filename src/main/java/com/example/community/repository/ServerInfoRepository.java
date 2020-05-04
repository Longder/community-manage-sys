package com.example.community.repository;

import com.example.community.entity.po.ServerInfo;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 服务信息数据查询对象
 */
public interface ServerInfoRepository extends JpaRepository<ServerInfo,Long> {
}
