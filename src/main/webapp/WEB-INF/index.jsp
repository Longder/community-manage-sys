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
                <div class="row">
                    <div class="col-sm-6">
                        <div class="navbar-header">
                            <button aria-controls="navbar" aria-expanded="false" class="navbar-toggle collapsed"
                                    data-target="#navbar"
                                    data-toggle="collapse" type="button">
                                <i class="fa fa-reorder"></i>
                            </button>
                            <a class="navbar-brand" href="#">社区管理系统</a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <ul class="nav navbar-top-links navbar-right">
                            <li class="active">
                                <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/">
                                    <i class="fa fa-server"></i> 首页
                                </a>
                            </li>
                            <c:if test="${!empty user && role=='ROLE_RESIDENT'}">
                                <!--购物车模块-->
                                <li class="dropdown">
                                    <a aria-expanded="false" class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                        <i class="fa fa-cart-arrow-down"></i> 购物车
                                    </a>
                                    <ul class="dropdown-menu dropdown-messages" data-stopPropagation="true"
                                        id="shopping-cart-ul">
                                        <li>
                                            <div class="dropdown-messages-box">
                                                <a class="pull-left" href="#">
                                                    <img alt="image" class="img-circle" src="static/img/a4.jpg">
                                                </a>
                                                <div class="media-body ">
                                                    <strong>商品名称</strong>
                                                    <br/>
                                                    <small class="text-muted">
                                                        <button class="btn btn-warning btn-sm" data-stopPropagation="true"
                                                                style="display:inline-block" type="button"><i
                                                                class="fa fa-minus"></i>
                                                        </button>
                                                        <input class="form-control" readonly
                                                               style="display:inline-block;width:70px;"
                                                               type="number" value="1"/>
                                                        <button class="btn btn-primary btn-sm" data-stopPropagation="true"
                                                                style="display:inline-block" type="button"><i
                                                                class="fa fa-plus"></i>
                                                        </button>
                                                        <button class="btn btn-danger btn-sm" data-stopPropagation="true"
                                                                style="display:inline-block" type="button">
                                                            <i class="fa fa-remove"></i>删除
                                                        </button>
                                                    </small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <div class="dropdown-messages-box">
                                                <a class="pull-left" href="profile.html">
                                                    <img alt="image" class="img-circle" src="static/img/a4.jpg">
                                                </a>
                                                <div class="media-body ">
                                                    <strong>商品名称</strong>
                                                    <br/>
                                                    <small class="text-muted">
                                                        <button class="btn btn-warning btn-sm" data-stopPropagation="true"
                                                                style="display:inline-block" type="button"><i
                                                                class="fa fa-minus"></i>
                                                        </button>
                                                        <input class="form-control" readonly
                                                               style="display:inline-block;width:70px;"
                                                               type="number" value="1"/>
                                                        <button class="btn btn-primary btn-sm" data-stopPropagation="true"
                                                                style="display:inline-block" type="button"><i
                                                                class="fa fa-plus"></i>
                                                        </button>
                                                        <button class="btn btn-danger btn-sm" data-stopPropagation="true"
                                                                style="display:inline-block" type="button">
                                                            <i class="fa fa-remove"></i>删除
                                                        </button>
                                                    </small>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <div class="text-center link-block">
                                                <a class="J_menuItem" data-index="88" href="order.html">
                                                    <i class="fa fa-cny"></i> <strong> 去结算</strong>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/serverInfo">
                                        <i class="fa fa-hand-paper-o"></i> 社区服务
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/admin/appointment/listMyAppointment">
                                        <i class="fa fa-hand-lizard-o"></i> 我的服务
                                    </a>
                                </li>
                                <li class="dropdown">
                                    <a aria-expanded="false" role="button" href="#"
                                       class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-user"></i>个人中心<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="${ctx}/admin/toEditSelfInfoForUser">基本信息</a>
                                        </li>
                                        <li>
                                            <a href="${ctx}/admin/toEditPasswordForUser">修改密码</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${empty user}">
                                <li class="dropdown hidden-xs">
                                    <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/toLogin">
                                        <i class="fa fa-sign-in"></i> 请登录
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${!empty user}">
                                <li class="dropdown hidden-xs">
                                    <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/logout">
                                        <i class="fa fa-sign-in"></i> 登出
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${!empty user && role=='ROLE_ADMIN'}">
                                <li class="hidden-xs">
                                    <a aria-expanded="false" class="right-sidebar-toggle" target="_blank" href="${ctx}/admin/index">
                                        <i class="fa fa-bank"></i> 网站后台
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="container">
                <h2>社区超市</h2>
                <div class="row">
                    <c:forEach items="${goodsList}" var="goods">
                        <div class="col-sm-4">
                            <div class="contact-box">
                                <a href="profile.html">
                                    <div class="col-sm-7">
                                        <div class="text-center">
                                            <img alt="image" style="width: 160px;height:160px;"
                                                 src="${goods.image}">
                                        </div>
                                    </div>
                                </a>
                                <div class="col-sm-5">
                                    <a href="#">
                                        <h3><strong>${goods.name}</strong></h3>
                                    </a>
                                    <p>
                                        <strong>
                                            <span class="label ${goods.type.label}">${goods.type.displayName}</span>
                                        </strong>
                                    </p>
                                    <p>单价：<span class="text-danger">￥${goods.unitPrice}</span></p>
                                    <p>库存：<span class="text-primary">${goods.count}</span></p>
                                    <p>${goods.describe}</p>
                                    <c:if test="${!empty user && role=='ROLE_RESIDENT'}">
                                        <a class="btn btn-success btn-warning add-cart-button"
                                           data-goodsid="${goods.id}">
                                            <i class="fa fa-cart-plus"> </i> 加入购物车
                                        </a>
                                    </c:if>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <h2>社区公告</h2>
                                <div class="hr-line-dashed"></div>
                                <c:forEach items="${announcementList}" var="announcement">
                                    <div class="search-result">
                                        <h3><a>${announcement.title}</a></h3>
                                        <p>${announcement.content}</p>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="pull-right">
        &nbsp&nbsp管理员邮箱：<a href="">${admin.email}</a><span> </span>
    </div>
    <div class="pull-right">
        管理员手机号：<a href="">${admin.phone}</a>
    </div>
</div>
<div class="modal inmodal fade" id="editPasswordModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
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

    function test(){
        alert('test!');
    }

</script>
</body>
</html>
