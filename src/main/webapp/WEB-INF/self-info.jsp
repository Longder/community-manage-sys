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
                <h2>个人中心</h2>
                <div class="row">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h4>修改个人信息</h4>
                        </div>
                        <div class="ibox-content">
                            <form id="edit-user-form" method="post" class="form-horizontal"
                                  action="${ctx}/admin/user/editForUse">
                                <input type="hidden" name="id" value="${user.id}"/>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">登录名<span
                                            class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" readonly class="form-control"
                                               value="${user.loginName}"/>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名<span
                                            class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="name"
                                               value="${user.name}"/>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱<span
                                            class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" name="email"
                                               value="${user.email}"/>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">手机号<span
                                            class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="phone"
                                               value="${user.phone}"/>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">门牌号<span
                                            class="text-danger">*</span></label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="houseNo"
                                               value="${user.houseNo}"/>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-2">
                                        <button class="btn btn-primary" type="submit">确定修改</button>
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

    //自定义手机号码验证
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length === 11 && mobile.test(value));
    }, "请正确填写手机号码");

    $(function(){
        $("#edit-user-form").validate({
            rules:{
                phone:{
                    "required" :true,
                    "isMobile" : true
                },
                email:{
                    required:true,
                    email:true
                },
                houseNo:{
                    required:true
                }
            },messages:{
                phone:{
                    "required" :"请输入手机号",
                    "isMobile" : "请输入正确手机号"
                },
                email:{
                    required:"请输入邮箱",
                    email:"邮箱格式不正确"
                },
                houseNo:{
                    required:'请输入门牌号'
                }
            },
            onfocusout:false
        });
    });
</script>
</body>
</html>
