<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ include file="../base.jsp" %>
<!doctype html>
<!--[if IE 9 ]><html class="ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->

<head>
    <title>招聘之家</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!--meta info-->
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link type="text/css" rel="stylesheet" href="<%=path%>/css/validator.css"></link>
    <link type="text/css" rel="stylesheet" href="<%=path%>/css/famouse.css"></link>
    <script src="<%=path%>/js/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
    <script src="<%=path%>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
    <script type="text/javascript">

    </script>

</head>
<body>
<!--wide layout-->
<div class="wide_layout relative">
    <!--[if (lt IE 9) | IE 9]>
    <div style="background:#fff;padding:8px 0 10px;">
        <div class="container" style="width:1170px;">
            <div class="row wrapper">
                <div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i
                        class="fa fa-exclamation-triangle scheme_color f_left m_right_10"
                        style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not
                    display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster,
                    safer browsing experience.</b></div>
                <div class="t_align_r" style="float:left;width:16%;"><a
                        href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"
                        class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank"
                        style="margin-bottom:2px;">Update Now!</a></div>
            </div>
        </div>
    </div>
    <![endif]-->
    <!--markup header-->
    <!--boxed layout-->
    <div class="boxed_layout relative w_xs_auto">
        <!--[if (lt IE 9) | IE 9]>
        <div style="background:#fff;padding:8px 0 10px;">
            <div class="container" style="width:1170px;">
                <div class="row wrapper">
                    <div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i
                            class="fa fa-exclamation-triangle scheme_color f_left m_right_10"
                            style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may
                        not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a
                        faster, safer browsing experience.</b></div>
                    <div class="t_align_r" style="float:left;width:16%;"><a
                            href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"
                            class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c"
                            target="_blank" style="margin-bottom:2px;">Update Now!</a></div>
                </div>
            </div>
        </div>
        <![endif]-->
        <!--markup header-->
        <header>
            <%@ include file="../head.jsp" %>
        </header>

        <!--content-->
        <div class="page_content_offset">
            <div class="container">
                <!--breadcrumbs-->
                <section class="breadcrumbs">
                    <div class="container">
                        <ul class="horizontal_list clearfix bc_list f_size_medium">
                            <li class="m_right_10 current"><a href="#" class="default_t_color">招聘之家<i
                                    class="fa fa-angle-right d_inline_middle m_left_10"></i></a></li>
                            <li><a href="#" class="default_t_color">技巧</a></li>
                        </ul>
                    </div>
                </section>
                <!--content-->
                <div class="page_content_offset">
                    <div class="container">
                        <div class="row clearfix">
                            <!--left content column-->
                            <section id="xinwen" class="col-lg-9 col-md-9 col-sm-9">
                                <h2 class="tt_uppercase color_dark m_bottom_25">技巧</h2>
                                <!--blog post-->


                            </section>
                            <!--right column-->
                            <aside class="col-lg-3 col-md-3 col-sm-3">
                                <!--widgets-->
                                <figure class="widget shadow r_corners wrapper m_bottom_30">
                                    <figcaption>
                                        <h3 class="color_light">Blog分类</h3>
                                    </figcaption>
                                    <div class="widget_content">
                                        <!--Categories list-->
                                        <ul class="categories_list">
                                            <li class="active">
                                                <a href="#" class="f_size_large color_dark d_block">
                                                    <b>职场</b>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="f_size_large color_dark d_block">
                                                    <b>简历</b>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" class="f_size_large color_dark d_block">
                                                    <b>毕业生</b>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </figure>
                                <!--banner-->
                                <a href="#" class="d_block d_xs_inline_b r_corners m_bottom_30">
                                    <img src="<%=path%>/images/banner_img1_6.jpg" alt="">
                                </a>
                                <!--Popular articles-->
                                <figure class="widget shadow r_corners wrapper m_bottom_30">
                                    <figcaption>
                                        <h3 class="color_light">热门技巧</h3>
                                    </figcaption>
                                    <div class="widget_content">
                                        <article class="clearfix m_bottom_15">
                                            <img src="<%=path%>/images/article_img1_1.jpg" alt=""
                                                 class="f_left m_right_15 m_sm_bottom_10 f_sm_none f_xs_left m_xs_bottom_0">
                                            <a href="#" class="color_dark d_block bt_link p_vr_0">自我介绍攻略大全</a>
                                            <p class="f_size_medium">刘德华</p>
                                        </article>
                                        <hr class="m_bottom_15">
                                        <article class="clearfix m_bottom_15">
                                            <img src="<%=path%>/images/article_img1_2.jpg" alt=""
                                                 class="f_left m_right_15 m_sm_bottom_10 f_sm_none f_xs_left m_xs_bottom_0">
                                            <a href="#" class="color_dark d_block p_vr_0 bt_link">HR教你极品简历这样写 </a>
                                            <p class="f_size_medium">张学友</p>
                                        </article>
                                        <hr class="m_bottom_15">
                                        <article class="clearfix m_bottom_5">
                                            <img src="<%=path%>/images/article_img1_3.jpg" alt=""
                                                 class="f_left m_right_15 m_sm_bottom_10 f_sm_none f_xs_left m_xs_bottom_0">
                                            <a href="#" class="color_dark d_block p_vr_0 bt_link">面霸是这样炼成的</a>
                                            <p class="f_size_medium">郭富城</p>
                                        </article>
                                    </div>
                                </figure>
                                <!--Bestsellers-->
                                <figure class="widget shadow r_corners wrapper m_bottom_30">
                                    <figcaption>
                                        <h3 class="color_light">最新技巧</h3>
                                    </figcaption>
                                    <div class="widget_content">
                                        <div class="clearfix m_bottom_15">
                                            <img src="<%=path%>/images/bestsellers_img1_1.jpg" alt=""
                                                 class="f_left m_right_15 m_sm_bottom_10 f_sm_none f_xs_left m_xs_bottom_0">
                                            <a href="#" class="color_dark d_block bt_link">顺丰：如何优雅地留住“快</a>
                                            <!--rating-->
                                            <ul class="horizontal_list clearfix d_inline_b rating_list type_2 tr_all_hover m_bottom_10">
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                            </ul>
                                            <p class="scheme_color">朱迪</p>
                                        </div>
                                        <hr class="m_bottom_15">
                                        <div class="clearfix m_bottom_15">
                                            <img src="<%=path%>/images/bestsellers_img1_2.jpg" alt=""
                                                 class="f_left m_right_15 m_sm_bottom_10 f_sm_none f_xs_left m_xs_bottom_0">
                                            <a href="#" class="color_dark d_block bt_link">肢体语言助你玩转职场</a>
                                            <!--rating-->
                                            <ul class="horizontal_list clearfix d_inline_b rating_list type_2 tr_all_hover m_bottom_10">
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                            </ul>
                                            <p>加菲猫</p>
                                        </div>
                                        <hr class="m_bottom_15">
                                        <div class="clearfix m_bottom_5">
                                            <img src="<%=path%>/images/bestsellers_img1_3.jpg" alt=""
                                                 class="f_left m_right_15 m_sm_bottom_10 f_sm_none f_xs_left m_xs_bottom_0">
                                            <a href="#" class="color_dark d_block bt_link">毕业去哪儿</a>
                                            <!--rating-->
                                            <ul class="horizontal_list clearfix d_inline_b rating_list type_2 tr_all_hover m_bottom_10">
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li class="active">
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                                <li>
                                                    <i class="fa fa-star-o empty tr_all_hover"></i>
                                                    <i class="fa fa-star active tr_all_hover"></i>
                                                </li>
                                            </ul>
                                            <p>泰迪熊</p>
                                        </div>
                                    </div>
                                </figure>
                                <!--Specials-->
                                <figure class="widget shadow r_corners wrapper m_bottom_30">
                                    <figcaption class="clearfix relative">
                                        <h3 class="color_light f_left f_sm_none m_sm_bottom_10 m_xs_bottom_0">小编技巧</h3>
                                        <div class="f_right nav_buttons_wrap_type_2 tf_sm_none f_sm_none clearfix">
                                            <button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large color_light t_align_c bg_tr f_left tr_delay_hover r_corners sc_prev">
                                                <i class="fa fa-angle-left"></i></button>
                                            <button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large color_light t_align_c bg_tr f_left m_left_5 tr_delay_hover r_corners sc_next">
                                                <i class="fa fa-angle-right"></i></button>
                                        </div>
                                    </figcaption>
                                    <div class="widget_content">
                                        <div class="specials_carousel">
                                            <!--carousel item-->
                                            <div class="specials_item">
                                                <a href="#" class="d_block d_xs_inline_b wrapper m_bottom_20">
                                                    <img class="tr_all_long_hover"
                                                         src="<%=path%>/images/product_img1_6.jpg" alt="">
                                                </a>
                                                <h5 class="m_bottom_10"><a href="#" class="color_dark">应届生面试全攻略</a></h5>
                                                <p class="f_size_large m_bottom_15"><s></s> <span class="scheme_color">科比</span>
                                                </p>
                                                <button class="button_type_4 mw_sm_0 r_corners color_light bg_scheme_color tr_all_hover m_bottom_5">
                                                    阅读
                                                </button>
                                            </div>
                                            <!--carousel item-->
                                            <div class="specials_item">
                                                <a href="#" class="d_block d_xs_inline_b wrapper m_bottom_20">
                                                    <img class="tr_all_long_hover"
                                                         src="<%=path%>/images/product_img1_7.jpg" alt="">
                                                </a>
                                                <h5 class="m_bottom_10"><a href="#" class="color_dark">把100个面试问题变成5个</a>
                                                </h5>
                                                <p class="f_size_large m_bottom_15"><s></s> <span class="scheme_color">乔丹</span>
                                                </p>
                                                <button class="button_type_4 mw_sm_0 r_corners color_light bg_scheme_color tr_all_hover m_bottom_5">
                                                    阅读
                                                </button>
                                            </div>
                                            <!--carousel item-->
                                            <div class="specials_item">
                                                <a href="#" class="d_block d_xs_inline_b wrapper m_bottom_20">
                                                    <img class="tr_all_long_hover"
                                                         src="<%=path%>/images/product_img1_5.jpg" alt="">
                                                </a>
                                                <h5 class="m_bottom_10"><a href="#"
                                                                           class="color_dark">致2016届离校未就业高校毕</a></h5>
                                                <p class="f_size_large m_bottom_15"><s></s> <span class="scheme_color">艾佛森</span>
                                                </p>
                                                <button class="button_type_4 mw_sm_0 r_corners color_light bg_scheme_color tr_all_hover m_bottom_5">
                                                    阅读
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                            </aside>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--markup footer-->
        <footer id="footer">
            <%@ include file="../foot.jsp" %>
        </footer>
        <!--social widgets-->
        <%@ include file="../right.jsp" %>
