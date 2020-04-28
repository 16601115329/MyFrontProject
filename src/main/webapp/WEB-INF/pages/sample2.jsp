<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                $("#add_tab").linkbutton(
                    {
                        text:"添加",
                        iconCls:"icon-add"
                    }) ;


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

                        if($("#tt").tabs("exists",title))
                        {
                            $("#tt").tabs("select",title)
                        }
                        else
                        {
                            $("#tt").tabs('add',{
                                title:title,
                                closable:true,
                                href:url
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
        //第二种方法
        /*function addTab(title){
            if ($('#tt').tabs('exists', title)){
                $('#tt').tabs('select', title);
            } else {
                $('#tt').tabs('add',{
                    title:title,
                    closable:true
                });
            }
        }*/
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',title:'顶部',split:true" style="height:100px;">欢迎来到猫眼管理平台</div>
<div data-options="region:'south',title:'底部',split:true" style="height:100px;">数据协同组 @2020</div>
<div data-options="region:'east',iconCls:'icon-reload',title:'工具',split:true" style="width:100px;"></div>
<div data-options="region:'west',title:'菜单',split:true" style="width:200px;">

    <div id="ac" class="easyui-accordion" data-options="fit:true">
        <div title="员工信息">
            <center><a id="add_tab" style="width:100%"></a></center>
            <a href="#"  onclick="addTab('增加')" title="adduser.html" class="easyui-linkbutton" style="width:100%">增加员工</a>
            <a href="#"   onclick="addTab('删除')" title="deleteuser.html" class="easyui-linkbutton" style="width:100%">删除员工</a>
            <a href="#"   onclick="addTab('修改')" title="modifyuser.html" class="easyui-linkbutton" style="width:100%">修改员工</a>
            <a href="#"   onclick="addTab('查看')" title="test.html" class="easyui-linkbutton" style="width:100%">网站列表</a>
        </div>
        <div title="考勤信息">这是考勤信息模块</div>
        <div title="招聘信息">这是招聘信息模块</div>
    </div>
</div>
<div data-options="region:'center',title:'主窗口'" style="padding:5px;background:#eee;" >
    <div id="tt" class="easyui-tabs" style="width:500px;height:250px;" data-options="fit:true,justified:false,pill:true">
        <div title="Tab1" style="padding:20px;">
            tab1
        </div>
        <div title="Tab2" data-options="closable:true,selected:true" style="overflow:auto;padding:20px;">
            tab2
        </div>
        <div title="Tab3" data-options="iconCls:'icon-reload',closable:true" style="padding:20px;">
            tab3
        </div>
    </div>
</div>
</body>
</html>
