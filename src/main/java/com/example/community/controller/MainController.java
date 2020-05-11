package com.example.community.controller;

import com.example.community.entity.po.SysRole;
import com.example.community.entity.po.SysUser;
import com.example.community.security.SecurityUtil;
import com.example.community.service.AnnouncementManageService;
import com.example.community.service.GoodsManageService;
import com.example.community.service.ServerInfoManageService;
import com.example.community.service.UserManageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Slf4j
@Controller
public class MainController {

    @Resource
    private UserManageService userManageService;
    @Resource
    private GoodsManageService goodsManageService;
    @Resource
    private AnnouncementManageService announcementManageService;
    @Resource
    private ServerInfoManageService serverInfoManageService;

    /**
     * 主页
     * 社区超市
     *
     * @return
     */
    @GetMapping("/")
    public String index(Model model, HttpServletRequest request) {
        this.fillCurrentUser(model,request);
        //查询所有商品
        model.addAttribute("goodsList", goodsManageService.listAllGoods());
        //查询所有公告
        model.addAttribute("announcementList",announcementManageService.listAllAnnouncement());
        return "index";
    }

    /**
     * 社区服务页
     * @param model
     * @return
     */
    @GetMapping("/serverInfo")
    public String serverInfo(Model model,HttpServletRequest request){
        this.fillCurrentUser(model,request);
        model.addAttribute("serverInfoList",serverInfoManageService.listAllServerInfo());
        return "server-info-list";
    }

    /**
     * 封装当前用户信息
     */
    private void fillCurrentUser(Model model,HttpServletRequest request){
        //从session中获取当前登录的用户
        HttpSession session = request.getSession(true);
        SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
        if (ObjectUtils.isEmpty(securityContext)) {
            model.addAttribute("user", null);
        } else {
            model.addAttribute("user", securityContext.getAuthentication().getPrincipal());
            //角色
            String role = securityContext.getAuthentication().getAuthorities().iterator().next().getAuthority();
            model.addAttribute("role",role);
        }
        //封装管理员信息
        SysUser admin = userManageService.getOneUser(1L);
        model.addAttribute("admin",admin);
    }

    /**
     * 去登陆页
     *
     * @return
     */
    @GetMapping("/toLogin")
    public String toLogin() {
        log.debug("去登陆页面!");
        return "login";
    }

    /**
     * 去注册页面
     *
     * @return
     */
    @GetMapping("/toRegister")
    public String toRegister() {
        log.debug("去注册页面");
        return "register";
    }


    /**
     * 检查登录名
     *
     * @return
     */
    @ResponseBody
    @PostMapping("/checkLoginName")
    public Boolean checkLoginName(String loginName) {
        log.debug("检查登录名：{}", loginName);
        return userManageService.checkLoginName(loginName);
    }

    /**
     * 注册一个用户
     *
     * @param sysUser
     * @return
     */
    @PostMapping("/register")
    public String register(SysUser sysUser) {
        log.debug("开始注册用户，登录名：{}", sysUser.getLoginName());
        //注册的用户统一都是住户角色
        userManageService.saveOneUser(sysUser, SysRole.ROLE_RESIDENT);
        return "redirect:toLogin";
    }

    /**
     * 后台主页,登陆后访问的首页
     *
     * @return
     */
    @GetMapping("/admin/index")
    public String adminIndex() {
        log.debug("去后台主页");
        return "adminIndex";
    }

    /**
     * 仪表盘，欢迎页面
     *
     * @return
     */
    @GetMapping("/admin/dashboard")
    public String dashboard() {
        return "dashboard";
    }


    /**
     * 普通用户去修改密码，跳页面
     * @return
     */
    @GetMapping("/admin/toEditPasswordForUser")
    public String toEditPasswordForUser(Model model,HttpServletRequest request){
        this.fillCurrentUser(model,request);
        log.debug("去修改密码弹框");
        return "edit-password";
    }


    /**
     * 普通用户，去修改个人信息
     * @return
     */
    @GetMapping("/admin/toEditSelfInfoForUser")
    public String toEditSelfInfoForUser(Model model,HttpServletRequest request){
        this.fillCurrentUser(model,request);
        //重新查一下user的信息
        SysUser user = userManageService.getOneUser(Objects.requireNonNull(SecurityUtil.getCurrentUser()).getId());
        model.addAttribute("user",user);
        return "self-info";
    }

    /**
     * 管理员修改密码
     * @return
     */
    @GetMapping("/admin/toEditPasswordForAdmin")
    public String toEditPasswordForAdmin(){
        return "user/edit-password-modal";
    }
}
