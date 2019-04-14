<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
%>


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
    <link rel="icon" type="image/ico" href="<%=path%>/images/fav.ico">
    <!--stylesheet include-->
    <link rel="stylesheet" type="text/css" media="all" href="<%=path%>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="all" href="<%=path%>/css/camera.css">
    <link rel="stylesheet" type="text/css" media="all" href="<%=path%>/css/owl.carousel.css">
    <link rel="stylesheet" type="text/css" media="all" href="<%=path%>/css/owl.transitions.css">
    <link rel="stylesheet" type="text/css" media="all" href="<%=path%>/css/jquery.custom-scrollbar.css">
    <link rel="stylesheet" type="text/css" media="all" href="<%=path%>/css/style.css">
    <script src="<%=path%>/common/sweet/sweet-alert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path%>/common/sweet/sweet-alert.css">
    <script type="text/javascript" src="<%=path%>/common/js/jquery-1.9.1.js"></script>
    <!--font include-->
    <link href="<%=path%>/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: "<%=path%>/job/findTen",
                type: "get",
                dataType: "json",
                success: function (data, textStatus, jqXHR) {
                    var html = "";
                    $.each(data.content, function (index, value) {
                        html += '<div class="product_item">';
                        html += '<figure class="r_corners photoframe shadow relative hit animate_ftb long">';
                        html += '<a href="#" class="d_block relative pp_wrap">';
                        html += '<span class="hot_stripe"><img src="<%=path%>/images/hot_product.png" alt=""></span>';
                        html += '<img src="<%=path%>/images/product_img1_1.jpg" class="tr_all_hover" alt="">';
                        html += '<span  class="button_type_5 box_s_none color_light r_corners tr_all_hover d_xs_none" onclick="detail(' + value.jobId + ')">点此查看</span></a>';
                        html += '<figcaption><h5 class="m_bottom_10"><a href="#" class="color_dark">' + value.jobName + '</a></h5>';
                        html += '	<div class="clearfix"><p class="scheme_color f_left f_size_large m_bottom_15">点击量' + value.count + '</p>';
                        html += '<ul class="horizontal_list f_right clearfix rating_list tr_all_hover">';
                        html += '<li class="active">';
                        html += '	<i class="fa fa-star-o empty tr_all_hover"></i>';
                        html += '<i class="fa fa-star active tr_all_hover"></i></li>';
                        html += '<li class="active">';
                        html += '<i class="fa fa-star-o empty tr_all_hover"></i>';
                        html += '<i class="fa fa-star active tr_all_hover"></i></li>';
                        html += '<li class="active">';
                        html += '<i class="fa fa-star-o empty tr_all_hover"></i>';
                        html += '<i class="fa fa-star active tr_all_hover"></i></li>';
                        html += '<li class="active">';
                        html += '<i class="fa fa-star-o empty tr_all_hover"></i>';
                        html += '<i class="fa fa-star active tr_all_hover"></i></li>';
                        html += '<li><i class="fa fa-star-o empty tr_all_hover"></i>';
                        html += '<i class="fa fa-star active tr_all_hover"></i></li>';
                        html += '</ul></div>';
                        html += '</figcaption></figure></div>';
                    });

                    $("#product_list").html(html);
                },
                error: function () {
                    //alert('阿拉啦啦啦');
                }
            });
        });

        function detail(id) {
// 		$('#quick_view_product').show();
// 			$.ajax({
// 	          url:"<%=path%>/job/findByJobId?id="+id,
// 	          type:"get",
// 	          dataType:"json",
// 	          success:function(data, textStatus, jqXHR){
// 	          		$.each(data.content,function(i,v){
// 	          			$("#detail_"+i).html(v);
// 	          		});
// 	          },
// 	          error:function(){
// 	           	 	swal("查询异常信息!");
// 	          }
// 	   });	
            window.location.href = "<%=path%>/job/goJobDetail?id=" + id;
        }

    </script>
