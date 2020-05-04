package com.example.community.entity.po;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.time.LocalDate;

/**
 * 服务评价实体
 */
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "SERVER_COMMENT")
@Data
public class ServerComment extends BaseIdEntity{

    /**
     * 关联服务信息
     */
    @ManyToOne
    @JoinColumn(name = "server_info_id_")
    private ServerInfo serverInfo;

    /**
     * 评论内容
     */
    @Column(name = "content_")
    private String content;

    /**
     * 关联评论人（雇主）
     */
    @ManyToOne
    @JoinColumn(name = "employer_id_")
    private SysUser employer;

    /**
     * 评论日期
     */
    @Column(name = "comment_date_")
    private LocalDate commentDate;

    /**
     * 预约id，传递用，不持久化
     */
    @Transient
    private Long appointmentId;
}
