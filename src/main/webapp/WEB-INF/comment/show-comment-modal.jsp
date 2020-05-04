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
            <h4 class="modal-title">查看评论</h4>
        </div>
        <small class="font-bold">
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">服务人员姓名</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" readonly
                                                   value="${serverInfo.personName}"/>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>内容</th>
                                                <th>评价日期</th>
                                                <th>评价人</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${commentList}" var="comment">
                                                <tr>
                                                    <td>${comment.content}</td>
                                                    <td>${comment.commentDate}</td>
                                                    <td>${comment.employer.name}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-4 col-sm-offset-10">
                                            <button class="btn btn-white" type="button" data-dismiss="modal">关闭</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </small>
    </div>
</div>
