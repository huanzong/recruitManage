<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="custom/jquery.min.js"></script>
</head>
<body>
<form id="wu-form-2" method="post">
    <div style="padding: 10px 15px 10px 15px">
        <table>
            <tr>
                <input id="newId" type="hidden" name="id" value="0"/>
            </tr>

            <tr>
                <td align="right" class="wu-form-text"> 标题：</td>
                <td colspan="3"><input type="text" name="title" style="width: 460px"
                                       class="easyui-validatebox inputlist comments" required="true"></td>
            </tr>
            <tr>
                <td align="right" class="wu-form-text"> 正文：</td>
                <td colspan="3"><textarea type="text" name="content" style="width: 460px;height: 300px"
                                          class="easyui-validatebox inputlist comments" required="required"/></td>
            </tr>
            <tr>
                <td align="right" class="wu-form-text">热门：</td>
                <td><input type="text" name="isHot" class="easyui-combobox inputlist combobox" required="required" data-options="valueField:0,textField:1,url:'/jobskill/hotlist'">
                </td>
                <td align="right" class="wu-form-text">状态：</td>
                <td><input type="text" name="status" class="easyui-combobox inputlist combobox" required="true" data-options="valueField:0,textField:1,url:'/jobskill/statuslist'">
                </td>
            </tr>

        </table>
    </div>

</form>
<style>
    tr {
        height: 30px;
    }

    tr > td:nth-child(odd) {
        color: #999;
        padding-right: 6px;
        padding-bottom: 5px
    }

    .inputlist {
        margin: 8px 20px 8px 0;
        width: 150px;
        height: 24px;
    }

    .multiple {
        height: 48px;
    }

    .combobox {
        height: 26px;
    }

    .comments {
        width: 355px;
    }
</style>
<script>

    if (alldata != null) $('#dd form').form('load', alldata);

</script>
</body>
</html>