</body>
</html>
<script>
    $(function () {
        $.ajax({
            url: "/jobskill/index",
            type: "post",
            dataType: "json",
            data: {
                page: 1,
                rows: 5
            },
            success: function (data, textStatus, jqXHR) {
                if (data != "") {
                    var html = "";
                    for (var i = 0; i < data.rows.length; i++) {
                        var dataInfo = data.rows[i];
                        html += '<article class="m_bottom_25"> ' +
                            '<div class="row clearfix m_bottom_10"><div class="col-lg-9 col-md-9 col-sm-9">' +
                            '<h4 class="m_bottom_5"><a  href="#" class="color_dark fw_medium">' + dataInfo.title + '</a></h4>' +
                            '<p id="createTime" class="f_size_medium">' + dataInfo.createTime + ' <a href="#" class="color_dark"></a>, </p></div>' +
                            '<div class="col-lg-3 col-md-3 col-sm-3 t_align_r t_sm_align_l">' +
                            '';
                        if (dataInfo.isHot == 1) {
                            var html1 = '<ul class="horizontal_list d_inline_middle type_2 clearfix rating_list tr_all_hover">'
                            html1 += '<li class = "active" > 热</li><li class = "active" > 门</li><li class = "active" > 技</li><li class = "active" > 巧</li>';
                            html1 += '</ul>';
                        }
                        if (dataInfo.isHot == 0) {
                            var html1 = '<ul class="horizontal_list d_inline_middle type_2 clearfix rating_list tr_all_hover">'
                            html1 += '<li class = "active" > 非</li><li class = "active" > 热</li><li class = "active" > 门</li>';
                            html1 += '</ul>';
                        }
                        html += html1;
                        html += '</div></div>' +
                            '<p class = "m_bottom_10" >' + dataInfo.content + ' </p></article>' +
                            '<hr class = "divider_type_3 m_bottom_30" >'

                    }
                    $("#xinwen").append(html);
                }

            }
        })
    });


</script>