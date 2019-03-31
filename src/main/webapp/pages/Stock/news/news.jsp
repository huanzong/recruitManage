<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>新闻管理</title>
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
            {field: 'title', title: '新闻标题', width: 80, sortable: true},
            {field: 'content', title: '正文', width: 180, sortable: true},
            {field: 'createTime', title: '创建时间', width: 80, sortable: true},
//            {field: 'picUrl', title: '图片', width: 80, sortable: true},
            {field: 'newsArea', title: '所属领域', width: 80, sortable: true},
            {field: 'newsStar', title: '星级', width: 80, sortable: true},
            {
                field: 'opt', title: '操作', width: 80, align: 'center',
                formatter: function (value, rec) {
                    var btn = "<a class=''  href='javascript:void(0)' onclick='del(" + rec.id + ")'>删除</a> ";
                    return btn;
                }
            }
        ];
        datagridInit("/news/index", cols);
    });

    function openAdd() {
        openDialog("新增", "newsEdit.jsp", 550, 400, add);
    }

    function openEdit() {
        openDialog("修改", "newsEdit.jsp", 550, 400, edit, $('#tt').datagrid('getSelected'));
    }

    function seach() {
        $('#tt').datagrid('load', {
            txt: txt.value
        });
    }

    function add() {
        $("[name=id]").val(0);
        $('#wu-form-2').form('submit', {
            url: '/news/insert',
            success: function (data) {
                if (data) {
                    $('#dd').dialog('close');
                    reload();
                }
            }
        });
        saveImage();
    }

    function edit() {
        $('#wu-form-2').form('submit', {
            url: '/news/update',
            success: function (data) {
                if (data) {
                    $('#dd').dialog('close');
                    reload();
                }
            }
        });
        saveImage();
    }

    function del(id) {
        $.messager.confirm("确认", "确定要删除当前行吗？", function (r) {
            if (r) {
                $.getJSON("/news/del", {
                    id: id
                }, function () {
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


    function saveImage() {
//        var formData = new FormData();
//        var file = $("#fileputHB")[0].files[0];
//        var eid = $("#newId").val();
//        formData.append("file", file );
//        formData.append("eid", eid);
//        $.ajaxFile({
//            url: "/news/uploadImage",
//            async: false,
//            enctype: 'multipart/form-data',
//            processData: false,
//            contentType: false,
//            dataType: 'json',
//            type: "post",
//            data: formData,
//            success: function (data, textStatus, jqXHR) {
//                if (data == 1) {
//                    alert("保存成功！");
//                } else {
//                    alert("异常！");
//                }
//            },
//            error: function () {
//                alert("异常！");
//            }
//        });


//        $.ajaxFileUpload({
//                url : '/news/uploadImage', //用于文件上传的服务器端请求地址
//                secureuri : false, //是否需要安全协议，一般设置为false
//                fileElementId : 'fileputHB', //文件上传域的ID
//                dataType : 'json', //返回值类型 一般设置为json
//                type : 'post',
//                success : function(data) {
//                    alert(data.result.key);//后台返回的key
//                },
//                error : function(data) {
//                    console.log("错误：" + data);
//                }
//            });

    }
</script>

<div id="dd"></div>

<script type="text/javascript" src="/pages/js/my.js"></script>

</body>
</html>

