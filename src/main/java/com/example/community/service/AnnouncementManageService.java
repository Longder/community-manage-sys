package com.example.community.service;

import com.example.community.entity.po.Announcement;

import java.util.List;

/**
 * 公告管理相关业务
 */
public interface AnnouncementManageService {

    /**
     * 查询所有公告
     * @return
     */
    List<Announcement> listAllAnnouncement();

    /**
     * 发布一个公告
     * @param announcement
     */
    void publishOneAnnouncement(Announcement announcement);

    /**
     * 获取一个公告
     * @param announcementId
     * @return
     */
    Announcement getOneAnnouncement(Long announcementId);


    /**
     * 编辑一个公告
     * @param announcement
     */
    void editOneAnnouncement(Announcement announcement);

    /**
     * 删除一个公告
     * @param announcementId
     */
    void removeOneAnnouncement(Long announcementId);
}
