<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html lang="zh">
<head>
    <title>社区管理系统</title>
    <jsp:include page="${ctx}/WEB-INF/import/head.jsp"/>
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>订单列表</h5>
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
                <div class="table table-bordered table-hover">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>商品名称</th>
                            <th>买家</th>
                            <th>数量</th>
                            <th>总价</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orderList}" var="order" varStatus="status">
                            <tr>
                                <td>${status.index+1}</td>
                                <td>${order.goods.name}</td>
                                <td>${order.buyer.name}</td>
                                <td>${order.count}</td>
                                <td>￥<span>${order.total}</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--引入统一JS-->
<jsp:include page="${ctx}/WEB-INF/import/script.jsp"/>
</body>
</html>