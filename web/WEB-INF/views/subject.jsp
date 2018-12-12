<%--
  Created by IntelliJ IDEA.
  User: ACM-PC
  Date: 2018/12/1
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Notify</title>
    <link rel="stylesheet" href="<c:url value="/static/layui/css/layui.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/elementui/theme-chalk/index.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/css/course.css"/>">
    <style>
        body {
            background-color: #fff;
        }
    </style>
</head>
<jsp:include page="head.jsp"/>
<body>
<div id="app" style="margin-left: 2%;">
    <el-container>
        <el-aside width="200px">
            <subject-side :uid="uid" :is-tch="isTch"></subject-side>
        </el-aside>
        <el-main>
            <router-view></router-view>
        </el-main>
    </el-container>
</div>
<script>
    const userInfo = {
        uid: 2,
        isTch: false,
        path: '${pageContext.request.contextPath}',
    };
</script>

<script type="text/javascript" src="<c:url value="/static/js/axios.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/vue.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/vue-router.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/xlsx.full.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/elementui/index.js"/>"></script>
<script src="<c:url value="/static/js/subject-main.js"/>" type="module"></script>

</body>

</html>

