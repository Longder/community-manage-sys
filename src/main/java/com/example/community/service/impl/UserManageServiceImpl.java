package com.example.community.service.impl;

import com.example.community.entity.po.SysUser;
import com.example.community.repository.SysUserRepository;
import com.example.community.service.UserManageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserManageServiceImpl implements UserManageService {

    @Resource
    private SysUserRepository sysUserRepository;

    /**
     * 查询所有用户
     *
     * @return 用户集合
     */
    @Override
    public List<SysUser> listAllUser() {
        List<SysUser> sysUserList = sysUserRepository.findAll();
        //封装展示用的角色
        sysUserList.forEach(SysUser::fillRole);
        return sysUserList;
    }
}
