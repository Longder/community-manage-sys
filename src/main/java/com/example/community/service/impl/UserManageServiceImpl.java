package com.example.community.service.impl;

import com.example.community.entity.po.*;
import com.example.community.repository.*;
import com.example.community.security.SecurityUtil;
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
    @Resource
    private AppointmentRepository appointmentRepository;
    @Resource
    private OrderDetailRepository orderDetailRepository;
    @Resource
    private ServerCommentRepository serverCommentRepository;
    @Resource
    private ShoppingCartDetailRepository shoppingCartDetailRepository;

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
            //修改，只修改email、真实姓名、手机号和门牌号
            SysUser dbUser = sysUserRepository.findById(sysUser.getId()).orElseThrow(RuntimeException::new);
            dbUser.setName(sysUser.getName());
            dbUser.setEmail(sysUser.getEmail());
            dbUser.setHouseNo(sysUser.getHouseNo());
            dbUser.setPhone(sysUser.getPhone());
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

    /**
     * 修改密码
     *
     * @param newPassword
     */
    @Override
    @Transactional
    public void changePassword(String newPassword) {
        SysUser sysUser = SecurityUtil.getCurrentUser();
        assert sysUser != null;
        sysUser.setPassword(EncryptionUtil.encrypt(newPassword.trim()));
        sysUserRepository.save(sysUser);
    }

    /**
     * 注销一个用户，关联信息全部删除
     *
     * @param userId
     */
    @Override
    @Transactional
    public void cancelOneUser(Long userId) {
        //预约信息 appointment
        List<Appointment> appointmentList = appointmentRepository.listByEmployerId(userId);
        appointmentRepository.deleteInBatch(appointmentList);
        //订单  orderDetail
        List<OrderDetail> orderDetailList = orderDetailRepository.listByBuyerId(userId);
        orderDetailRepository.deleteInBatch(orderDetailList);
        //服务评价 ServerComment
        List<ServerComment> serverCommentList = serverCommentRepository.listByEmpId(userId);
        serverCommentRepository.deleteInBatch(serverCommentList);
        //购物车详情 ShoppingCartDetail
        List<ShoppingCartDetail> shoppingCartDetailList = shoppingCartDetailRepository.listByBuyerId(userId);
        shoppingCartDetailRepository.deleteInBatch(shoppingCartDetailList);
        //用户
        sysUserRepository.deleteById(userId);
    }
}
