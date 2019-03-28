<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>求职招聘系统</title>
    <link href="pages/css/base.css" rel="stylesheet">
    <link href="pages/css/platform.css" rel="stylesheet">
    <link rel="stylesheet" href="custom/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="pages/css/wu.css"/>
    <script type="text/javascript" src="custom/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <div id="pf-hd">
        <div class="pf-logo">
            <img src="pages/images/main/main_logo.png" alt="logo">
        </div>
        <div class="pf-nav-wrap">
            <div class="pf-nav-ww">
                <ul class="pf-nav">
                    <li class="pf-nav-item home current" data-menu="sys-manage">
                        <a href="javascript:;">
                            <span class="iconfont">&#xe63f;</span>
                            <span class="pf-nav-title">系统管理</span>
                        </a>
                    </li>
                    <li class="pf-nav-item project" data-menu="org-manage">
                        <a class="operatorClick" href="javascript:;">
                            <span class="iconfont">&#xe60d;</span>
                            <span class="pf-nav-title">管理员管理</span>
                        </a>
                    </li>
                    <li class="pf-nav-item static" data-menu="main-data">
                        <a class="yonghuClick" href="javascript:;">
                            <span class="iconfont">&#xe61e;</span>
                            <span class="pf-nav-title">用户管理</span>
                        </a>
                    </li>
                    <li class="pf-nav-item manger" data-menu="supplier-mange">
                        <a class="chubansheClick" href="javascript:;">
                            <span class="iconfont">&#xe620;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="supplier-dev">
                        <a class="churuClick" href="javascript:;">
                            <span class="iconfont">&#xe625;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a class="shujiClick" href="javascript:;">
                            <span class="iconfont">&#xe64b;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="contract-mange">
                        <a class="guanliClick" href="javascript:;">
                            <span class="iconfont">&#xe64c;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>


                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a class="zhiweiClick" href="javascript:;">
                            <span class="iconfont">&#xe623;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="contract-mange">
                        <a class="bumenClick" href="javascript:;">
                            <span class="iconfont">&#xe646;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>
                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a class="cangkuClick" href="javascript:;">
                            <span class="iconfont">&#xe623;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>

                    <li class="pf-nav-item manger" data-menu="contract-mange">
                        <a class="qingjiaClick" href="javascript:;">
                            <span class="iconfont">&#xe646;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>


                    <li class="pf-nav-item manger" data-menu="pur-source">
                        <a class="qingjiajiluClick" href="javascript:;">
                            <span class="iconfont">&#xe623;</span>
                            <span class="pf-nav-title">无</span>
                        </a>
                    </li>


                </ul>
            </div>


            <a href="javascript:;" class="pf-nav-prev disabled iconfont">&#xe606;</a>
            <a href="javascript:;" class="pf-nav-next iconfont">&#xe607;</a>
        </div>


        <div class="pf-user">
            <div class="pf-user-photo">
                <img src="pages/images/main/user.png" alt="">
            </div>
            <h4 class="pf-user-name ellipsis">${admin.account}</h4>
            <i class="iconfont xiala">&#xe607;</i>

            <div class="pf-user-panel">
                <ul class="pf-user-opt">
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe60d;</i>
                            <span class="pf-opt-name">用户信息</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="openpass()">
                            <i class="iconfont">&#xe634;</i>
                            <span class="pf-opt-name">修改密码</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="resetpass()">
                            <i class="iconfont">&#xe634;</i>
                            <span class="pf-opt-name">重置密码</span>
                        </a>
                    </li>
                    <li class="pf-logout">
                        <a href="../operator/out">
                            <i class="iconfont">&#xe60e;</i>
                            <span class="pf-opt-name">退出</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </div>

    <div id="pf-bd">
        <div id="pf-sider">
            <h2 class="pf-model-name">
                <span class="iconfont">&#xe64a;</span>
                <span class="pf-name">组织管理</span>
                <span class="toggle-icon"></span>
            </h2>

            <ul class="sider-nav">
                <li class="mokuai">
                    <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe620;</span>
                        <span class="sider-nav-title">管理员管理</span>
                        <i class="iconfont">&#xe642;</i>
                    </a>
                    <ul class="sider-nav-s">
                        <li><a class="quanxian GLClick" power="管理员管理" href="#"
                               onclick="addTab('管理员信息','pages/Stock/operator/operator.jsp')">管理员信息</a></li>
                    </ul>
                </li>
                <li class="mokuai">
                    <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe620;</span>
                        <span class="sider-nav-title">用户管理</span>
                        <i class="iconfont">&#xe642;</i>
                    </a>
                    <ul class="sider-nav-s">
                        <li><a class="yonghu" power="用户管理" href="#"
                               onclick="addTab('用户管理','pages/Stock/user/user.jsp')">用户管理</a></li>
                    </ul>
                </li>
                <li class="mokuai">
                    <a href="javascript:;">
                        <span class="iconfont sider-nav-icon">&#xe620;</span>
                        <span class="sider-nav-title">公司管理</span>
                        <i class="iconfont">&#xe642;</i>
                    </a>
                    <ul class="sider-nav-s">
                        <li><a href="#" class="ygClick quanxian" power="公司管理"
                               onclick="addTab('公司管理','pages/Stock/company/company.jsp')">公司管理</a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>

        <div id="pf-page">
            <div id="tt" class="easyui-tabs1" style="width:100%;height:100%;">
                <div title="首页" style="padding:10px 5px 5px 10px;">
                    <iframe class="page-iframe" src="workbench.html" frameborder="no" border="no" height="100%"
                            width="100%" scrolling="auto"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="custom/jquery.easyui.min.js"></script>
