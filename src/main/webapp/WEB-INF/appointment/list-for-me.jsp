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
    <div class="gray-bg" id="page-wrapper" style="min-height:1000px;">
        <div class="row border-bottom white-bg">
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button aria-controls="navbar" aria-expanded="false" class="navbar-toggle collapsed"
                            data-target="#navbar"
                            data-toggle="collapse" type="button">
                        <i class="fa fa-reorder"></i>
                    </button>
                    <a class="navbar-brand" href="#">社区管理系统</a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/">
                            <i class="fa fa-server"></i> 首页
                        </a>
                    </li>
                    <li class="dropdown">
                        <a aria-expanded="false" class="right-sidebar-toggle" target="_self"
                           href="${ctx}/serverInfo">
                            <i class="fa fa-hand-paper-o"></i> 社区服务
                        </a>
                    </li>
                    <li class="active">
                        <a aria-expanded="false" class="right-sidebar-toggle" target="_self"
                           href="${ctx}/admin/appointment/listMyAppointment">
                            <i class="fa fa-hand-lizard-o"></i> 我的服务
                        </a>
                    </li>
                    <li class="dropdown hidden-xs">
                        <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/logout">
                            <i class="fa fa-sign-in"></i> 登出
                        </a>
                    </li>

                </ul>
            </nav>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="container">
                <h2>社区服务</h2>
                <div class="row">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h4>所有服务列表</h4>
                        </div>
                        <div class="ibox-content">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>标题</th>
                                    <th>服务内容</th>
                                    <th>服务人员</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${appointmentList}" var="appointment" varStatus="status">
                                    <td>${status.index+1}</td>
                                    <td>${appointment.serverInfo.title}</td>
                                    <td>${appointment.serverInfo.description}</td>
                                    <td>${appointment.serverInfo.personName}</td>
                                    <td>
                                        <span class="label ${appointment.serverState.label}">${appointment.serverState.displayName}</span>
                                    </td>
                                    <td>
                                        <c:if test="${appointment.serverState.name =='SERVING'}">
                                            <a href="${ctx}/admin/appointment/complete?appointmentId=${appointment.id}"
                                               onclick="return confirm('确定完成此家政服务吗？')"
                                               class="btn btn-sm btn-primary">完成服务</a>
                                        </c:if>
                                        <c:if test="${!appointment.commented&&appointment.serverState.name=='COMPLETE'}">
                                            <button type="button" class="btn btn-sm btn-success" data-toggle="modal"
                                                    data-target="#commentModal"
                                                    onclick="openModal('${ctx}/admin/comment/toAdd?appointmentId=${appointment.id}','commentModal')">
                                                填写服务评价
                                            </button>
                                        </c:if>
                                    </td>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="commentModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
<!--引入统一JS-->
<jsp:include page="${ctx}/WEB-INF/import/script.jsp"/>
<script>
    $(function () {
        $('.dropdown-menu').click(function (e) {
            e.stopPropagation();
        });

        //加入购物车按钮点击事件
        $(".add-cart-button").click(function () {
            console.log("添加购物车！");

            addToShoppingCart($(this).data("goodsid"));
        });


        loadShoppingCart();

    });

    //加载购物车内容
    function loadShoppingCart() {
        $.ajax({
            type: "post",
            url: "/shoppingCart/list",
            async: true,
            success: function (data) {

                $("#shopping-cart-ul").empty();
                if (data && data.length > 0) {
                    console.log(data);
                    for (var i = 0; i < data.length; i++) {
                        var li = '<li>\n' +
                            '                                <div class="dropdown-messages-box">' +
                            '                                    <a class="pull-left" href="#">' +
                            '                                        <img alt="image" class="img-circle" src="' + data[i].goods.image + '">' +
                            '                                    </a>' +
                            '                                    <div class="media-body ">' +
                            '                                        <strong>' + data[i].goods.name + '</strong>' +
                            '                                        <br/>' +
                            '                                        <small class="text-muted">' +
                            '                                            <button class="btn btn-warning btn-sm" data-stopPropagation="true"' +
                            '                                                    style="display:inline-block" type="button" onclick="reduceCount(' + data[i].id + ')"><i' +
                            '                                                    class="fa fa-minus"></i>' +
                            '                                            </button>' +
                            '                                            <input class="form-control" readonly style="display:inline-block;width:70px;"' +
                            '                                                   type="number" value="' + data[i].count + '"/>' +
                            '                                            <button class="btn btn-primary btn-sm" data-stopPropagation="true"' +
                            '                                                    style="display:inline-block" type="button" onclick="addCount(' + data[i].id + ')"><i' +
                            '                                                    class="fa fa-plus"></i>' +
                            '                                            </button>\n' +
                            '                                            <button class="btn btn-danger btn-sm" data-stopPropagation="true"' +
                            '                                                    style="display:inline-block" type="button" onclick="removeFromCart(' + data[i].id + ')">' +
                            '                                                <i class="fa fa-remove"></i>删除' +
                            '                                            </button>' +
                            '                                        </small>' +
                            '                                    </div>' +
                            '                                </div>' +
                            '                            </li>';
                        $("#shopping-cart-ul").append(li);
                        $("#shopping-cart-ul").append('<li class="divider"></li>');
                    }

                    //结算
                    var li = '                            <li>' +
                        '                                <div class="text-center link-block">' +
                        '                                    <a class="J_menuItem" data-index="88" href="/order/init">' +
                        '                                        <i class="fa fa-cny"></i> <strong> 去结算</strong>' +
                        '                                    </a>' +
                        '                                </div>' +
                        '                            </li>';
                    $("#shopping-cart-ul").append(li);
                } else {
                    console.log("没数据");
                    var li = '                            <li>' +
                        '                                <div class="text-center link-block">' +
                        '                                    <a class="J_menuItem" data-index="88">' +
                        '                                        <strong>您还未添加商品</strong>' +
                        '                                    </a>' +
                        '                                </div>' +
                        '                            </li>';
                    $("#shopping-cart-ul").append(li);
                }
            }
        });
    }

    //添加到购物车的方法
    function addToShoppingCart(goodsId) {
        $.ajax({
            type: "post",
            url: "/shoppingCart/add",
            data: {goodsId: goodsId},
            async: true,
            success: function (data) {
                if (data === 'ok') {
                    loadShoppingCart();
                }

            }
        });
    }

    /**
     * 增加数量
     */
    function addCount(detailId) {
        $.ajax({
            type: "post",
            url: "/shoppingCart/addCount",
            data: {detailId: detailId},
            async: true,
            success: function (data) {
                if (data === 'ok') {
                    loadShoppingCart();
                }

            }
        });
    }

    /**
     * 减少数量
     */
    function reduceCount(detailId) {
        $.ajax({
            type: "post",
            url: "/shoppingCart/reduceCount",
            data: {detailId: detailId},
            async: true,
            success: function (data) {
                if (data === 'ok') {
                    loadShoppingCart();
                }

            }
        });
    }

    /**
     * 移除某个商品
     */
    function removeFromCart(detailId) {
        $.ajax({
            type: "post",
            url: "/shoppingCart/remove",
            data: {detailId: detailId},
            async: true,
            success: function (data) {
                if (data === 'ok') {
                    loadShoppingCart();
                }

            }
        });
    }
</script>
</body>
</html>
