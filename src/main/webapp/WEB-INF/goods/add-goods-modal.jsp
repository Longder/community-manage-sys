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
            <h4 class="modal-title">添加商品</h4>
        </div>
        <small class="font-bold">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <form id="add-goods-form" method="post" class="form-horizontal"
                                      action="${ctx}/admin/goods/add" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">名称<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="name"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品分类<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <select class="form-control" name="type">
                                                <c:forEach items="${goodsTypes}" var="type">
                                                    <option value="${type.name}">${type.displayName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品图片<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="file" class="form-control" name="imageFile" required/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">单价（元）<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="unitPrice"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">初始库存<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input min="1" value="1" type="number" class="form-control" name="count"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品描述<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <textarea name="describe" class="form-control" required></textarea>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">确定添加</button>
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
        $("#add-goods-form").validate({
            rules:{
                name:{
                    required :true
                },
                imageFile:{
                    required: true
                },
                unitPrice:{
                  required: true
                },
                count:{
                    required:true
                },
                describe:{
                    required:true
                }
            },messages:{
                name:{
                    required :"请输入商品名称"
                },
                imageFile:{
                    required: "请上传商品图片"
                },
                unitPrice:{
                    required: "请输入商品单价"
                },
                count:{
                    required:"请输入商品数量"
                },
                describe:{
                    required:"请输入商品描述"
                }
            },
            onfocusout:false
        });
    });
</script>
