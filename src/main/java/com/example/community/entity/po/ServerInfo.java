package com.example.community.entity.po;

import com.example.community.entity.enums.ServerType;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 服务信息实体
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "SERVER_INFO")
public class ServerInfo extends BaseIdEntity {
    /**
     * 标题
     */
    @Column(name = "title_")
    private String title;
    /**
     * 服务人员姓名
     */
    @Column(name = "person_name_")
    private String personName;

    /**
     * 描述
     */
    @Column(name = "description_")
    private String description;

    /**
     * 服务类型
     */
    @Enumerated(EnumType.STRING)
    @Column(name = "server_type_")
    private ServerType serverType;

    /**
     * 信息发布时间
     */
    @Column(name = "publish_time_")
    private LocalDateTime publishTime;

    /**
     * 是否已被预约
     */
    @Column(name = "subscribed_")
    private Boolean subscribed;
}
