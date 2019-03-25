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
                <td align="right" class="wu-form-text" >账户：</td>
                <td><input  type="text" name="account" class="easyui-validatebox wu-text inputlist" required="required"></td>
                <td align="right" class="wu-form-text">密码：</td>
                <td><input  type="text" name="pass" class="easyui-validatebox wu-text inputlist" required="true"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text">类型：</td>
                <td><input class="easyui-combobox inputlist combobox" editable="false" name="type" data-options="valueField:0,textField:1,url:'/userReview/typelist'" required="true"></td>
                <td align="right" class="wu-form-text">状态：</td>
                <td><input class="easyui-combobox inputlist combobox" editable="false" name="status" data-options="valueField:0,textField:1,url:'/userReview/statuslist'" required="true"></td>
            </tr>

            <tr >
                <td align="right" class="wu-form-text">密码问题：</td>
                <td colspan="3"><input  type="text" name="question" class="easyui-validatebox comments inputlist" required="true"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text">密码答案：</td>
                <td colspan="3"><input  type="text" name="answer" class="easyui-validatebox comments inputlist" required="true"></td>
            </tr>
        </table>
    </div>

</form>
<style>
    tr{ height: 30px;}
    tr>td:nth-child(odd){
        color: #999;padding-right: 6px;padding-bottom: 5px;padding-left: 6px;
    }

    .inputlist{
        margin-bottom: 8px;
        width: 150px;
        height: 24px;
    }
    .multiple{
        height:48px;
    }
    .combobox{
        height:26px;margin-left: 4px
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
