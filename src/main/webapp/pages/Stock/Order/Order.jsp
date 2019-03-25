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

    <div class="wu-toolbar-button daohang">
        <a href="#" type="1" class="easyui-linkbutton" iconCls="icon-add"
           onclick="openDialog('入库单','rukudan.html',600,484,save);" plain="true">入库单</a>
        <a href="#" type="1" class="easyui-linkbutton" iconCls="icon-add"
           onclick="openDialog('出库单','chukudan.html',600,484,save);" plain="true">出库单</a>
        <a href="#" type="2" class="easyui-linkbutton" iconCls="icon-add"
           onclick="openDialog('移库单','yikudan.html',600,484,save);" plain="true">移库单</a>
        <a href="#" type="3" class="easyui-linkbutton" onclick="openDialog('盘点','pandiandan.html',600,484,save);"
           plain="true">盘点</a>
    </div>
    <div class="wu-toolbar-search">
        <label>关键词：</label><input id="txt" class="wu-text" style="width:100px">
        <a href="javascript:seach();" class="easyui-linkbutton" iconCls="icon-search">开始检索</a>
    </div>
</div>

<table id="tt" class="easyui-datagrid" style="width:100%; height: 500px; "></table>

<script type="text/javascript" src="/custom/jquery.min.js"></script>
<script type="text/javascript" src="/custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/custom/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

    var Atype = 0;
    $('.daohang a').click(function () {
        Atype = $(this).attr("type");
    });

    $(function () {
        cols = [
            {field: 'date', title: '时间', width: 80, sortable: true},
            {field: 'typename', title: '单据类型', width: 80, sortable: true},
            {field: 'sname', title: '仓库名称', width: 80, sortable: true},
            {field: 'dname', title: '目标仓库名称', width: 80, sortable: true},
            {field: 'physician_operator_id', title: '操作人', width: 80, sortable: true},
            {field: 'amount', title: '进货金额', width: 80, sortable: true},
            {field: 'amount1', title: '出库金额', width: 80, sortable: true},
            {field: 'purchasing', title: '进货相关信息', width: 80, sortable: true},
            {field: 'comments', title: '备注', width: 80, sortable: true}
        ];
        datagridInit("/Order/index", cols);
    });

    function openEdit() {
        switch ($('#tt').datagrid('getSelected').type) {
            case 0:
                openDialog("单据修改", "rukudan.html", 600, 484, edit, $('#tt').datagrid('getSelected'));
                break;
            case 1:
                openDialog("单据修改", "chukudan.html", 600, 484, edit, $('#tt').datagrid('getSelected'));
                break;
            case 2:
                openDialog("单据修改", "yikudan.html", 600, 484, edit, $('#tt').datagrid('getSelected'));
                break;
            case 4:
                openDialog("单据修改", "pandiandan.html", 600, 484, edit, $('#tt').datagrid('getSelected'));
                break;
            case 5:
                openDialog("单据修改", "pandiandan.html", 600, 484, edit, $('#tt').datagrid('getSelected'));
                break;
            default:
                break;
        }

    }

    //添加单据表和单据详情表
    function save() {

        var status = 1;
        if ($("[name=oldcount]").length > 0) {
            var oldcount = parseFloat($("[name=oldcount]").val());
            var count = parseFloat($("[name=count]").val());
            if (oldcount > count) {
                $("[name=type]").val("4");
            } else if (oldcount < count) {
                $("[name=type]").val("5");
            }
        }
        $("#wu-form-2").form('submit', {
            url: '/Order/insert',
            async: false,
            success: function (data) {
                if (data) {
                    $('#dd').dialog('close');
                    var rows = $('.orderdetail').datagrid('getRows');
                    for (var i = 0; i < rows.length; i++) {
                        $.ajax({
                            url: '/Orderdetail/insert1?order_id=0',
                            type: "post",
                            dataType: "json",
                            async: false,
                            data: rows[i],
                            success: function (data) {
                                if (data) {
                                    reload();
                                }
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                $.messager.show({
                                    title: '提示',
                                    msg: '"textStatus = " + textStatus + ", XMLHttpRequest.status = " + XMLHttpRequest.status + ", XMLHttpRequest.readyState = " + XMLHttpRequest.readyState'
                                });
                            }
                        });

                    }
                    if (Atype == 1) {

                        $.ajax({
                            url: '/Stock/getInfobyOrder',
                            type: "post",
                            contentType: "application/json",
                            dataType: "json",
                            async: false,
                            data: {},
                            success: function (data) {
                                if (data.status == "2") {
                                    $.messager.alert('错误', '该商品库存数量不足', 'info');
                                    status = 2;
                                    return;
                                }
                                if (data.status == "0") {
                                    $.messager.alert('错误', '库存中无此书籍', 'info');
                                    status = 2;
                                    return;
                                }
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                $.messager.show({
                                    title: '提示',
                                    msg: 'ajax错误'
                                });
                            }
                        });

                    }else if(Atype == 2){

                        $.ajax({
                            url: '/Stock/outStock',
                            type: "post",
                            contentType: "application/json",
                            dataType: "json",
                            async: false,
                            data: {},
                            success: function (data) {
                                if (data.status == "2") {
                                    $.messager.alert('错误', '订单中某书籍库存数量不足', 'info');
                                    status = 2;
                                    return;
                                }
                                if (data.status == "0") {
                                    $.messager.alert('错误', '库存中无此书籍', 'info');
                                    status = 2;
                                    return;
                                }
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                $.messager.show({
                                    title: '提示',
                                    msg: 'ajax错误'
                                });
                            }
                        });

                    }
                    if (status == 1) {
                        $.messager.show({
                            title: '提示',
                            msg: '操作成功'
                        });
                    }
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("textStatus = " + textStatus + ", XMLHttpRequest.status = " + XMLHttpRequest.status + ", XMLHttpRequest.readyState = " + XMLHttpRequest.readyState);
            }
        });
    }

    //修改单据主表并删除原来详情表重新添加
    function edit() {

        $("#wu-form-2").form('submit', {
            url: '/Order/update',
            success: function (data) {
                if (data) {
                    $('#dd').dialog('close');
                    $.ajax({
                        url: '/Orderdetail/del?order_id=' + $('#tt').datagrid('getSelected').id,
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            if (data) {
                                var rows = $('.orderdetail').datagrid('getRows');
                                for (var i = 0; i < rows.length; i++) {
                                    $.ajax({
                                        url: '/Orderdetail/insert?order_id=' + $('#tt').datagrid('getSelected').id,
                                        type: "post",
                                        dataType: "json",
                                        data: rows[i],
                                        success: function (data) {
                                            $.messager.show({
                                                title: '提示',
                                                msg: '操作成功'
                                            });
                                            reload();
                                        },
                                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                                            $.messager.show({
                                                title: '提示',
                                                msg: '"textStatus = " + textStatus + ", XMLHttpRequest.status = " + XMLHttpRequest.status + ", XMLHttpRequest.readyState = " + XMLHttpRequest.readyState'
                                            });
                                        }
                                    });
                                }
                            }
                        }
                    });

                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("textStatus = " + textStatus + ", XMLHttpRequest.status = " + XMLHttpRequest.status + ", XMLHttpRequest.readyState = " + XMLHttpRequest.readyState);
            }
        });

    }


</script>

<div id="dd"></div>

<script type="text/javascript" src="/pages/js/my.js"></script>

</body>
</html>

