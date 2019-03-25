<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员管理</title>
    <link href="/pages/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="/custom/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="/custom/uimaker/icon.css">
</head>
<body>
<div id="wu-toolbar-2">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">添加</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">修改</a>
        <label>关键词：</label><input id="txt" class="wu-text" style="width:100px">
        <a href="javascript:seach();" class="easyui-linkbutton" iconCls="icon-search">开始检索</a>
</div>

<table id="tt" class="easyui-datagrid" style="width:100%; height: 500px; "></table>

<script type="text/javascript" src="/custom/jquery.min.js"></script>
<script type="text/javascript" src="/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/custom/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
    $(function () {
        cols = [
            {field: 'name', title: '管理员名称', width: 80, sortable: true},
            {field: 'account', title: '账号', width: 80, sortable: true},
            {field: 'phone', title: '手机号', width: 80, sortable: true},
            {field: 'card', title: '身份证号', width: 80, sortable: true},
            {field: 'statusname', title: '状态', width: 80, sortable: true},
            {field: 'comment', title: '备注', width: 80, sortable: true},
            {
                field: 'opt', title: '操作', width: 80, align: 'center',
                formatter: function (value, rec) {
                    var t = "禁用";
                    if (rec.status == 1) t = "启用";
                    var btn = "<a class=''  href='javascript:void(0)' onclick='del("+rec.id+")'>删除</a> ";
                    btn += "<a class='easyui-linkbutton' iconCls='icon-search' href='javascript:;' onclick='ban(" + rec.id + "," + rec.status + ")'>" + t + "</a>";
                    return btn;
                }
            }
        ];
        datagridInit("/operator/index", cols);
    });

    function openAdd() {
        openDialog("新增", "operatorEdit.jsp", 520, 350, add);
    }

    function openEdit() {
        openDialog("修改", "operatorEdit.jsp", 520, 350, edit, $('#tt').datagrid('getSelected'));
    }

    function seach() {
        $('#tt').datagrid('load', {
            txt: txt.value
        });
    }

    function add() {
        $("[name=id]").val(0);
        $('#wu-form-2').form('submit', {
            url: '/operator/insert',
            success: function (data) {
                if (data) {
                    $('#dd').dialog('close');
                    reload();
                }
            }
        });
    }

    function edit() {
        $('#wu-form-2').form('submit', {
            url: '/operator/update',
            success: function (data) {
                if (data) {
                    $('#dd').dialog('close');
                    reload();
                }
            }
        });
    }

    function del(id) {
        $.messager.confirm("确认", "确定要删除当前行吗？", function(r) {
            if (r) {
                $.getJSON("/operator/del", {
                    id : id
                }, function() {
                    reload();
                });

            }

        });
    }

    function ban(id, status) {
        var s = "禁用";
        if (status != 0) s = "启用"
        $.messager.confirm('修改状态', '确定' + s + '？', function (r) {
            if (r) {
                $.getJSON("/operator/ban", {id: id}, function () {
                    reload();
                });
            }
        });
    }
</script>

<div id="dd"></div>

<script type="text/javascript" src="/pages/js/my.js"></script>

</body>
</html>

