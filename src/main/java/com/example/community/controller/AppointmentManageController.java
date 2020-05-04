package com.example.community.controller;

import com.example.community.security.SecurityUtil;
import com.example.community.service.AppointmentManageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 预约管理的控制器
 */
@Slf4j
@Controller
@RequestMapping("/admin/appointment")
public class AppointmentManageController {

    @Resource
    private AppointmentManageService appointmentManageService;
    /**
     * 生成预约
     * @return
     */
    @GetMapping("/generate")
    public String generateAppointment(Long serverInfoId){
        log.debug("生成预约,serverInfoId:{}",serverInfoId);
        appointmentManageService.generateAppointment(serverInfoId);
        return "redirect:/serverInfo";
    }

    /**
     * 我的预约信息列表 住户用户用
     * @param model
     * @return
     */
    @GetMapping("/listMyAppointment")
    public String listForEmployer(Model model){
        model.addAttribute("appointmentList",appointmentManageService.listMyAppointment());
        model.addAttribute("user", SecurityUtil.getCurrentUser());
        return "appointment/list-for-me";
    }

    /**
     * 完成家政服务
     * @param appointmentId
     * @return
     */
    @GetMapping("/complete")
    public String complete(Long appointmentId){
        log.info("完成家政服务：{}",appointmentId);
        appointmentManageService.completeAppointment(appointmentId);
        return "redirect:/admin/appointment/listMyAppointment";
    }

}
