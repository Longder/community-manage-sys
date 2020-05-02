<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="session"/>
<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
                <span aria-hidden="true">×</span>
                <span class="sr-only">Close</span>
            </button>
            <h4 class="modal-title">编辑用户信息</h4>
        </div>
        <small class="font-bold">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <form id="edit-user-form" method="post" class="form-horizontal"
                                      action="${ctx}/admin/user/edit">
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
                                            <input type="text" class="form-control" readonly
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
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">确定修改</button>
                                            <button class="btn btn-white" type="button" data-dismiss="modal">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </small>
    </div>
</div>
<script>

    //自定义手机号码验证
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写手机号码");

    $(function(){
        console.log("modal加载完毕");
        $("#edit-user-form").validate({
            rules:{
                phone:{
                    "required" :true,
                    "isMobile" : true
                },
                email:{
                    required:true,
                    email:true
                }
            },messages:{
                phone:{
                    "required" :"请输入手机号",
                    "isMobile" : "请输入正确手机号"
                },
                email:{
                    required:"请输入邮箱",
                    email:"邮箱格式不正确"
                }
            },
            onfocusout:false
        });
    });
</script>
