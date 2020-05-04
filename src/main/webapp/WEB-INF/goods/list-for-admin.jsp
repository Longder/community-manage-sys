<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <title>商品列表</title>
    <jsp:include page="${ctx}/WEB-INF/import/head.jsp"/>
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>商品列表</h5>
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
                               data-target="#goodsModal"
                               onclick="openModal('${ctx}/admin/goods/toAdd','goodsModal')"
                               value="新增商品"/>
                        </span>
                    </div>
                    <div class="col-sm-9">

                    </div>
                </div>
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>名称</th>
                        <th>类型</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${goodsList}" var="goods" varStatus="status">
                        <tr>
                            <td>${status.index+1}</td>
                            <td>${goods.name}</td>
                            <td>
                                <span class="label ${goods.type.label}">${goods.type.displayName}</span>
                            </td>
                            <td>${goods.unitPrice}</td>
                            <td>${goods.count}</td>
                            <td>
                                <button type="button" class="btn btn-sm btn-warning" data-toggle="modal"
                                        data-target="#goodsModal"
                                        onclick="openModal('${ctx}/admin/goods/toEdit?goodsId=${goods.id}','goodsModal')">
                                    编辑
                                </button>
                                <button type="button" class="btn btn-sm btn-success" data-toggle="modal"
                                        data-target="#goodsModal"
                                        onclick="openModal('${ctx}/admin/goods/toEditCount?goodsId=${goods.id}','goodsModal')">
                                    修改库存
                                </button>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="goodsModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
<jsp:include page="${ctx}/WEB-INF/import/script.jsp"/>
</body>
</html>
