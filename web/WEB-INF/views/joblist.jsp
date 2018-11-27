<%--
  Created by IntelliJ IDEA.
  User: yan
  Date: 2018/11/24
  Time: 11:11
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
    <div class="panel-title">最近作业</div>
    <div class="op">
        <div class="searchdiv">
            <input type="text" id="search" placeholder="keyword">
            <i class=" fa-search fa fa-fw"></i>
        </div>
        &nbsp;&nbsp;
        <button class="layui-btn additem" id="addjob">
            <a class="fa fa-plus fa-fw" style="color: #FFFFFF"></a>&nbsp;&nbsp;添加作业
        </button>
    </div>

</div>
<div class="content">
    <ul class="list" id="list">
    </ul>
</div>
<div id="mypage"></div>
<script>
    layui.use(['laypage', 'element', 'layer'], function () {
        var laypage = layui.laypage, $ = layui.$;

        function laypageReload() {
            var count = 0;
            $.post("/countjob",
                {
                    studentid: 1,
                    keyword: $("#search").val()
                }, function (data) {
                    count = data;
                    laypage.render({
                        limit: 8
                        , elem: 'mypage' //注意，这里的 test1 是 ID，不用加 # 号
                        , count: count //数据总数，从服务端得到
                        , jump: function (obj, first) {
                            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                            console.log(obj.limit); //得到每页显示的条数
                            getjoblist(obj.curr, $("#search").val());
                        }
                    });
                });
        }

        laypageReload();
        var lastTime;
        $("#search").keyup(function (event) {
            lastTime = event.timeStamp;
            setTimeout(function () {
                if (lastTime - event.timeStamp === 0) {
                    var txt = $("#search").val();
                    console.info(txt);
                    laypageReload();
                }
            }, 500);
        });
        $('#addjob').click(function () {
            console.info("click");
            window.parent.layui.use(['layer'], function () {//调用父页面的layer
                var layer = window.parent.layui.layer;
                layer.open({
                    title: false,
                    area: ['500px', '500px'],
                    type: 2,
                    content: ['addjob.html', 'no']
                });
            });
        });
        $(document).ready(function () {
            window.parent.setIframeHeight();
        });

        function getjoblist(i, keyword) {
            $.post("/joblist",
                {
                    studentid: 1,
                    page: i,
                    keyword: keyword
                },
                function (data, status) {
                    $("#list").empty();
                    for (var i = 0; i < data.length; i++) {
                        var obj = data[i];
                        var item = '<img class="icon" src="${pageContext.request.contextPath}/static/img/job.png" height="60px">' +
                            '<div class="item">\n' +
                            '    <div class="title">\n' +
                            '        <a href="${pageContext.request.contextPath}/job?jobId="' + obj.jobId + '>' + obj.jobTitle + '</a>\n' +
                            '    </div>\n' +
                            '    <div class="time">\n' +
                            '        <a class="fa fa-calendar-o fa-fw" style="color: #2d8cf0"></a>' + obj.jobBeginTime + '&nbsp;&nbsp;\n' +
                            '        <a class="fa fa-clock-o fa-fw" style="color: #2d8cf0"></a>\n' +
                            '        &nbsp;' + obj.time + 'days&nbsp;&nbsp;\n' +
                            '        <a class="fa fa-book fa-fw" style="color: #2d8cf0"></a>' + obj.courseName + '&nbsp;&nbsp;\n' +
                            '    </div>\n' +
                            '</div>'
                        if (obj.status === true) {
                            item = item + '<div class="state">\n' +
                                '<span class="layui-badge-dot greendot"></span>&nbsp;&nbsp;Underway\n' +
                                '</div></li>';
                        }
                        else {
                            item = item + ' <div class="state">\n' +
                                '        <span class="layui-badge-dot reddot"></span>&nbsp;&nbsp;Ended\n' +
                                '    </div>'
                        }
                        var li = document.createElement("li");
                        li.innerHTML = item;
                        $("#list").append(li);
                    }
                    window.parent.setIframeHeight();
                }
            );
        }

        getjoblist(1);
    });
</script>
<script src="<c:url value="/static/js/Date.js"/>"></script>
</body>
</html>