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
            <h4 class="modal-title">编辑公告</h4>
        </div>
        <small class="font-bold">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <form id="eidt-announcement-form" method="post" class="form-horizontal"
                                      action="${ctx}/admin/announcement/edit">
                                    <input type="hidden" value="${announcement.id}" name="id"/>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">公告标题<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="title" value="${announcement.title}"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">公告内容<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <textarea type="text" class="form-control" name="content">${announcement.content}</textarea>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">修改发布</button>
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
        $("#edit-announcement-form").validate({
            rules:{
                title:{
                    required :true
                },
                content:{
                    required:true
                }
            },messages:{
                title:{
                    required :"请输入公告标题"
                },
                content:{
                    required:"请输入公告内容"
                }
            },
            onfocusout:false
        });
    });
</script>
