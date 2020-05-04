package com.example.community.entity.po;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.time.LocalDateTime;

/**
 * 公告实体
 */
@Entity
@Data
@Table(name = "ANNOUNCEMENT")
public class Announcement extends BaseIdEntity{

    /**
     * 公告标题
     */
    @Column(name = "title_")
    private String title;

    /**
     * 公告内容
     */
    @Column(name = "content_")
    private String content;

    /**
     * 发布时间
     */
    @Column(name = "announce_time_")
    public LocalDateTime announceTime;
}
