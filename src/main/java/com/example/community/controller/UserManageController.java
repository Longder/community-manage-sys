package com.example.community.controller;

import com.example.community.entity.po.SysUser;
import com.example.community.service.UserManageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * 用户管理的控制器
 */
@Slf4j
@Controller
@RequestMapping("/admin/user")
public class UserManageController {

    @Resource
    private UserManageService userManageService;

    @GetMapping("/list")
    public String userList(Model model){
        log.debug("用户列表");
        model.addAttribute("userList",userManageService.listAllUser());
        return "user/user-list";
    }


    /**
     * 去编辑用户
     * @param userId
     * @return
     */
    @GetMapping("/toEdit")
    public String toEdit(Long userId,Model model){
        log.debug("去编辑用户页面");
        model.addAttribute("user",userManageService.getOneUser(userId));
        return "user/edit-user-modal";
    }

    /**
     * 编辑用户
     * @param sysUser 用户实体
     * @return
     */
    @PostMapping("/edit")
    public String edit(SysUser sysUser){
        log.debug("编辑用户");
        userManageService.saveOneUser(sysUser,null);
        return "redirect:/admin/user/list";
    }

    /**
     * 去编辑管理员
     * @return
     */
    @GetMapping("/toEditAdmin")
    public String toEditAdmin(Long userId,Model model){
        model.addAttribute("user",userManageService.getOneUser(userId));
        return "user/edit-admin-modal";
    }

    /**
     * 用户自我修改信息
     * @return
     */
    @PostMapping("/editForUse")
    public String editForUser(SysUser sysUser){
        userManageService.saveOneUser(sysUser,null);
        return "redirect:/";
    }

    /**
     * 修改密码
     * @return
     */
    @ResponseBody
    @PostMapping("/changePassword")
    public String changePassword(String newPassword){
        userManageService.changePassword(newPassword);
        return "ok";
    }

    /**
     * 注销用户
     * @param userId
     * @return
     */
    @GetMapping("/cancelUser")
    public String cancelUser(Long userId){
        userManageService.cancelOneUser(userId);
        return "redirect:/admin/user/list";
    }
}
