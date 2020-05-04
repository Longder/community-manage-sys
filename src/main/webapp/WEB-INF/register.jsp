<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>社区管理系统 - 注册</title>
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.css" rel="stylesheet">
    <link href="${ctx}/static/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${ctx}/static/css/animate.css" rel="stylesheet">
    <link href="${ctx}/static/css/style.css" rel="stylesheet">
    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>

</head>

<body class="gray-bg">

<div class="middle-box loginscreen animated fadeInDown" style="margin-top: 0">
    <div>
        <div class="text-center">
            <h1 class="logo-name">社+</h1>
        </div>
        <h3 class="text-center">欢迎注册社区管理系统</h3>
        <form class="m-t" role="form" id="register-form" action="${ctx}/register" method="post">
            <div class="form-group">
                <label>登录名</label>
                <input name="loginName" type="text" class="form-control" placeholder="请输入登录名"/>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input id="password" name="password" type="password" class="form-control" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <label>确认密码</label>
                <input type="password" class="form-control" placeholder="请再次输入密码" name="passwordAgain">
            </div>
            <div class="form-group">
                <label>真实姓名</label>
                <input name="name" type="text" class="form-control" placeholder="请输入真实姓名"/>
            </div>
            <div class="form-group">
                <label>邮箱</label>
                <input name="email" type="email" class="form-control" placeholder="请输入邮箱"/>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>
            <p class="text-muted text-center">
                <small>已经有账户了？</small>
                <a href="${ctx}/toLogin">点此登录</a>
            </p>
        </form>
    </div>
</div>

<!-- 全局js -->
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${ctx}/static/js/plugins/iCheck/icheck.min.js"></script>
<!--Validate-->
<script src="${ctx}/static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${ctx}/static/js/plugins/validate/messages_zh.min.js"></script>
<script>
    //自定义登录名重复认证
    jQuery.validator.addMethod("checkLoginName", function (value, element) {
        var flag = false;
        $.ajax({
            type: "post",
            url: "/checkLoginName",
            data: {loginName: value},
            async: false,
            success: function (data) {
                if (data === false) {
                    flag = false;
                } else {
                    flag = true;
                }
            }
        });
        return flag;
    }, "用户名已存在");

    //自定义手机号码验证
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写手机号码");

    $(function () {
        //iCheck使能
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

        //注册表单验证
        $("#register-form").validate({
            rules:{
                name:"required",
                loginName:{
                    "required":true,
                    "checkLoginName":true
                },
                phone:{
                    "required" :true,
                    "isMobile" : true
                },
                password:"required",
                passwordAgain:{
                    required:true,
                    equalTo:"#password"
                },
                email:{
                    required:true,
                    email:true
                }
            },messages:{
                name:"请输入真实姓名",
                loginName:{
                    "required":"请输入登录名",
                    "checkLoginName":"登录名已存在"
                },
                phone:{
                    "required" :"请输入手机号",
                    "isMobile" : "请输入正确手机号"
                },
                password:"请输入密码",
                passwordAgain:{
                    required:"请确认密码",
                    equalTo:"两次输入的密码不同"
                },
                email:{
                    required:"请输入邮箱",
                    email:"邮箱格式不正确"
                }
            },
            onfocusout:false
        });

        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
</script>
</body>
</html>

