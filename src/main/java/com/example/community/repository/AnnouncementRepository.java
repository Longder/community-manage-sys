package com.example.community.repository;

import com.example.community.entity.po.Announcement;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 公告表操作
 */
public interface AnnouncementRepository extends JpaRepository<Announcement,Long> {
}
