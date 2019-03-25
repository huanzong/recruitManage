<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<form id="wu-form-2" method="post">
    <div style="padding: 10px 15px 10px 15px">
        <table>
            <tr>
                <input type="hidden" name="id" value="0"/>
            </tr>

            <tr >
                <td align="right" class="wu-form-text"> 姓名：</td>
                <td><input class="easyui-validatebox wu-text inputlist" type="text" required="required" name="name"></td>

                <td align="right" class="wu-form-text" > 账号：</td>
                <td><input  type="text" name="account" class="easyui-validatebox wu-text inputlist" required="required"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text"> 手机号：</td>
                <td><input id="phone" class="easyui-validatebox wu-text inputlist" type="text" required="true" name="phone"></td>

                <td align="right" class="wu-form-text"> 状态：</td>
                <td><input class="easyui-combobox inputlist combobox" editable="false" required="true" name="status" data-options="valueField:0,textField:1,url:'/operator/statuslist'"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text" > 身份证号：</td>
                <td colspan="3"><input  type="text" name="card" class="easyui-validatebox wu-text inputlist comments" required="required"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text"> 备注：</td>
                <td colspan="3"><input  type="text" name="comment" class="easyui-validatebox inputlist comments" required="true"></td>
            </tr>
        </table>
    </div>

</form>
<style>
    tr{ height: 30px;}
    tr>td:nth-child(odd){
        color: #999;padding-right: 6px;padding-bottom: 5px
    }

    .inputlist{
        margin: 8px 20px 8px 0;
        width: 150px;
        height: 24px;
    }
    .multiple{
        height:48px;
    }
    .combobox{
        height:26px;
    }
    .comments{
        width: 355px;
    }
</style>
<script>
    if(alldata!=null)  $('#dd form').form('load', alldata);

</script>
</body>
</html>
