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
                <td align="right" class="wu-form-text">分类：</td>
                <td><input type="text" name="newsArea" class="easyui-validatebox wu-text inputlist" required="required">
                </td>
                <td align="right" class="wu-form-text">星级：</td>
                <td><input type="text" name="newsStar" class="easyui-validatebox wu-text inputlist" required="true">
                </td>
            </tr>
            <%--<tr>--%>
                <%--<td align="right" class="wu-form-text"> 图片：</td>--%>
                <%--<td><input multiple style="width:300px" id="fileputHB" name="fileputHB" class="easyui-filebox"--%>
                           <%--data-options='onChange:change_photo'></td>--%>
                <%--&lt;%&ndash;<td colspan="3"><input  type="text" name="picUrl" class="easyui-validatebox wu-text inputlist comments" required="required"></td>&ndash;%&gt;--%>
            <%--</tr>--%>
            <%--<tr id="inputCB4" style="display: none">--%>
                <%--<td><label>图片预览</label></td>--%>
                <%--<td>--%>
                    <%--<div id="Imgdiv"><img id="Img" width="200px" height="200px"/></div>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <tr>
                <input id="picUrl" type="hidden" name="picUrl" value=""/>
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
    $(function () {
        if ($("#picUrl").val() != "") {
            $("#inputCB4").show();
            $("#Img").attr("src", $("#picUrl").val());
        }
    })

    if (alldata != null) $('#dd form').form('load', alldata);


    function change_photo() {
        PreviewImage($("input[name='fileputHB']")[0], 'Img', 'Imgdiv');
    }

    function PreviewImage(fileObj, imgPreviewId, divPreviewId) {
        var allowExtention = ".jpg,.bmp,.gif,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;
        var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
        var browserVersion = window.navigator.userAgent.toUpperCase();
        if (allowExtention.indexOf(extention) > -1) {
            if (fileObj.files) {//HTML5实现预览，兼容chrome、火狐7+等
                if (window.FileReader) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById(imgPreviewId).setAttribute("src", e.target.result);
                        document.getElementById("picUrl").setAttribute("value", e.target.result);
                    }
                    reader.readAsDataURL(fileObj.files[0]);
                } else if (browserVersion.indexOf("SAFARI") > -1) {
                    alert("不支持Safari6.0以下浏览器的图片预览!");
                }
            } else if (browserVersion.indexOf("MSIE") > -1) {
                if (browserVersion.indexOf("MSIE 6") > -1) {//ie6
                    document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
                    document.getElementById("picUrl").setAttribute("value", fileObj.value);
                } else {//ie[7-9]
                    fileObj.select();
                    if (browserVersion.indexOf("MSIE 9") > -1)
                        fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问
                    var newPreview = document.getElementById(divPreviewId + "New");
                    if (newPreview == null) {
                        newPreview = document.createElement("div");
                        newPreview.setAttribute("id", divPreviewId + "New");
                        newPreview.style.width = document.getElementById(imgPreviewId).width + "px";
                        newPreview.style.height = document.getElementById(imgPreviewId).height + "px";
                        newPreview.style.border = "solid 1px #d2e2e2";
                    }
                    newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";
                    var tempDivPreview = document.getElementById(divPreviewId);
                    tempDivPreview.parentNode.insertBefore(newPreview, tempDivPreview);
                    tempDivPreview.style.display = "none";
                }
            } else if (browserVersion.indexOf("FIREFOX") > -1) {//firefox
                var firefoxVersion = parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
                if (firefoxVersion < 7) {//firefox7以下版本
                    document.getElementById(imgPreviewId).setAttribute("src", fileObj.files[0].getAsDataURL());
                    document.getElementById("picUrl").setAttribute("value", fileObj.files[0].getAsDataURL());
                } else {//firefox7.0+
                    document.getElementById(imgPreviewId).setAttribute("src", window.URL.createObjectURL(fileObj.files[0]));
                    document.getElementById("picUrl").setAttribute("value", window.URL.createObjectURL(fileObj.files[0]));
                }
            } else {
                document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
                document.getElementById("picUrl").setAttribute("value", fileObj.value);
            }
        } else {
            alert("仅支持" + allowExtention + "为后缀名的文件!");
            fileObj.value = "";//清空选中文件
            if (browserVersion.indexOf("MSIE") > -1) {
                fileObj.select();
                document.selection.clear();
            }
            fileObj.outerHTML = fileObj.outerHTML;
        }
        $("#inputCB4").show();

    }
</script>
</body>
</html>
