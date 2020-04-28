<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html><head>
    <meta charset="utf-8">
    <title>猫眼管理平台</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="bookmark" href="favicon.ico" type="image/x-icon" 　="">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table.min.css" rel="stylesheet">
    <script src="https://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/select2/4.0.6-rc.1/js/select2.min.js"></script>
    <script src="https://cdn.bootcss.com/select2/4.0.6-rc.1/js/i18n/zh-CN.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-table/1.13.4/extensions/export/bootstrap-table-export.min.js"></script>
    <script src="js/xlsx.core.min.js"></script>
    <script src="js/tableExport.min.js"></script>
    <style>

        html, body {
            height: 100%
        }

        .wrapper {
            min-height: 100%;
            height: auto !important;
            height: 100%;
            margin: 100px auto -155px
        }

        .middle {
            text-align: center;
            margin: 0 auto;
            width: 90%;
            height: auto
        }

        .info a {
            margin: 0 10px;
            text-decoration: none;
            color: green
        }</style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><b>猫眼管理平台</b></a>
        </div>

        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        常用网站
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="http://data.sankuai.com/">万象平台</a></li>
                        <li><a href="http://rt.sankuai.com/">实时计算平台</a></li>
                        <li><a href="http://xt.sankuai.com/">XT离线开发平台</a></li>
                        <li><a href="http://data.sankuai.com/canal/sync">binlog服务</a></li>
                        <li><a href="https://plus.mws.sankuai.com">plus发布平台</a></li>
                        <li><a href="https://crane.mws.sankuai.com/">crane任务调度平台</a></li>
                        <li><a href="https://avatar.mws.sankuai.com/">avatar服务运维平台</a></li>
                        <li><a href="https://squirrel.mws.sankuai.com/">squirrel分布式缓存</a></li>
                        <li><a href="https://rds.mws.sankuai.com/">rds关系型数据库</a></li>
                        <li><a href="https://mafka.mws.sankuai.com/">mafka消息中间件</a></li>
                        <li><a href="http://kafka.data.sankuai.com/">kafka平台</a></li>
                        <li><a href="http://sight.sankuai.com/">es平台</a></li>
                        <li><a href="https://dbus.sankuai.com/">dbus平台</a></li>
                        <li><a href="http://data.sankuai.com/wanxiang/#/hbase/hbaseDesk/all">hbase服务台</a></li>
                        <li><a href="http://onepunch.sankuai.com/offline/manage/job-manage">druid平台</a></li>
                        <li><a href="http://10.59.88.231:8080/">数据配置协同管理平台</a></li>
                        <li><a href="http://git.sankuai.com/">git项目</a></li>
                        <li><a href="https://bi.sankuai.com/sql/edit">魔术sql查询</a></li>
                        <li><a href="https://wiki.maoyan.com/">wiki平台</a></li>
                        <li><a href="https://ones.sankuai.com/">ones项目需求平台</a></li>

                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        图表展示
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="http://piaofang.maoyan.com/dashboard/web-heat">猫眼专业版网播热度展示</a></li>
                        <li><a href="https://dt.maoyan.com/report/reportdetail/40?menuId=636">dt选座营收日报展示</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="wrapper">
    <div class="middle">
        <h4 style="padding: 10px 0 10px;">欢迎来到猫眼管理平台</h4>
    </div>
</div>

<script type="text/javascript">

    $.getJSON('loki/dailyTaskTraceReports', function (data) {
        if (data.success) {
            loadDailyTaskTraceReports(data.data);
        } else {
            alert('提示', data.msg);
        }
    });


    function loadDailyTaskTraceReports(datas) {
        $('#dailyTraceTable').bootstrapTable({
            method: 'get',
            cache: false,
            striped: true,
            pagination: true,
            pageSize: 20,
            pageNumber: 1,
            pageList: [20, 40],
            sidePagination: 'client',
            showColumns: true,
            showRefresh: false,
            showExport: true,
            exportDataType: "basic",
            exportTypes: ['csv'],
            search: true,
            clickToSelect: true,
            columns:
                [
                    {
                        field: "taskName",
                        title: "任务名(点击可查看心跳和Trace)",
                        align: "center",
                        valign: "middle",
                        sortable: "true",
                        formatter: function (value, row, index) {
                            return [
                                '<a href="chart.html?taskName=' + value + '">' + value + '</a>'
                            ].join("")
                        }
                    },
                    {field: "taskCnName", title: "任务中文名", align: "center", valign: "middle", sortable: "true"},
                    {field: "ackCount", title: "任务确认数", align: "center", valign: "middle", sortable: "true"},
                    {field: "taskDuration", title: "任务执行时间[分钟]", align: "center", valign: "middle", sortable: "true"},
                    {field: "parsePageSize", title: "解析页面大小[GB]", align: "center", valign: "middle", sortable: "true"},
                    {field: "parseSuccessRate", title: "解析成功率", align: "center", valign: "middle", sortable: "true"},
                ],
            rowStyle: function (row, index) {
                var style = "";
                let parseSuccessRate = row.parseSuccessRate.replace('%', '');
                if (parseSuccessRate >= 100) {
                    style = 'success';
                } else if (parseSuccessRate < 99) {
                    style = 'danger';
                } else {
                    style = 'info';
                }
                return {classes: style}
            },
            data: datas
        });
    }

    $.getJSON('loki/traceConditionRanks', function (data) {
        if (data.success) {
            loadTraceConditionRanks(data.data);
        } else {
            alert('提示', data.msg);
        }
    });


    function loadTraceConditionRanks(datas) {
        $('#traceConditionRanksTable').bootstrapTable({
            method: 'get',
            cache: false,
            striped: true,
            pagination: false,
            showColumns: true,
            showRefresh: false,
            showExport: false,
            search: false,
            clickToSelect: false,
            columns:
                [
                    {field: "taskNames", title: "当日执行任务数", align: "center", valign: "middle", sortable: "true"},
                    {field: "dailyAckCount", title: "当日任务确认总数", align: "center", valign: "middle", sortable: "true"},
                    {field: "duration", title: "当日任务执行时间总长[分钟]", align: "center", valign: "middle", sortable: "true"},
                    {
                        field: "parsePageSize",
                        title: "当日解析页面大小总和[GB]",
                        align: "center",
                        valign: "middle",
                        sortable: "true"
                    },
                    {field: "parseSuccessRate", title: "当日解析成功率", align: "center", valign: "middle", sortable: "true"},
                ],
            rowStyle: function (row, index) {
                var style = "";
                let parseSuccessRate = row.parseSuccessRate.replace('%', '');
                if (parseSuccessRate >= 100) {
                    style = 'success';
                } else if (parseSuccessRate < 99) {
                    style = 'danger';
                } else {
                    style = 'info';
                }
                return {classes: style}
            },
            data: datas
        });
    }
</script>

</body></html>