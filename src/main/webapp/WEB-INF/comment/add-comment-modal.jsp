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
            <h4 class="modal-title">添加评价</h4>
        </div>
        <small class="font-bold">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <form id="add-comment-form" method="post" class="form-horizontal"
                                      action="${ctx}/admin/comment/add">
                                    <input type="hidden" name="appointmentId" value="${appointment.id}"/>
                                    <input type="hidden" name="serverInfo.id" value="${appointment.serverInfo.id}"/>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">服务人员姓名<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" readonly value="${appointment.serverInfo.personName}"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">评价<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <textarea type="text" class="form-control" name="content"></textarea>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">确认评论</button>
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
    $(function(){
        //表单验证
        $("#add-comment-form").validate({
            rules:{
                content:{
                    required:true
                }
            },messages:{
                content:{
                    required:"请输入评价内容"
                }
            },
            onfocusout:false
        });
    });
</script>
