package com.example.community.entity.po;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Collection;
import java.util.List;

/**
 * 用户实体类
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "SYS_USER")
public class SysUser extends BaseIdEntity implements UserDetails {

    /**
     * 姓名
     */
    @Column(name = "name_")
    private String name;

    /**
     * 登录名
     */
    @Column(name = "login_name_")
    private String loginName;

    /**
     * 登陆密码
     */
    @Column(name = "password_")
    private String password;

    /**
     * 邮箱
     */
    @Column(name = "email_")
    private String email;
    /**
     * 创建时间
     */
    @Column(name = "create_date")
    private LocalDate createDate;

    /**
     * 门牌号
     */
    @Column(name = "house_no_")
    private String houseNo;

    /**
     * 电话
     */
    @Column(name = "phone_")
    private String phone;

    /**
     * 角色，单个，展示用
     */
    @Transient
    private SysRole role;
    /**
     * 用户角色（多个）
     */
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "sysUser", cascade = CascadeType.ALL)
    private List<SysUserRole> roles;

    /**
     * 封装角色，把roles中的元素放到role中，方便页面展示
     */
    public void fillRole() {
        this.role = roles.get(0).getRole();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return this.loginName;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
