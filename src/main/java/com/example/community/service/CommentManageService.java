package com.example.community.service;



import com.example.community.entity.po.ServerComment;

import java.util.List;

/**
 * 评论管理的业务服务service
 */
public interface CommentManageService {

    /**
     * 添加一条评论
     * @param serverComment
     */
    void addOneComment(ServerComment serverComment);

    /**
     * 查看某服务的评价列表
     * @param serverInfoId 服务id
     * @return 评价集合
     */
    List<ServerComment> listAllComment(Long serverInfoId);
}
