<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>日程表</title>
    <link href="/pages/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="/custom/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="/custom/uimaker/icon.css">
</head>
<body>
<div id="wu-toolbar-2">
    <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="openAdd()" plain="true">添加</a>--%>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit()" plain="true">查看详情</a>
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
            {field: 'fullname', title: '公司名称', width: 80, sortable: true},
            {field: 'username', title: '登录账户', width: 80, sortable: true},
            {field: 'comtype', title: '公司类型', width: 80, sortable: true},
            {field: 'description', title: '公司描述', width: 80, sortable: true},
            {field: 'tel', title: '公司电话', width: 80, sortable: true},
            {field: 'address', title: '公司地址', width: 80, sortable: true},
            {field: 'manager', title: '公司法人', width: 80, sortable: true},
            {field: 'mTel', title: '法人电话', width: 80, sortable: true},
            {field: 'statusname', title: '审核状态', width: 80, sortable: true},
            {
                field: 'opt', title: '操作', width: 80, align: 'center',
                formatter: function (value, rec) {
                    var btn = "";
                    if (rec.status == 0) {
                        btn = "<a class='easyui-linkbutton' iconCls='icon-search' href='javascript:;' onclick='check(" + rec.comId + "," + rec.status + "," + 2 + ")'>通过</a>";
                        btn += "<a class='easyui-linkbutton' iconCls='icon-search' href='javascript:;' onclick='check(" + rec.comId + "," + rec.status + "," + 1 + ")'>拒绝</a>";
                    } else if (rec.status == 2) {
                        btn = "<span class='easyui-linkbutton' iconCls='icon-search' href='javascript:;'>审核通过</span>";
                    } else if (rec.status == 1) {
                        btn = "<span class='easyui-linkbutton' iconCls='icon-search' href='javascript:;'>审核拒绝</span>";
                    }
                    return btn;
                }
            }
        ];
        datagridInit("/company/index", cols);
    });
    //    function openAdd() {
    //        openDialog("新增", "companyEdit.jsp", 490, 260, add);
    //    }

    function openEdit() {
        openDialog("修改", "companyEdit.jsp", 490, 260, edit, $('#tt').datagrid('getSelected'));
    }

    function seach() {
        $('#tt').datagrid('load', {
            txt: txt.value
        });
    }

    //    function add() {
    //        $("[name=id]").val(0);
    //        $('#wu-form-2').form('submit', {
    //            url: '/company/insert',
    //            success: function (data) {
    //                if (data) {
    //                    $('#dd').dialog('close');
    //                    reload();
    //                }
    //            }
    //        });
    //    }

    function edit() {
//        $('#wu-form-2').form('submit', {
//            url: '/company/update',
//            success: function (data) {
//                if (data) {
//                    $('#dd').dialog('close');
//                    reload();
//                }
//            }
//        });
    }

    function check(id, status, checkStatus) {
        var s = "通过";
        if (checkStatus == 1) s = "否决"
        if (checkStatus == 2) s = "通过"
        $.messager.confirm('修改状态', '确定' + s + '？', function (r) {
            if (r) {
                $.getJSON("/company/check", {id: id, status: status, checkStatus: checkStatus}, function () {
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

