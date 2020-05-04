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
<body class="gray-bg top-navigation">
<div id="wrapper">
    <div id="page-wrapper" class="gray-bg" style="min-height:1000px;">
        <div class="row border-bottom white-bg">
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse"
                            class="navbar-toggle collapsed" type="button">
                        <i class="fa fa-reorder"></i>
                    </button>
                    <a href="#" class="navbar-brand">社区管理系统</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a aria-expanded="false" role="button" href="${ctx}/"> 返回首页</a>
                    </li>
                </ul>
                <ul class="nav navbar-top-links navbar-right">
                    <c:if test="${!empty user}">
                        <li class="dropdown hidden-xs">
                            <a aria-expanded="false" class="right-sidebar-toggle" target="_self">欢迎登陆</a>
                        </li>
                    </c:if>
                    <li class="dropdown hidden-xs">
                        <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/logout">
                            <i class="fa fa-sign-in"></i> 登出
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row" style="margin-top: 100px;">
            <div class="col-sm-12">
                <div class="ibox-content p-xl">
                    <div class="table-responsive m-t">
                        <table class="table invoice-table">
                            <thead>
                            <tr>
                                <th>商品名称</th>
                                <th>数量</th>
                                <th>单价</th>
                                <th>总价</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${cartList}" var="detail">
                                <tr>
                                    <td>
                                        <div><strong>${detail.goods.name}</strong></div>
                                    </td>
                                    <td>${detail.count}</td>
                                    <td>¥<span>${detail.goods.unitPrice}</span></td>
                                    <td>¥<span>${detail.price}</span></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!-- /table-responsive -->

                    <table class="table invoice-total">
                        <tbody>
                        <tr>
                            <td><strong>总价：</strong>
                            </td>
                            <td>¥<span>${total}</span></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="text-right">
                        <form method="post" action="${ctx}/order/submit">
                            <button onclick="return confirm('确定提交订单吗？');" class="btn btn-primary" type="submit"><i class="fa fa-dollar"></i> 结算订单</button>
                        </form>
                    </div>

                    <div class="well m-t"><strong>注意：</strong> 请在30日内完成付款，否则订单会自动取消。
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--引入统一JS-->
<script th:replace="import/script :: script"></script>

</body>
</html>