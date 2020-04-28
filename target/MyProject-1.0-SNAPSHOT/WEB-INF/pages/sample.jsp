<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.4/themes/icon.css">
    <script type="text/javascript" src="jquery-easyui-1.9.4/jquery.min.js">
    </script>
    <script type="text/javascript" src="jquery-easyui-1.9.4/jquery.easyui.min.js">
    </script>
    <!-- 5    本地语言 -->
    <script type="text/javascript" src="jquery-easyui-1.9.4/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
        function addTab(title)
        {
            if ($('#tt').tabs('exists', title))
            {
                $('#tt').tabs('select', title);
            }
            else
            {
                $('#tt').tabs('add',{
                    title:title,
                    closable:true
                });
            }
        }
    </script>
</head>

<body class="easyui-layout">
<div data-options="region:'north',title:'North Title',split:true" style="height:100px;"></div>
<div data-options="region:'south',title:'South Title',split:true" style="height:100px;"></div>
<div data-options="region:'east',title:'East',split:true" style="width:100px;"></div>
<div data-options="region:'west',title:'West',split:true,title:'导航'"
     style="padding: 10px; width: 173px; height: 588px;" class="panel-body layout-body" id="">
    <ul class="easyui-tree tree">
        <li>
            <div id="_easyui_tree_1" class="tree-node">
                <span class="tree-hit tree-collapsed"></span>
                <span class="tree-icon tree-folder "></span>
                <span class="tree-title"><a target="mainFrame" onclick="addTab('binlog服务','http://data.sankuai.com/canal/sync')"  >常用网址</a></span>
            </div>
        </li>
        <li>
            <div id="_easyui_tree_2" class="tree-node">
                <span class="tree-hit tree-collapsed"></span>
                <span class="tree-icon tree-folder "></span>
                <span class="tree-title"><a target="mainFrame" href="/stream_compute">数据展示</a></span>
            </div>
        </li>
    </ul>

</div>


<div data-options="region:'center',title:'center title'" style="padding:5px;background:#eee;"></div>

<div style="margin-bottom:10px">
    <a href="#" class="easyui-linkbutton" onclick="addTab('google','http://www.google.com')">google</a>
    <a href="#" class="easyui-linkbutton" onclick="addTab('jquery','http://jquery.com/')">jquery</a>
    <a href="#" class="easyui-linkbutton" onclick="addTab('easyui','http://jeasyui.com/')">easyui</a>
</div>
<div id="tt" class="easyui-tabs" style="width:400px;height:250px;">
</div>
</body>
</html>