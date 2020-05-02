package com.example.community.entity.po;

import org.springframework.security.core.GrantedAuthority;

/**
 * 系统角色枚举
 */
public enum SysRole implements GrantedAuthority {
    ROLE_ADMIN("ROLE_ADMIN", "系统管理员", "label-info"),
    ROLE_RESIDENT("ROLE_RESIDENT", "住戶", "label-success");

    /**
     * 名称
     */
    private String name;
    /**
     * 展示名
     */
    private String displayName;
    /**
     * 展示用的标签class
     */
    private String label;


    SysRole(String name, String displayName, String label) {
        this.name = name;
        this.displayName = displayName;
        this.label = label;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    @Override
    public String getAuthority() {
        return this.name;
    }
}
