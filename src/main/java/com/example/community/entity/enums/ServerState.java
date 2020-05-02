package com.example.community.entity.enums;

/**
 * 服务状态枚举
 */
public enum ServerState {
    SERVING("SERVING","服务中","label-warning"),
    COMPLETE("COMPLETE","完成","label-success");

    /**
     * 名称
     */
    private String name;
    /**
     * 展示名
     */
    private String displayName;
    /**
     * 标签
     */
    private String label;

    ServerState(String name, String displayName, String label) {
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
}
