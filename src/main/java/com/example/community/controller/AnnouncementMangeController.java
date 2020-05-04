package com.example.community.controller;

import com.example.community.entity.po.Announcement;
import com.example.community.service.AnnouncementManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 公告管理的控制器
 */
@Controller
@RequestMapping("/admin/announcement")
public class AnnouncementMangeController {

    @Resource
    private AnnouncementManageService announcementManageService;

    /**
     * 查询所有公告
     * @param model
     * @return
     */
    @GetMapping("/listAll")
    public String listAllAnnouncement(Model model){
        model.addAttribute("announcementList",announcementManageService.listAllAnnouncement());
        return "announcement/list-for-admin";
    }

    /**
     * 去发布公告
     * @return
     */
    @GetMapping("/toPublish")
    public String toPublish(){
        return "announcement/publish-announcement-modal";
    }

    /**
     * 发布公告
     * @return
     */
    @PostMapping("/publish")
    public String publish(Announcement announcement){
        announcementManageService.publishOneAnnouncement(announcement);
        return "redirect:/admin/announcement/listAll";
    }

    /**
     * 去编辑公告
     * @param model
     * @param announcementId 公告id
     * @return
     */
    @GetMapping("/toEdit")
    public String toEdit(Model model,Long announcementId){
        model.addAttribute("announcement",announcementManageService.getOneAnnouncement(announcementId));
        return "announcement/edit-announcement-modal";
    }

    /**
     * 修改公告
     * @param announcement
     * @return
     */
    @PostMapping("/edit")
    public String edit(Announcement announcement){
        announcementManageService.editOneAnnouncement(announcement);
        return "redirect:/admin/announcement/listAll";
    }

    /**
     * 移除公告
     * @param announcementId
     * @return
     */
    @GetMapping("/remove")
    public String remove(Long announcementId){
        announcementManageService.removeOneAnnouncement(announcementId);
        return "redirect:/admin/announcement/listAll";
    }
}
