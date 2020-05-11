package com.example.community.service.impl;

import com.example.community.entity.po.Appointment;
import com.example.community.entity.po.ServerComment;
import com.example.community.entity.po.ServerInfo;
import com.example.community.entity.po.SysUser;
import com.example.community.repository.AppointmentRepository;
import com.example.community.repository.ServerCommentRepository;
import com.example.community.repository.ServerInfoRepository;
import com.example.community.security.SecurityUtil;
import com.example.community.service.ServerInfoManageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 服务信息管理业务的实现类
 */
@Service
public class ServerInfoManageServiceImpl implements ServerInfoManageService {

    @Resource
    private ServerInfoRepository serverInfoRepository;
    @Resource
    private AppointmentRepository appointmentRepository;
    @Resource
    private ServerCommentRepository serverCommentRepository;

    /**
     * 查询我的服务信息，雇员查看自己发布的
     *
     * @return 服务信息集合
     */
    @Override
    public List<ServerInfo> listAllServerInfo() {
        return serverInfoRepository.findAll();
    }

    /**
     * 发布一条服务信息
     *
     * @param serverInfo 服务信息对象
     */
    @Override
    @Transactional
    public void publishOneServerInfo(ServerInfo serverInfo) {
        //刚发布还没预约
        serverInfo.setSubscribed(false);
        //时间
        serverInfo.setPublishTime(LocalDateTime.now());
        serverInfoRepository.save(serverInfo);
    }


    @Override
    public ServerInfo getOneServerInfo(Long serverInfoId) {
        return serverInfoRepository.findById(serverInfoId).orElseThrow(RuntimeException::new);
    }

    /**
     * 编辑一个服务信息
     *
     * @param serverInfo
     */
    @Override
    @Transactional
    public void editOneServerInfo(ServerInfo serverInfo) {
        //只修改部分信息
        ServerInfo dbInfo = serverInfoRepository.getOne(serverInfo.getId());
        dbInfo.setTitle(serverInfo.getTitle());
        dbInfo.setServerType(serverInfo.getServerType());
        dbInfo.setPersonName(serverInfo.getPersonName());
        dbInfo.setDescription(serverInfo.getDescription());
        serverInfoRepository.save(dbInfo);
    }

    /**
     * 删除一个服务信息
     *
     * @param serverInfoId
     */
    @Override
    @Transactional
    public void removeOneServerInfo(Long serverInfoId) {
        // 预约 Appointment
        List<Appointment> appointmentList = appointmentRepository.listByServerInfoId(serverInfoId);
        appointmentRepository.deleteInBatch(appointmentList);
        // 评论 ServerComment;
        List<ServerComment> serverCommentList = serverCommentRepository.listByServerInfoId(serverInfoId);
        serverCommentRepository.deleteInBatch(serverCommentList);
        // 服务信息
        serverInfoRepository.deleteById(serverInfoId);
    }
}
