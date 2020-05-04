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
            <h4 class="modal-title">修改库存</h4>
        </div>
        <small class="font-bold">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <form id="update-goods-count-form" method="post" class="form-horizontal"
                                      action="${ctx}/admin/goods/editCount">
                                    <input type="hidden" name="id" value="${goods.id}"/>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">商品名称<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" readonly value="${goods.name}"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">库存<span class="text-danger">*</span></label>
                                        <div class="col-sm-10">
                                            <input min="1" type="number" class="form-control" name="count" required value="${goods.count}"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-2">
                                            <button class="btn btn-primary" type="submit">确定修改库存</button>
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