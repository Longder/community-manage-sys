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
                    <c:if test="${!empty user}">
                        <li class="dropdown hidden-xs">
                            <a aria-expanded="false" class="right-sidebar-toggle" target="_self" href="${ctx}/logout">
                                <i class="fa fa-sign-in"></i> 登出
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="container">
                <h2>修改密码</h2>
                <div class="row">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h4>请修改</h4>
                        </div>
                        <div class="ibox-content">
                            <form id="updatePasswordForm" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">新密码<span
                                            class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input id="password" type="password" class="form-control" name="password"/>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">确认密码<span
                                            class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input id="passwordAgain" type="password" class="form-control"
                                               name="passwordAgain"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-2">
                                        <button class="btn btn-primary" type="submit">保存</button>
                                        <button class="btn btn-white" type="button" data-dismiss="modal">取消</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--引入统一JS-->
<jsp:include page="${ctx}/WEB-INF/import/script.jsp"/>
<script>
    $(function () {
        //表单验证
        $("#updatePasswordForm").validate({
            rules: {
                // originalPassword: {
                //     "required": true,
                //     // "checkOriginalPassword": true
                // },
                password:{
                    "required":true,
                    minlength: 6
                },
                passwordAgain: {
                    "required": true,
                    "equalTo": "#password"
                }
            }, messages: {
                // originalPassword: {
                //     "required": "请输入原密码",
                //     // "checkOriginalPassword": "原密码输入错误"
                // },
                password:{
                    "required":"请输入密码",
                    minlength:"密码必须六位以上"
                },
                passwordAgain: {
                    "required": "请确认密码",
                    "equalTo": "两次密码输入不一致"
                }
            },
            onkeyup: false,
            submitHandler: function () {
                ajaxSubmitForm();
            }
        });
    });

    //异步提交表单
    function ajaxSubmitForm() {
        var password = $("#password").val();
        $.ajax({
            url: "/admin/user/changePassword",
            type: "post",
            async: false,
            data: {
                newPassword: password,
            },success: function (data) {
                if(data==="ok"){
                    swal({
                        title: "修改成功",
                        text: "请重新登录系统",
                        type: "success"
                    },function(){
                        window.location = "/logout";
                    });
                }
            }
        });
    }
</script>
</body>
</html>
