<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>求职招聘系统</title>
    <link href="pages/css/base.css" rel="stylesheet">
    <link href="pages/css/login/login.css" rel="stylesheet">
	<script type="text/javascript" src="pages/js/jquery.min.js"></script>
	<script type="text/javascript">
    	var a=0;
    	function login() {
            $("#wu-form-2").attr("action","../operator/login");
            $("#zhanghao").attr("name","account");
            $("#mima").attr("name","pass");
			$("#wu-form-2").submit();
		}
    </script>
</head> 
<body class="white">
	<div class="login-hd">
		<div class="left-bg"></div>
		<div class="right-bg"></div>
		<div class="hd-inner">
			<span class="logo"></span>
			<span class="split"></span>
			<span class="sys-name">求职招聘系统管理</span>
		</div>
	</div>
	<div class="login-bd">
		<div class="bd-inner">
			<div class="inner-wrap">
				<div class="lg-zone">
					<div class="lg-box">
						<div class="lg-label"><h4>用户登录</h4></div>
						<form id="wu-form-2" action="../operator/login" method="post">
							<div class="lg-username input-item clearfix">
								<i class="iconfont">&#xe60d;</i>
								<input id="zhanghao" name="account" type="text" placeholder="账号/手机号">
							</div>
							<div class="lg-password input-item clearfix">
								<i class="iconfont">&#xe634;</i>
								<input id="mima" name="pass" type="password" placeholder="请输入密码">
							</div>
							<div class="lg-check clearfix">
								<div class="input-item">
									<i class="iconfont">&#xe633;</i>
									<input name="code" type="text" placeholder="验证码">
								</div>
								<img src="../img1/code.jpg" onclick="this.src='../img1/code.jpg?a='+(a++)" >
							</div>
							<div class="enter">
								<a href="javascript:;" class="purchaser" onclick="login()">管理员登录</a>
							</div>
						</form>
						<div class="line line-y"></div>
						<div class="line line-g"></div>
					</div>
				</div>
				<div class="lg-poster"></div>
			</div>
		</div>
	</div>
	<div class="login-ft">
		<div class="ft-inner">
			<div class="about-us">
				<a href="javascript:;">关于我们</a>
				<a href="javascript:;">法律声明</a>
				<a href="javascript:;">服务条款</a>
				<a href="javascript:;">联系方式</a>
			</div>
			<div class="address">地址：</div>
			<div class="other-info">建议使用IE8及以上版本浏览器</div>
		</div>
	</div>
</body> 
</html>
    
<script type="text/javascript">

</script>
