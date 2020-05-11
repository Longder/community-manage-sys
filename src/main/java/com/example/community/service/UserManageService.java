package com.example.community.service;

import com.example.community.entity.po.SysRole;
import com.example.community.entity.po.SysUser;

import java.util.List;

public interface UserManageService {

    /**
     * 查询所有用户
     * @return 用户集合
     */
    List<SysUser> listAllUser();


    /**
     * 检查登录名
     * @param loginName 登录名
     * @return true:可以注册  false：不能注册
     */
    Boolean checkLoginName(String loginName);

    /**
     * 保存一个用户，新增和修改都可用
     * @param sysUser 用户对象
     * @param role 角色
     */
    void saveOneUser(SysUser sysUser, SysRole role);


    /**
     * 查询获取一个用户
     * @param userId 用户Id
     * @return 用户对象
     */
    SysUser getOneUser(Long userId);

    /**
     * 修改密码
     * @param newPassword
     */
    void changePassword(String newPassword);

    /**
     * 注销一个用户，关联信息全部删除
     * @param userId
     */
    void cancelOneUser(Long userId);
}
