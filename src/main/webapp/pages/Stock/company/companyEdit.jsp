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
                <td align="right" class="wu-form-text" >公司名称：</td>
                <td><input  type="text" name="name" class="easyui-validatebox wu-text inputlist" required="required"></td>

                <td align="right" class="wu-form-text">登录账户：</td>
                <td><input  type="text" name="userId" class="easyui-validatebox wu-text inputlist" required="true"></td>

                <td align="right" class="wu-form-text">公司类型：</td>
                <td><input  type="text" name="comType" class="easyui-validatebox wu-text inputlist" required="true"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text" >公司规模：</td>
                <td><input  type="text" name="empCount" class="easyui-validatebox wu-text inputlist" required="required"></td>

                <td align="right" class="wu-form-text">公司邮箱：</td>
                <td><input  type="text" name="email" class="easyui-validatebox wu-text inputlist" required="true"></td>

                <td align="right" class="wu-form-text">公司电话：</td>
                <td><input  type="text" name="comTel" class="easyui-validatebox wu-text inputlist" required="true"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text" >公司法人：</td>
                <td><input  type="text" name="manager" class="easyui-validatebox wu-text inputlist" required="required"></td>

                <td align="right" class="wu-form-text">法人电话：</td>
                <td><input  type="text" name="mTel" class="easyui-validatebox wu-text inputlist" required="true"></td>

                <td align="right" class="wu-form-text">所属行业：</td>
                <td><input  type="text" name="trade" class="easyui-validatebox wu-text inputlist" required="true"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text">公司描述：</td>
                <td><input  type="text" name="description" class="easyui-validatebox inputlist" required="true"></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text">公司地址：</td>
                <td><input  type="text" name="address" class="easyui-validatebox inputlist" required="true"></td>
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
        margin: 8px 0 8px 0;
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
