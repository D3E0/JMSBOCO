<%--
  Created by IntelliJ IDEA.
  User: yan
  Date: 2018/11/24
  Time: 17:19
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/static/layui/css/layui.css"/>">
    <script src="<c:url value="/static/layui/layui.js"/>"></script>
    <link href="<c:url value="/static/css/list.css"/>" rel="stylesheet">
    <link href="<c:url value="/static/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
</head>
<body>
<div class="panel">
    <div class="panel-title">已选课程</div>
    <div class="content">
        <ul class="list">
            <li>
                <img class="icon" src="<c:url value="/static/img/class.png"/>" height="60px">
                <div class="item">
                    <div class="title">
                        <a href="/course">在生活中如何吹*</a>
                    </div>
                    <div class="time">
                        <a class="fa fa-calendar-o fa-fw" style="color: #2d8cf0"></a>2018上&nbsp;&nbsp;
                        <a class="fa fa-clock-o fa-fw" style="color: #2d8cf0"></a>1-16周&nbsp;&nbsp;
                        <a class="fa fa-user-o fa-fw" style="color: #2d8cf0"></a>戴霸天
                    </div>
                    <button></button>
                </div>
                <div class="state">
                    <span class="layui-badge-dot greendot"></span>&nbsp;&nbsp;Underway
                </div>
            </li>
            <li>
                <img class="icon" src="<c:url value="/static/img/class.png"/>" height="60px">
                <div class="item">
                    <div class="title">
                        <a href="/course">在生活中如何吹*</a>
                    </div>
                    <div class="time">
                        <a class="fa fa-calendar-o fa-fw" style="color: #2d8cf0"></a>2018上&nbsp;&nbsp;
                        <a class="fa fa-clock-o fa-fw" style="color: #2d8cf0"></a>1-16周&nbsp;&nbsp;
                        <a class="fa fa-user-o fa-fw" style="color: #2d8cf0"></a>戴霸天
                    </div>
                </div>
                <div class="state">
                    <span class="layui-badge-dot greendot"></span>&nbsp;&nbsp;Underway
                </div>
            </li>
            <li>
                <img class="icon" src="<c:url value="/static/img/class.png"/>" height="60px">
                <div class="item">
                    <div class="title">
                        <a href="/course">在生活中如何吹*</a>
                    </div>
                    <div class="time">
                        <a class="fa fa-calendar-o fa-fw" style="color: #2d8cf0"></a>2017上&nbsp;&nbsp;
                        <a class="fa fa-clock-o fa-fw" style="color: #2d8cf0"></a>1-16周&nbsp;&nbsp;
                        <a class="fa fa-user-o fa-fw" style="color: #2d8cf0"></a>戴霸天
                    </div>
                </div>
                <div class="state">
                    <span class="layui-badge-dot reddot"></span>&nbsp;&nbsp;Ended
                </div>
            </li>
        </ul>
    </div>
</div>
<div id="mypage"></div>
<script>
    layui.use('laypage', function () {
        var laypage = layui.laypage, $ = layui.$;
        //执行一个laypage实例m
        laypage.render({
            elem: 'mypage' //注意，这里的 test1 是 ID，不用加 # 号
            , count: 50 //数据总数，从服务端得到
        });
        $(document).ready(function(){
            window.parent.setIframeHeight();
        });
    });
</script>
</body>
</html>