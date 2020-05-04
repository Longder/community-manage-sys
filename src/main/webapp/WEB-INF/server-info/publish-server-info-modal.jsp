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
            <h4 class="modal-title">发布服务信息</h4>
        </div>
        <small class="font-bold">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <form id="add-server-info-form" method="post" class="form-horizontal"
                                      action="${ctx}/admin/serverInfo/publish">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">服务标题<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="title"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">服务人员<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="personName"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">服务类型<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="serverType">
                                                <c:forEach items="${serverTypes}" var="serverType">
                                                    <option value="${serverType.name}">${serverType.displayName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">服务描述<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <textarea type="text" class="form-control" name="description"></textarea>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
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
        </small>
    </div>
</div>
<script>
    $(function(){
        //表单验证
        $("#add-server-info-form").validate({
            rules:{
                title:{
                    required :true
                },
                personName:{
                    required:true,
                },
                description:{
                    required:true
                }
            },messages:{
                title:{
                    required :"请输入服务标题"
                },
                personName:{
                    required:"请填写服务人员姓名",
                },
                description:{
                    required:"请输入服务内容"
                }
            },
            onfocusout:false
        });
    });
</script>
