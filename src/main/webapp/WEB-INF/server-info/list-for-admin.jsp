<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>服务信息列表</title>
    <jsp:include page="${ctx}/WEB-INF/import/head.jsp"/>
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>服务信息列表</h5>
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
                               data-target="#serverInfoModal"
                               onclick="openModal('${ctx}/admin/serverInfo/toPublish','serverInfoModal')"
                               value="发布服务信息"/>
                        </span>
                    </div>
                    <div class="col-sm-9">

                    </div>
                </div>
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>标题</th>
                        <th>服务类型</th>
                        <th>服务人员</th>
                        <th>预约状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${serverInfoList}" varStatus="status" var="serverInfo">
                            <tr>
                                <td>${status.index+1}</td>
                                <td>${serverInfo.title}</td>
                                <td>
                                    <span class="label ${serverInfo.serverType.label}">${serverInfo.serverType.displayName}</span>
                                </td>
                                <td>${serverInfo.personName}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${serverInfo.subscribed}">
                                            <span class="label label-success">已被预约</span>
                                        </c:when>
                                        <c:when test="${!serverInfo.subscribed}">
                                            <span class="label label-danger">未被预约</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-primary" data-toggle="modal"
                                            data-target="#serverInfoModal"
                                            onclick="openModal('${ctx}/admin/serverInfo/toEdit?serverInfoId=${serverInfo.id}','serverInfoModal')">
                                        修改
                                    </button>
                                    <button type="button" class="btn btn-sm btn-warning" data-toggle="modal"
                                            data-target="#serverInfoModal"
                                            onclick="openModal('${ctx}/admin/comment/showComment?serverInfoId=${serverInfo.id}','serverInfoModal')">
                                        查看评论
                                    </button>
                                    <a href="${ctx}/admin/serverInfo/remove?serverInfoId=${serverInfo.id}" type="button" class="btn btn-sm btn-danger" onclick="return confirm('确定删除该服务信息吗？')">
                                        删除
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="serverInfoModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
<jsp:include page="${ctx}/WEB-INF/import/script.jsp"/>
</body>
</html>
