<%--
  Created by IntelliJ IDEA.
  User: yan
  Date: 2018/12/12
  Time: 10:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/static/layui/css/layui.css"/>">
    <script src="<c:url value="/static/layui/layui.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/static/editor.md-master/css/editormd.css"/>"/>
    <link href="<c:url value="/static/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
    <link href="<c:url value="/static/css/update.css"/>" rel="stylesheet">
    <script src="<c:url value="/static/editor.md-master/editormd.min.js"/>"></script>
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="panel">
    <div class="panel-title">添加作业
    </div>
    <form class="layui-form" action="" style="margin: 20px 3%">
        <div class="layui-form-item">
            <label class="layui-form-label">课程列表</label>
            <div class="layui-input-block">
                <select id="courseId" name="courseId" lay-filter="required">
                    <c:forEach var="course" items="${courseList}">
                        <option value="<c:out value="${course.courseId}" />"><c:out
                                value="${course.courseName}-${course.academicYear}-${course.semester}"/></option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">作业标题</label>
            <div class="layui-input-block">
                <input id="jobTitle" type="text" name="jobTitle" required lay-verify="required"
                       placeholder="请输入标题" autocomplete="off" class="layui-input">
                <span id="tag" class="Tag">可以使用</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-block">
                <input id="jobBeginTime" type="text"
                       name="jobBeginTime" required lay-verify="required" placeholder="请输入标题" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-block">
                <input id="jobEndTime" type="text"
                       name="jobEndTime"
                       required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">作业描述</label>
            <div id="test-editormd" class="layui-input-block">
                <textarea name="jobContent"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script src="<c:url value="/static/js/addJob.js"/>">
</script>
</body>
</html>