</head>
<body>
<!--boxed layout-->
<div class="boxed_layout relative w_xs_auto">
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
    <header role="banner">

        <%@ include file="head.jsp" %>

    </header>
    <!--slider-->
    <div class="camera_wrap m_bottom_0">
        <div data-src="<%=path%>/images/slide_013.jpg" data-custom-thumb="<%=path%>/images/slide_013.jpg">

        </div>
        <div data-src="<%=path%>/images/slide_012.jpg" data-custom-thumb="<%=path%>/images/slide_012.jpg">
            <div class="camera_caption_2 fadeIn t_align_c d_xs_none">
                <div class="f_size_large tt_uppercase slider_title_3 scheme_color">春季校园招聘会</div>
                <hr class="slider_divider type_2 m_bottom_5 d_inline_b">
                <div class="color_light slider_title tt_uppercase t_align_c m_bottom_65 m_sm_bottom_20"><b><span
                        class="scheme_color"> 2019-05-22</span><br><span class="color_dark">Ready-To-Wear</span></b>
                </div>
                <a href="#" role="button"
                   class="d_sm_inline_b button_type_4 bg_scheme_color color_light r_corners tt_uppercase tr_all_hover">在这等你</a>
            </div>
        </div>
        <div data-src="<%=path%>/images/slide_011.jpg" data-custom-thumb="<%=path%>/images/slide_011.jpg">
            <div class="camera_caption_3 fadeFromTop t_align_c d_xs_none">
                <!-- 						<img src="<%=path%>/images/slider_layer_img.png" alt="" class="m_bottom_5"> -->
                <div class="color_light slider_title tt_uppercase t_align_c m_bottom_60 m_sm_bottom_20"><b
                        class="color_white">机遇总会留给准备好的人,招聘之家助你追梦成功</b></div>
                <a href="#" role="button"
                   class="d_sm_inline_b button_type_4 bg_scheme_color color_light r_corners tt_uppercase tr_all_hover">一起追梦</a>
            </div>
        </div>
    </div>
    <!--content-->
    <div class="page_content_offset">
        <div class="container">
            <h2 class="tt_uppercase m_bottom_20 color_dark heading1 animate_ftr">最热职位</h2>
            <!--filter navigation of products-->
            <ul class="horizontal_list clearfix tt_uppercase isotope_menu f_size_ex_large">
                <li class="active m_right_5 m_bottom_10 m_xs_bottom_5 animate_ftr">
                    <button class="button_type_2 bg_light_color_1 r_corners tr_delay_hover tt_uppercase box_s_none"
                            data-filter="*">All
                    </button>
                </li>
            </ul>
            <!--products-->
            <section class="products_container clearfix m_bottom_25 m_sm_bottom_15">
                <div id="product_list"></div>
            </section>
            <!--blog-->
            <div class="row clearfix m_bottom_45 m_sm_bottom_35">
                <div class="col-lg-6 col-md-6 col-sm-12 m_sm_bottom_35 blog_animate animate_ftr">
                    <div class="clearfix m_bottom_25 m_sm_bottom_20">
                        <h2 class="tt_uppercase color_dark f_left">招聘会通知</h2>
                        <div class="f_right clearfix nav_buttons_wrap">
                            <button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large bg_light_color_1 f_left tr_delay_hover r_corners blog_prev">
                                <i class="fa fa-angle-left"></i></button>
                            <button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large bg_light_color_1 f_left m_left_5 tr_delay_hover r_corners blog_next">
                                <i class="fa fa-angle-right"></i></button>
                        </div>
                    </div>
                    <!--blog carousel-->
                    <div id="zhaopinhui" class="blog_carousel">
                    </div>
                </div>
                <!--testimonials-->
                <div class="col-lg-6 col-md-6 col-sm-12 ti_animate animate_ftr">
                    <div class="clearfix m_bottom_25 m_sm_bottom_20">
                        <h2 class="tt_uppercase color_dark f_left f_mxs_none m_mxs_bottom_15">深度看面试:</h2>
                        <div class="f_right clearfix nav_buttons_wrap f_mxs_none">
                            <button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large bg_light_color_1 f_left tr_delay_hover r_corners ti_prev">
                                <i class="fa fa-angle-left"></i></button>
                            <button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large bg_light_color_1 f_left m_left_5 tr_delay_hover r_corners ti_next">
                                <i class="fa fa-angle-right"></i></button>
                        </div>
                    </div>
                    <!--testimonials carousel-->
                    <div class="testiomials_carousel">
                        <div>
                            <blockquote class="r_corners shadow f_size_large relative m_bottom_15 animate_ftr">
                                请不要总是臆想“企业想对你怎么样”
                                其实大多数比较正常的企业，在面试时，都只不过想多方面综合考虑你是否合适，问一些比较生活化的问题，关注的本身真的不是你的私人生活，真正的重点在于你对待工作的态度。
                            </blockquote>
                            <img class="circle m_left_20 d_inline_middle animate_ftr"
                                 src="<%=path%>/images/testimonial_img1_1.jpg" alt="">
                            <div class="d_inline_middle m_left_15 animate_ftr">
                                <h5 class="color_dark"><b>Wikey</b></h5>
                                <p>山东</p>
                            </div>
                        </div>
                        <div>
                            <blockquote class="r_corners shadow f_size_large relative m_bottom_15">担心因为某个问题回答错误而面试失败
                                这个不是高考，不是因为差一分就铁定被排除在外了。记得论坛一个网友说过，录用你不是因为你真的够格，或许是因为觉得虽然你目前能力有欠但是培养一下还是有潜力的。所以，关于隐私问题，绝对不会因为一个问题，而立即把你排除在外的，当然，你说了什么大逆不道的话，那就没办法了。.
                            </blockquote>
                            <img class="circle m_left_20 d_inline_middle" src="<%=path%>/images/testimonial_img1_2.jpg"
                                 alt="">
                            <div class="d_inline_middle m_left_15">
                                <h5 class="color_dark"><b>温先生</b></h5>
                                <p>上海</p>
                            </div>
                        </div>
                        <div>
                            <blockquote class="r_corners shadow f_size_large relative m_bottom_15">
                                害怕企业会有某些歧视问题要分开看，如果面试官跑上来前三个问题中就涉及到了隐私比如有没有男女朋友有没有结婚有没有小孩子，那不排除有这样的倾向；如果已经到面试后半程甚至临近结束时突然问你这些问题，那么你就如实回答吧，不要太多顾虑，其实只要你能表达对工作的态度，自己有平衡好生活和工作的能力就好。.
                            </blockquote>
                            <img class="circle m_left_20 d_inline_middle" src="<%=path%>/images/testimonial_img1_3.jpg"
                                 alt="">
                            <div class="d_inline_middle m_left_15">
                                <h5 class="color_dark"><b>Anna Johnson</b></h5>
                                <p>广州</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--markup footer-->
    <footer id="footer">
        <%@ include file="foot.jsp" %>
    </footer>
