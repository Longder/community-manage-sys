<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>社区服务管理系统 - 登录</title>
    <link href="${ctx}/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${ctx}/static/css/animate.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css?v=4.1.0" rel="stylesheet">
    <link>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">社+</h1>
        </div>
        <h3>社区服务管理系统</h3>
        <form id="login-form" class="m-t" role="form" action="${ctx}login_check" method="post" target="_self">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="用户名" name="username" id="username"/>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" name="password">
            </div>
            <span class="text-danger">${SPRING_SECURITY_LAST_EXCEPTION.message}</span>
            <button id="login-button" type="submit" class="btn btn-primary block full-width m-b">登 录</button>
            <p class="text-muted text-center">
                <a href="${ctx}toRegister">注册一个新账号</a>
            </p>
        </form>
    </div>
</div>

<script src="${ctx}/static/js/jquery.min.js?v=2.1.4"></script>
<script src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
</body>
</html>

