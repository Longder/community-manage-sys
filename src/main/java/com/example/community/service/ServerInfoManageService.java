package com.example.community.service;


import com.example.community.entity.po.ServerInfo;

import java.util.List;

/**
 * 服务信息管理业务
 */
public interface ServerInfoManageService {

    /**
     * 查询所有服务信息（包括已经预约和没预约的）
     * @return 服务信息集合
     */
    List<ServerInfo> listAllServerInfo();

    /**
     * 发布一条服务信息
     * @param serverInfo 服务信息对象
     */
    void publishOneServerInfo(ServerInfo serverInfo);


    /**
     * 查询获取一个服务信息
     * @param serverInfoId
     * @return
     */
    ServerInfo getOneServerInfo(Long serverInfoId);

    /**
     * 编辑一个服务信息
     * @param serverInfo
     */
    void editOneServerInfo(ServerInfo serverInfo);

    /**
     * 删除一个服务信息
     * @param serverInfoId
     */
    void removeOneServerInfo(Long serverInfoId);
}