</div>
<!--social widgets-->
<%@ include file="right.jsp" %>
<!--custom popup-->
<div class="popup_wrap d_none" id="quick_view_product">
    <section class="popup r_corners shadow">
        <button class="bg_tr color_dark tr_all_hover text_cs_hover close f_size_large"><i class="fa fa-times"></i>
        </button>
        <div class="clearfix">
            <div class="custom_scrollbar">
                <!--left popup column-->
                <div class="f_left half_column">
                    <div class="relative d_inline_b m_bottom_10 qv_preview">
                        <span class="hot_stripe"><img src="<%=path%>/images/hot_product.png" alt=""></span>
                        <img src="<%=path%>/images/quick_view_img1_1.jpg" class="tr_all_hover" alt="">
                    </div>
                    <!--carousel-->
                    <div class="relative qv_carousel_wrap m_bottom_20">
                        <button class="button_type_11 t_align_c f_size_ex_large bg_cs_hover r_corners d_inline_middle bg_tr tr_all_hover qv_btn_prev">
                            <i class="fa fa-angle-left "></i>
                        </button>
                        <ul class="qv_carousel d_inline_middle">
                            <li data-src="<%=path%>/images/quick_view1_img_1.jpg"><img
                                    src="<%=path%>/images/quick_view1_img_1.jpg" alt=""></li>
                            <li data-src="<%=path%>/images/quick_view1_img_2.jpg"><img
                                    src="<%=path%>/images/quick_view1_img_2.jpg" alt=""></li>
                            <li data-src="<%=path%>/images/quick_view1_img_3.jpg"><img
                                    src="<%=path%>/images/quick_view1_img_3.jpg" alt=""></li>
                            <li data-src="<%=path%>/images/quick_view1_img_1.jpg"><img
                                    src="<%=path%>/images/quick_view1_img_1.jpg" alt=""></li>
                            <li data-src="<%=path%>/images/quick_view1_img_2.jpg"><img
                                    src="<%=path%>/images/quick_view1_img_2.jpg" alt=""></li>
                            <li data-src="<%=path%>/images/quick_view1_img_3.jpg"><img
                                    src="<%=path%>/images/quick_view1_img_3.jpg" alt=""></li>
                        </ul>
                        <button class="button_type_11 t_align_c f_size_ex_large bg_cs_hover r_corners d_inline_middle bg_tr tr_all_hover qv_btn_next">
                            <i class="fa fa-angle-right "></i>
                        </button>
                    </div>
                    <div class="d_inline_middle">Share this:</div>
                    <div class="d_inline_middle m_left_5">
                        <!-- AddThis Button BEGIN -->
                        <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
                            <a class="addthis_button_preferred_1"></a>
                            <a class="addthis_button_preferred_2"></a>
                            <a class="addthis_button_preferred_3"></a>
                            <a class="addthis_button_preferred_4"></a>
                            <a class="addthis_button_compact"></a>
                            <a class="addthis_counter addthis_bubble_style"></a>
                        </div>
                        <!-- AddThis Button END -->
                    </div>
                </div>
                <!--right popup column-->
                <div class="f_right half_column">
                    <!--description-->
                    <h2 class="m_bottom_10"><a href="#" class="color_dark fw_medium" id="detail_jobName">工作名称</a></h2>
                    <div class="m_bottom_10">
                        <!--rating-->
                        <ul class="horizontal_list d_inline_middle type_2 clearfix rating_list tr_all_hover">
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
                        <a href="#" class="d_inline_middle default_t_color f_size_small m_left_5">1 Review(s) </a>
                    </div>
                    <hr class="m_bottom_10 divider_type_3">

                    <table class="description_table m_bottom_10">
                        <input type="hidden" id="detail_comId" name="detail_comId" class="full_width r_corners">
                        <tr>
                            <td>公司名称:</td>
                            <td><a href="#" class="color_dark"><p id="detail_fullname"></p></a></td>
                        </tr>
                        <tr>
                            <td>招聘人数:</td>
                            <td><p id="detail_jobPersoncount"></p></td>
                        </tr>
                        <tr>
                            <td>工作类型:</td>
                            <td><p id="detail_jobStatus"></p></td>
                        </tr>
                        <tr>
                            <td>薪资:</td>
                            <td><p id="detail_salary"></p></td>
                        </tr>
                        <tr>
                            <td>工作地点:</td>
                            <td><p id="detail_address"></p></td>
                        </tr>
                    </table>
                    <h5 class="fw_medium m_bottom_10">要求</h5>
                    <table class="description_table m_bottom_5">
                        <tr>
                            <td>学历要求:</td>
                            <td><span class="color_dark"><p id="detail_degree"></p></span></td>
                        </tr>
                        <tr>
                            <td>语言要求:</td>
                            <td><p id="detail_language"></p></td>
                        </tr>
                    </table>
                    <hr class="divider_type_3 m_bottom_10">
                    <p class="m_bottom_10">工作描述:</p>
                    <p id="detail_description"></p>
                    <hr class="divider_type_3 m_bottom_15">

                    <div class="clearfix m_bottom_15">
                        <button class="button_type_12 r_corners bg_scheme_color color_light tr_delay_hover f_left f_size_large"
                                onclick="goInfo();">查看详情
                        </button>
                        <button class="button_type_12 bg_light_color_2 tr_delay_hover f_left r_corners color_dark m_left_5 p_hr_0">
                            <i class="fa fa-heart-o f_size_big"></i><span
                                class="tooltip tr_all_hover r_corners color_dark f_size_small">Wishlist</span></button>
                        <button class="button_type_12 bg_light_color_2 tr_delay_hover f_left r_corners color_dark m_left_5 p_hr_0">
                            <i class="fa fa-files-o f_size_big"></i><span
                                class="tooltip tr_all_hover r_corners color_dark f_size_small">Compare</span></button>
                        <button class="button_type_12 bg_light_color_2 tr_delay_hover f_left r_corners color_dark m_left_5 p_hr_0 relative">
                            <i class="fa fa-question-circle f_size_big"></i><span
                                class="tooltip tr_all_hover r_corners color_dark f_size_small">Ask a Question</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<button class="t_align_c r_corners tr_all_hover animate_ftl" id="go_to_top"><i class="fa fa-angle-up"></i></button>
