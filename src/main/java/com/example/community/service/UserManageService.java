package com.example.community.service;

import com.example.community.entity.po.SysUser;

import java.util.List;

public interface UserManageService {

    /**
     * 查询所有用户
     * @return 用户集合
     */
    List<SysUser> listAllUser();
}
