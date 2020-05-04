package com.example.community.service.impl;

import com.example.community.entity.po.Announcement;
import com.example.community.repository.AnnouncementRepository;
import com.example.community.service.AnnouncementManageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 公告管理相关业务
 */
@Service
public class AnnouncementManageServiceImpl implements AnnouncementManageService {

    @Resource
    private AnnouncementRepository announcementRepository;

    /**
     * 查询所有公告
     *
     * @return
     */
    @Override
    public List<Announcement> listAllAnnouncement() {
        return announcementRepository.findAll();
    }

    /**
     * 发布一个公告
     *
     * @param announcement
     */
    @Override
    @Transactional
    public void publishOneAnnouncement(Announcement announcement) {
        //发布时间
        announcement.setAnnounceTime(LocalDateTime.now());
        announcementRepository.save(announcement);
    }

    /**
     * 获取一个公告
     *
     * @param announcementId
     * @return
     */
    @Override
    public Announcement getOneAnnouncement(Long announcementId) {
        return announcementRepository.getOne(announcementId);
    }

    /**
     * 编辑一个公告
     *
     * @param announcement
     */
    @Override
    @Transactional
    public void editOneAnnouncement(Announcement announcement) {
        announcement.setAnnounceTime(LocalDateTime.now());
        announcementRepository.save(announcement);
    }

    /**
     * 删除一个公告
     *
     * @param announcementId
     */
    @Override
    @Transactional
    public void removeOneAnnouncement(Long announcementId) {
        announcementRepository.deleteById(announcementId);
    }
}
