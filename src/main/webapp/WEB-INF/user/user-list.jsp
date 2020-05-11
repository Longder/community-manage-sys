<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>用户列表</title>
    <jsp:include page="${ctx}/WEB-INF/import/head.jsp"/>
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>用户列表</h5>
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
                    </div>
                    <div class="col-sm-9">
                    </div>
                </div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>登录名</th>
                        <th>姓名</th>
                        <th>角色</th>
                        <th>邮箱</th>
                        <th>电话</th>
                        <th>门牌号</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user" varStatus="status">
                        <tr>
                            <td>${status.index+1}</td>
                            <td>${user.loginName}</td>
                            <td>${user.name}</td>
                            <td>
                                <span class="label ${user.role.label}">${user.role.displayName}</span>
                            </td>
                            <td>${user.email}</td>
                            <td>${user.phone}</td>
                            <td>${user.houseNo}</td>
                            <td>
                                <c:if test="${user.role.name!='ROLE_ADMIN'}">
                                    <button type="button" class="btn btn-sm btn-warning" data-toggle="modal"
                                            data-target="#userModal"
                                            onclick="openModal('${ctx}/admin/user/toEdit?userId=${user.id}','userModal')">
                                        修改
                                    </button>
                                    <a onclick="return confirm('确定注销该用户吗？所有关联信息将被删除')" href="${ctx}/admin/user/cancelUser?userId=${user.id}" type="button" class="btn btn-sm btn-danger">
                                        注销
                                    </a>
                                </c:if>
                                <c:if test="${user.role.name == 'ROLE_ADMIN'}">
                                    <button type="button" class="btn btn-sm btn-default" data-toggle="modal"
                                            data-target="#userModal"
                                            onclick="openModal('${ctx}/admin/user/toEditAdmin?userId=${user.id}','userModal')">
                                        修改管理员信息
                                    </button>

                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="userModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
<jsp:include page="${ctx}/WEB-INF/import/script.jsp"/>
</body>
</html>
