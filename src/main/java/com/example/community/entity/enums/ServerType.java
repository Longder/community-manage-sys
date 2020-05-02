package com.example.community.entity.enums;

/**
 * 服务类型
 */
public enum ServerType {
    HOUSE_KEEPING("HOUSE_KEEPING","家政服务","label-success"),
    UNLOCKING("UNLOCKING","开锁服务","label-success"),
    MAINTAIN("MAINTAIN","维修服务","label-success"),;
    /**
     * 名称
     */
    private String name;
    /**
     * 展示名
     */
    private String displayName;
    /**
     * 标签样式
     */
    private String label;

    ServerType(String name, String displayName, String label) {
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