<!--scripts include-->
<script src="<%=path%>/js/jquery-2.1.0.min.js"></script>
<script src="<%=path%>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path%>/js/retina.js"></script>
<script src="<%=path%>/js/camera.min.js"></script>
<script src="<%=path%>/js/jquery.easing.1.3.js"></script>
<script src="<%=path%>/js/waypoints.min.js"></script>
<script src="<%=path%>/js/jquery.isotope.min.js"></script>
<script src="<%=path%>/js/owl.carousel.min.js"></script>
<script src="<%=path%>/js/jquery.tweet.min.js"></script>
<script src="<%=path%>/js/jquery.custom-scrollbar.js"></script>
<script src="<%=path%>/js/scripts.js"></script>
<script>
    $(function () {
        $.ajax({
            url: "/jobFair/index",
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
                        html += '<div class="clearfix"><a href="#" class="d_block photoframe relative shadow wrapper r_corners f_left m_right_20 animate_ftt f_mxs_none m_mxs_bottom_10">  '
                        if ((i + 1) % 3 == 3) html += '<img class="tr_all_long_hover" src="<%=path%>/images/blog_img1_1.jpg" alt="">'
                        if ((i + 1) % 3 == 2) html += '<img class="tr_all_long_hover" src="<%=path%>/images/blog_img1_2.jpg" alt="">'
                        if ((i + 1) % 3 == 1) html += '<img class="tr_all_long_hover" src="<%=path%>/images/blog_img1_3.jpg" alt="">'

                        html += '</a>'
                        html += '<div class="mini_post_content"><h4 class="m_bottom_5 animate_ftr"><a href="#" class="color_dark"><b>' + dataInfo.title + '</b></a></h4>  '
                        html += '<p class="f_size_medium m_bottom_10 animate_ftr">开始时间:' + dataInfo.startTime + '</p>'
                        html += '<p class="f_size_medium m_bottom_10 animate_ftr">结束时间:' + dataInfo.endTime + '</p>'
                        html += '<p class="f_size_medium m_bottom_10 animate_ftr">公司数量:' + dataInfo.companyCount + '</p>'
                        html += '<p class="m_bottom_10 animate_ftr">' + dataInfo.comment + '</p></div> </div>'

                    }
                    $("#zhaopinhui").append(html);
                }

            }
        })
    })

</script>


</body>
</html>