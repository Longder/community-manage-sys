package com.example.community.service.impl;


import com.example.community.entity.enums.ServerState;
import com.example.community.entity.po.Appointment;
import com.example.community.entity.po.ServerInfo;
import com.example.community.entity.po.SysUser;
import com.example.community.repository.AppointmentRepository;
import com.example.community.repository.ServerInfoRepository;
import com.example.community.security.SecurityUtil;
import com.example.community.service.AppointmentManageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 预约管理的业务service的实现
 */
@Service
public class AppointmentManageServiceImpl implements AppointmentManageService {

    @Resource
    private ServerInfoRepository serverInfoRepository;
    @Resource
    private AppointmentRepository appointmentRepository;
    /**
     * 生成预约服务
     *
     * @param serverInfoId 服务信息id
     */
    @Override
    @Transactional
    public void generateAppointment(Long serverInfoId) {
        //当前用户
        SysUser currentUser = SecurityUtil.getCurrentUser();
        assert currentUser!=null;
        ServerInfo serverInfo = serverInfoRepository.findById(serverInfoId).orElseThrow(RuntimeException::new);
        Appointment appointment = new Appointment();
        appointment.setServerInfo(serverInfo);
        appointment.setEmployer(currentUser);
        //初始还未评论
        appointment.setCommented(false);
        //初始化默认状态是服务中
        appointment.setServerState(ServerState.SERVING);
        appointmentRepository.save(appointment);
        //原服务信息的状态改成已预约
        serverInfo.setSubscribed(true);
        serverInfoRepository.save(serverInfo);
    }

    /**
     * 查询我的预约信息列表
     *
     * @return
     */
    @Override
    public List<Appointment> listMyAppointment() {
        //当前用户
        SysUser currentUser = SecurityUtil.getCurrentUser();
        assert currentUser!=null;
        return appointmentRepository.listByEmployerId(currentUser.getId());
    }

    /**
     * 完成家政服务
     *
     * @param appointmentId
     */
    @Override
    @Transactional
    public void completeAppointment(Long appointmentId) {
        Appointment appointment = appointmentRepository.findById(appointmentId).orElseThrow(RuntimeException::new);
        //修改服务状态
        appointment.setServerState(ServerState.COMPLETE);
        ServerInfo serverInfo = appointment.getServerInfo();
        //服务信息改为“可预约”
        serverInfo.setSubscribed(false);
        serverInfoRepository.save(serverInfo);
        appointmentRepository.save(appointment);
    }

    /**
     * 获取一个预约信息
     *
     * @param appointmentId
     * @return
     */
    @Override
    public Appointment getOneAppointment(Long appointmentId) {
        return appointmentRepository.findById(appointmentId).orElseThrow(RuntimeException::new);
    }
}
