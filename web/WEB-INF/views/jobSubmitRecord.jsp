<%--
  Created by IntelliJ IDEA.
  User: yan
  Date: 2018/12/9
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/static/layui/css/layui.css"/>">
    <script src="<c:url value="/static/layui/layui.js"/>"></script>
    <link href="<c:url value="/static/css/list.css"/>" rel="stylesheet">
    <link href="<c:url value="/static/css/record.css"/>" rel="stylesheet">
    <link href="<c:url value="/static/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
</head>
<body>
<jsp:include page="head.jsp"/>
<div class="panel">
    <div class="panel-title">作业提交记录</div>
    <div class="op">
        <%--<button id="downloadAll" class="layui-btn">点击下载所有文件</button>--%>
        <span class="jobInfo">提交情况：${already}/${need}</span>
        <div class="searchdiv">
            <input type="text" id="search" placeholder="keyword">
            <i class=" fa-search fa fa-fw"></i>
        </div>
        &nbsp;&nbsp;
    </div>
    <input id="jobId" hidden value="${jobId}">
    <div class="content">
        <table id="demo" lay-filter="record"></table>
    </div>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-sm detailbtn" lay-event="detail">查看提交文件</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button id="downloadAll" class="layui-btn" lay-event="downloadAll">点击下载所有文件</button>
    </div>
</script>
<script>
    let jobId = $("#jobId").val();
    layui.use(['table', 'layer', 'element'], function () {
        let table = layui.table, layer = layui.layer,element = layui.element;
        $("#downloadAll").click(function () {
            layer.open({
                title: '任务下载中',
                area: ['600px', '200px'],
                type: 2,
                scrollbar: true,
                content: ['/downloadAll?jobId='+jobId, 'no']
            });
        });
        let tableIns = table.render({
            elem: '#demo'
            , height: 570
            , url: '/jobSubmitRecord' //数据接口
            , page: true //开启分页
            , method: "post"
            ,toolbar: '#toolbarDemo'
            , where: {
                jobId: jobId, keyword: function () {
                    return $("#search").val()
                }
            }
            , cols: [[ //表头
                {field: 'userId', title: '学号', width: '19%', sort: true}
                , {field: 'userName', title: '学生姓名', width: '17%'}
                , {field: 'status', title: '作业是否提交', width: '16%', sort: true,templet: function (d) {
                        if (d.status === true)
                            return '是';
                        return '否';
                    }}
                , {field: 'fileCount', title: '作业提交文件数', width: '15%'}
                , {
                    field: 'lastSubmitTime', title: '提交作业时间', width: '21%', sort: true, templet: function (d) {
                        if (d.lastSubmitTime === undefined)
                            return '无';
                        return new Date(d.lastSubmitTime).toLocaleString();
                    }
                }, {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
            ]]
        });
        console.info('table.on');
        table.on('tool(record)', function (obj) {
            let data = obj.data; //获得当前行数据
            let layEvent = obj.event;
            if (layEvent === 'detail') { //查看
                let param = "?jobId=" + jobId+'&studentId='+data.userId;
                console.info("fileList click");
                layer.open({
                    title: false,
                    area: ['700px', '500px'],
                    type: 2,
                    scrollbar: true,
                    content: ['/jobFileList' + param, 'no']
                });
            }
        });
        table.on('toolbar(record)', function (obj) {
            console.info('table.on');
            layer.open({
                title: '任务下载中',
                area: ['600px', '200px'],
                type: 2,
                scrollbar: true,
                content: ['/downloadAll?jobId='+jobId, 'no']
            });
        });
        let lastTime;
        $("#search").keyup(function (event) {
            lastTime = event.timeStamp;
            setTimeout(function () {
                if (lastTime - event.timeStamp === 0) {
                    tableIns.reload({
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    });
                }
            }, 300);
        });
    });
</script>
</body>
</html>
