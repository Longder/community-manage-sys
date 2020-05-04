package com.example.community.controller;

import com.example.community.entity.po.ServerComment;
import com.example.community.service.AppointmentManageService;
import com.example.community.service.CommentManageService;
import com.example.community.service.ServerInfoManageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 评价管理的控制器
 */
@Slf4j
@Controller
@RequestMapping("/admin/comment")
public class CommentManageController {

    @Resource
    private AppointmentManageService appointmentManageService;

    @Resource
    private CommentManageService commentManageService;

    @Resource
    private ServerInfoManageService serverInfoManageService;

    /**
     * 去添加评论
     *
     * @return
     */
    @GetMapping("/toAdd")
    public String toAddComment(Long appointmentId, Model model) {
        log.debug("去添加评论:{}", appointmentId);
        model.addAttribute("appointment", appointmentManageService.getOneAppointment(appointmentId));
        return "comment/add-comment-modal";
    }

    /**
     * 添加评论
     *
     * @return
     */
    @PostMapping("/add")
    public String addComment(ServerComment serverComment) {
        log.debug("添加评论");
        commentManageService.addOneComment(serverComment);
        return "redirect:/admin/appointment/listMyAppointment";
    }

    /**
     * 查看评论
     * @return
     */
    @GetMapping("/showComment")
    public String showComment(Long serverInfoId,Model model){
        model.addAttribute("serverInfo",serverInfoManageService.getOneServerInfo(serverInfoId));
        model.addAttribute("commentList",commentManageService.listAllComment(serverInfoId));
        return "comment/show-comment-modal";
    }

}
