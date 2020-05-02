package com.example.community.controller;

import com.example.community.service.UserManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 用户管理的控制器
 */
@Controller
@RequestMapping(name = "/admin/user")
public class UserManageController {

    @Resource
    private UserManageService userManageService;

    @GetMapping("/list")
    public String userList(Model model){
        model.addAttribute("userList",userManageService.listAllUser());
        return "user/user-list";
    }
}
