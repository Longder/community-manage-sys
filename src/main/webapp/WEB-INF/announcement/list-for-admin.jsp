<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>公告列表</title>
    <jsp:include page="${ctx}/WEB-INF/import/head.jsp"/>
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>公告列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="col-sm-3">
                        <span class="input-group-btn">
                        <input type="button" class="btn btn-success" data-toggle="modal"
                               data-target="#announcementModal"
                               onclick="openModal('${ctx}/admin/announcement/toPublish','announcementModal')"
                               value="发布公告"/>
                        </span>
                    </div>
                    <div class="col-sm-9">

                    </div>
                </div>
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>公告标题</th>
                        <th>公告内容</th>
                        <th>发布时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${announcementList}" var="announcement" varStatus="status">
                            <tr>
                                <td>${status.index+1}</td>
                                <td>${announcement.title}</td>
                                <td>${announcement.content}</td>
                                <td>
                                    <javatime:format value="${announcement.announceTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                                </td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-warning" data-toggle="modal"
                                            data-target="#announcementModal"
                                            onclick="openModal('${ctx}/admin/announcement/toEdit?announcementId=${announcement.id}','announcementModal')">
                                        编辑
                                    </button>
                                    <a href="${ctx}/admin/announcement/remove?announcementId=${announcement.id}"
                                       onclick="return confirm('确定删除此公告吗?')"
                                       type="button" class="btn btn-sm btn-danger">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="announcementModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
<jsp:include page="${ctx}/WEB-INF/import/script.jsp"/>
</body>
</html>