<script type="text/javascript" src="pages/js/main.js"></script>
<%--<script type="text/javascript" src="js/menu.js"></script>--%>
<!--[if IE 7]>
<script type="text/javascript">
    $(window).resize(function () {
        $('#pf-bd').height($(window).height() - 76);
    }).resize();

</script>
<![endif]-->


<script type="text/javascript">
    $('.easyui-tabs1').tabs({
        tabHeight: 44,
        onSelect: function (title, index) {
            var currentTab = $('.easyui-tabs1').tabs("getSelected");
            if (currentTab.find("iframe") && currentTab.find("iframe").size()) {
                currentTab.find("iframe").attr("src", currentTab.find("iframe").attr("src"));
            }
        }
    })
    $(window).resize(function () {
        $('.tabs-panels').height($("#pf-page").height() - 46);
        $('.panel-body').height($("#pf-page").height() - 76)
    }).resize();

    var page = 0,
        pages = ($('.pf-nav').height() / 70) - 1;

    if (pages === 0) {
        $('.pf-nav-prev,.pf-nav-next').hide();
    }
    $(document).on('click', '.pf-nav-prev,.pf-nav-next', function () {


        if ($(this).hasClass('disabled')) return;
        if ($(this).hasClass('pf-nav-next')) {
            page++;
            $('.pf-nav').stop().animate({'margin-top': -70 * page}, 200);
            if (page == pages) {
                $(this).addClass('disabled');
                $('.pf-nav-prev').removeClass('disabled');
            } else {
                $('.pf-nav-prev').removeClass('disabled');
            }

        } else {
            page--;
            $('.pf-nav').stop().animate({'margin-top': -70 * page}, 200);
            if (page == 0) {
                $(this).addClass('disabled');
                $('.pf-nav-next').removeClass('disabled');
            } else {
                $('.pf-nav-next').removeClass('disabled');
            }

        }
    })

    function addTab(title, url) {
        if ($('#tt').tabs('exists', title)) {
            $('#tt').tabs('select', title);
        } else {
            var content = '<iframe name="right"  scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
            $('#tt').tabs('add', {
                title: title,
                content: content,
                closable: true
            });
        }
    }

    function resetpass(id) {
        $.messager.confirm("确认", "确定要重置密码吗？", function (r) {
            if (r) {
                $.getJSON("/operator/resetpass", {
                    id: ${admin.id}
                }, function () {

                });

            }

        });
    }


    function openpass() {
        $('#dd8').dialog({
            closed: false,
            modal: true,
            title: "修改密码",
            buttons: [{
                text: "保存",
                iconCls: 'icon-ok',
                handler: editpass
            }, {
                text: "关闭",
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#dd8').dialog('close');
                }
            }]
        });
    }

    function editpass() {
        $('#kkk').form('submit', {
            url: '../operator/updatepass',
            success: function (data) {
                if (data[10] == "1") {
                    $('#dd8').dialog('close');
                    $.messager.alert("成功", "修改密码成功！！", function (r) {
                    });
                } else {
                    $.messager.alert("错误", "信息输入有误,请重新输入！", function (r) {
                    });
                }
            }

        });
    }



    //顶部按钮书籍信息
    $(".yonghuClick").click(function () {
        $(".yonghu").click();

    });

    //顶部按钮管理员
    $(".operatorClick").click(function () {
        $(".GLClick").click();

    });

    //顶部按钮职位
    $(".zhiweiClick").click(function () {
        $(".zhiwei").click();

    });

    //顶部按钮部门管理
    $(".bumenClick").click(function () {
        $(".bumen").click();

    });

    //顶部按钮员仓库管理
    $(".cangkuClick").click(function () {
        $(".cangku").click();

    });

    //顶部按钮员请假管理
    $(".qingjiaClick").click(function () {
        $("#qingjiachuli").click();

    });

    //顶部按钮员请假记录
    $(".qingjiajiluClick").click(function () {
        $(".qingjiainfo").click();

    });
</script>

<div id="dd8" class="easyui-dialog" title="My Dialog"
     style="width:480px;height:320px;"
     data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
    <form id="kkk" method="post">
        <table>
            <tr>
                <input type="hidden" name="id" value="${admin.id}"/>
                <td align="right" class="wu-form-text">请输入原密码</td>
                <td><input type="password" name="old"
                           class=" easyui-validatebox wu-text" required="required"/>
                </td>
            </tr>
            <tr>
                <td align="right" class="wu-form-text">请输入新密码</td>
                <td><input type="password" name="new1"
                           class="easyui-validatebox wu-text" data-options="min:0,precision:0"
                           required="required">
                </td>
            </tr>
            <tr>
                <td align="right" class="wu-form-text">确认新密码</td>
                <td><input type="password" name="new2"
                           class="easyui-validatebox wu-text" data-options="min:0,precision:0"
                           required="required">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

