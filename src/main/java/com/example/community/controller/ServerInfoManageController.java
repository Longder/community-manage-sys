package com.example.community.controller;

import com.example.community.entity.enums.ServerType;
import com.example.community.entity.po.ServerInfo;
import com.example.community.service.ServerInfoManageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 服务信息管理的控制器
 */
@Slf4j
@Controller
@RequestMapping("/admin/serverInfo")
public class ServerInfoManageController {

    @Resource
    private ServerInfoManageService serverInfoManageService;

    /**
     * 查询所有服务信息（管理员用）
     * @return 信息
     */
    @GetMapping("/listAllServerInfo")
    public String listAllServerInfo(Model model){
        model.addAttribute("serverInfoList",serverInfoManageService.listAllServerInfo());
        return "server-info/list-for-admin";
    }


    /**
     * 去发布服务信息
     * @return 页面
     */
    @GetMapping("/toPublish")
    public String toPublishServerInfo(Model model){
        log.debug("去发布服务信息");
        model.addAttribute("serverTypes", ServerType.values());
        return "server-info/publish-server-info-modal";
    }

    /**
     * 发布服务信息
     * @param serverInfo 服务信息
     * @return
     */
    @PostMapping("/publish")
    public String publishServerInfo(ServerInfo serverInfo){
        log.debug("发布服务信息");
        serverInfoManageService.publishOneServerInfo(serverInfo);
        return "redirect:/admin/serverInfo/listAllServerInfo";
    }

    /**
     * 去编辑服务信息
     * @param serverInfoId
     * @return
     */
    @GetMapping("/toEdit")
    public String toEditServerInfo(Long serverInfoId,Model model){
        model.addAttribute("serverInfo",serverInfoManageService.getOneServerInfo(serverInfoId));
        model.addAttribute("serverTypes", ServerType.values());
        return "server-info/edit-server-info-modal";
    }

    /**
     * 编辑服务信息
     * @param serverInfo
     * @return
     */
    @PostMapping("/edit")
    public String editServerInfo(ServerInfo serverInfo){
        serverInfoManageService.editOneServerInfo(serverInfo);
        return "redirect:/admin/serverInfo/listAllServerInfo";
    }

    /**
     * 移除服务信息
     * @param serverInfoId
     * @return
     */
    @GetMapping("/remove")
    public String removeServerInfo(Long serverInfoId){
        serverInfoManageService.removeOneServerInfo(serverInfoId);
        return "redirect:/admin/serverInfo/listAllServerInfo";
    }

}
