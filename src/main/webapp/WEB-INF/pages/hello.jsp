<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<!DOCTYPE html>
<html>
<head>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style type="text/css">
            *{margin:0;padding:0}
        </style>
        <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.4/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.4/themes/icon.css">
        <script type="text/javascript" src="jquery-easyui-1.9.4/jquery.min.js">
        </script>
        <script type="text/javascript" src="jquery-easyui-1.9.4/jquery.easyui.min.js">
        </script>
        <!-- 5    本地语言 -->
        <script type="text/javascript" src="jquery-easyui-1.9.4/locale/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript">
            //创建打开新标签页的按钮
            $(
                function()
                {


                    $("#add_tab").click
                    (
                        function()
                        {
                            if($("#tt").tabs("exists","新标签页"))
                            {
                                $("#tt").tabs("select","新标签页")
                            }
                            else
                            {
                                $("#tt").tabs('add',{
                                    title:'新标签页',
                                    closable:true
                                })    ;
                            }
                        }
                    );

                    $(".easyui-linkbutton").click
                    (
                        function()
                        {
                            //获取主键的属性或内容
                            var title = $(this).text() ;//this获取当前点击的对象

                            var url = $(this).attr("title") ;
                            var content = "        <ul>\n" +
                                "            <li><a href=\"http://data.sankuai.com/canal/sync\">binlog服务</a></li>\n" +
                                "            <li><a href=\"https://plus.mws.sankuai.com\">plus发布系统</a></li>\n" +
                                "            <li><a href=\"https://crane.mws.sankuai.com/\">crane任务调度</a></li>\n" +
                                "            <li><a href=\"https://avatar.mws.sankuai.com/\">avatar服务运维平台</a></li>\n" +
                                "            <li><a href=\"https://squirrel.mws.sankuai.com/\">squirrel分布式缓存</a></li>\n" +
                                "            <li><a href=\"https://rds.mws.sankuai.com/\">rds关系型数据库</a></li>\n" +
                                "            <li><a href=\"https://mafka.mws.sankuai.com/\">mafka消息中间件</a></li>\n" +
                                "            <li><a href=\"http://kafka.data.sankuai.com/\">kafka平台</a></li>\n" +
                                "            <li><a href=\"http://sight.sankuai.com/\">ES平台</a></li>\n" +
                                "            <li><a href=\"https://dbus.sankuai.com/\">dbus平台</a></li>\n" +
                                "            <li><a href=\"http://data.sankuai.com/wanxiang/#/hbase/hbaseDesk/all\">hbase服务台</a></li>\n" +
                                "            <li><a href=\"http://onepunch.sankuai.com/offline/manage/job-manage\">druid平台</a></li>\n" +
                                "        </ul>";

                            if($("#tt").tabs("exists",title))
                            {
                                $("#tt").tabs("select",title)
                            }
                            else
                            {
                                $("#tt").tabs('add',{
                                    title:title,
                                    closable:true,
                                    content:content
                                })    ;
                            }
                        }
                    );


                    $("#aaaq").click(
                        function haha ()
                        {
                            $("#tt").tabs('add',{
                                title:$("#aaaq").text(),
                                closable:true
                            })    ;
                        }
                    ) ;

                }
            ) ;

        </script>
    </head>

<body class="easyui-layout">
<div data-options="region:'north',title:'顶部',split:true" style="height:100px;">欢迎来到猫眼管理平台</div>
<div data-options="region:'south',title:'底部',split:true" style="height:100px;">数据协同组 @2020</div>
<div data-options="region:'east',iconCls:'icon-reload',title:'工具',split:true" style="width:100px;"></div>
<div data-options="region:'west',title:'菜单',split:true" style="width:200px;">

    <div id="ac" class="easyui-accordion" data-options="fit:true">
        <div title="功能列表">
            <center><a id="add_tab" style="width:100%"></a></center>
            <a href="#"  onclick="addTab('开发平台')" title="adduser.html" class="easyui-linkbutton" style="width:100%">开发平台</a>
            <a href="#"   onclick="addTab('数据展示')" title="deleteuser.html" class="easyui-linkbutton" style="width:100%">数据展示</a>
        </div>
    </div>
</div>
<div data-options="region:'center',title:'主窗口'" style="padding:5px;background:#eee;" >
    <div id="tt" class="easyui-tabs" style="width:500px;height:250px;" data-options="fit:true,justified:false,pill:true">
    </div>
    <div id="tt2" class="easyui-tabs" style="width:500px;height:250px;" data-options="fit:true,justified:false,pill:true">
    </div>
</div>
</body>
</html>