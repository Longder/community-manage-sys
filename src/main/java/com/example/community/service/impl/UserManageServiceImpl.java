package com.example.community.service.impl;

import com.example.community.entity.po.SysRole;
import com.example.community.entity.po.SysUser;
import com.example.community.entity.po.SysUserRole;
import com.example.community.repository.SysUserRepository;
import com.example.community.repository.SysUserRoleRepository;
import com.example.community.service.UserManageService;
import com.example.community.util.EncryptionUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserManageServiceImpl implements UserManageService {

    @Resource
    private SysUserRepository sysUserRepository;
    @Resource
    private SysUserRoleRepository sysUserRoleRepository;

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

    /**
     * 检查登录名
     *
     * @param loginName 登录名
     * @return true:可以注册  false：不能注册
     */
    @Override
    public Boolean checkLoginName(String loginName) {
        SysUser sysUser = sysUserRepository.getByLoginName(loginName);
        return ObjectUtils.isEmpty(sysUser);
    }

    /**
     * 保存一个用户，新增和修改都可用
     *
     * @param sysUser
     * @param role
     */
    @Override
    @Transactional
    public void saveOneUser(SysUser sysUser, SysRole role) {
        if(ObjectUtils.isEmpty(sysUser.getId())){//空的 新增
            //处理下密码
            sysUser.setPassword(EncryptionUtil.encrypt(sysUser.getPassword().trim()));
            //存用户
            sysUserRepository.save(sysUser);
            SysUserRole userRole = new SysUserRole(sysUser,role);
            //存角色
            sysUserRoleRepository.save(userRole);
        }else{
            //修改，只修改email和真是姓名
            SysUser dbUser = sysUserRepository.findById(sysUser.getId()).orElseThrow(RuntimeException::new);
            dbUser.setName(sysUser.getName());
            dbUser.setEmail(sysUser.getEmail());
            sysUserRepository.save(dbUser);
        }
    }

    /**
     * 查询获取一个用户
     *
     * @param userId 用户Id
     * @return 用户对象
     */
    @Override
    public SysUser getOneUser(Long userId) {
        return sysUserRepository.findById(userId).orElseThrow(RuntimeException::new);
    }
}
