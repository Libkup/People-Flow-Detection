<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>更改个人信息</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="vendor/font-awesome/css/font-awesome.min.css">
<!-- Fontastic Custom icon font-->
<link rel="stylesheet" href="css/fontastic.css">
<!-- Google fonts - Poppins -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="img/favicon.ico">

</head>
<body>
	<div class="page">
		<!-- Main Navbar-->
		<header class="header">
			<nav class="navbar">
				<div class="container-fluid">
					<div
						class="navbar-holder d-flex align-items-center justify-content-between">
						<!-- Navbar Header-->
						<div class="navbar-header">
							<!-- Navbar Brand -->
							<a href="UserIndex" class="navbar-brand d-none d-sm-inline-block">
								<strong>视频监控云监管平台</strong>
							</a>
							<!-- Toggle Button-->
							<a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
						</div>
						<!-- Navbar Menu -->
						<ul
							class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
							<!-- Logout    -->
							<li class="nav-item"><a href="Logout"
								class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i
									class="fa fa-sign-out"></i></a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>

		<div class="page-content d-flex align-items-stretch">
			<!-- Side Navbar -->
			<nav class="side-navbar">
				<!-- Sidebar Header-->
				<div class="sidebar-header d-flex align-items-center">
					<div class="avatar">
						<img src="img/avatar-1.jpg" alt="..."
							class="img-fluid rounded-circle">
					</div>
					<div class="title">
						<h1 class="h4">${sessionScope.loginUsername}</h1>
						<p>email: ${sessionScope.email}</p>
					</div>
				</div>
				<!-- Sidebar Navidation Menus-->
				<span class="heading">information</span>
				<ul class="list-unstyled">
					<li><a href="UserIndex"> <i class="icon-home"></i>主页
					</a></li>
					<li><a href="#exampledropdownDropdown" aria-expanded="true"
						data-toggle="collapse"> <i class="icon-interface-windows"></i>个人信息
					</a>
						<ul id="exampledropdownDropdown"
							class="list-unstyled collapse show">
							<li class="active"><a href="information.jsp">更改个人信息</a></li>
							<li><a href="changepassword.jsp">更改个人密码</a></li>
						</ul></li>
					<li><a href="#exampledropdownDropdown1" aria-expanded="false"
						data-toggle="collapse"> <i class="icon-interface-windows"></i>摄像头管理
					</a>
						<ul id="exampledropdownDropdown1" class="list-unstyled collapse">
							<li><a href="userAddCamera.jsp">添加摄像头</a></li>
							<li><a href="userDeleteCamera.jsp">删除摄像头</a></li>
						</ul></li>
				</ul>
			</nav>
			<div class="content-inner">
				<!-- Page Header-->
				<header class="page-header">
					<div class="container-fluid">
						<h2 class="no-margin-bottom">个人信息</h2>
					</div>
				</header>


				<!-- Forms Section-->
				<section class="forms">
					<div class="container-fluid">
						<div class="row" style="text-align: center;">
							<!-- Form Elements -->
							<div class="col-lg-2"></div>
							<div class="col-lg-8">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">更新你的个人信息</h3>
									</div>
									<div class="card-body">
										<form action="ChangeInfo" method="post" name="myform"
											class="form-horizontal" onSubmit="return check()">
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">用户名</label>
												<div class="col-sm-7">
													<input id="username" type="text" name="username"
														placeholder="长度小于10位" value="${sessionScope.User.name}"
														required="required" class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">邮箱</label>
												<div class="col-sm-7">
													<input id="email" type="email" name="useremail"
														placeholder="请输入邮箱地址" value="${sessionScope.User.email}"
														required="required" class="form-control">
												</div>
											</div>

											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">性别</label>
												<div class="col-sm-7">
													<select id="gender" name="gender" class="form-control mb-3">
														<option>${sessionScope.User.gender}</option>
														<option>男</option>
														<option>女</option>
													</select>
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">电话号码</label>
												<div class="col-sm-7">
													<input type="text" name="phonenumber" id="phonenumber"
														value="${sessionScope.User.phoneNumber}"
														required="required" class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">职位</label>
												<div class="col-sm-7">
													<select name="position" class="form-control mb-3">
														<option>${sessionScope.User.position}</option>
														<option>职位1</option>
														<option>职位2</option>
														<option>职位3</option>
													</select>
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">个人简介</label>
												<div class="col-sm-7">
													<textarea
														 id="introduction" name="introduction"
														placeholder="请输入个人简介(不超过100字)" rows="3"
														class="form-control" required> ${sessionScope.User.selfIntroduction}</textarea>
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<div class="col-sm-6 ">
													<!-- <button type="submit" class="btn btn-secondary">Cancel</button> -->
													<button type="submit" class="btn btn-primary">保存更改</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Page Footer-->
				<footer class="main-footer">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-6">
								<p>Copyright &copy; 2019.NWPU All rights reserved.</p>
							</div>
						</div>
					</div>
				</footer>
			</div>
		</div>
	</div>
	<!-- JavaScript files-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="js/charts-home.js"></script>
	<!-- Main File-->
	<script src="js/front.js"></script>
	<script>
		$(function() {
			$("#username").blur(function() {
				var temp = $(this).val();
				var reg = /^[0-9a-zA-Z\u4e00-\u9fa5_]{1,10}$/;
				if (temp != "") {
					if (!reg.test(temp)) {
						alert('请输入正确格式的用户名');
						$("#username").val("");
						document.getElementById("username").select();
						$(this).css({
							'outline' : 'none',
							'border-color' : 'rgba(255, 0, 0, 0.8)'
						});
					} else {
						$(this).css({
							'outline' : 'none',
							'border-color' : '#ccc'
						});
					}
				}
			});

			$("#email").blur(function() {
				var temp = $(this).val();
				var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
				if (temp != "") {
					if (!reg.test(temp)) {
						alert('请输入正确格式的邮箱');
						$("#email").val("");
						document.getElementById("email").select();
						$(this).css({
							'outline' : 'none',
							'border-color' : 'rgba(255, 0, 0, 0.8)'
						});
					} else {
						$(this).css({
							'outline' : 'none',
							'border-color' : '#ccc'
						});
					}
				}
			});

			$("#phonenumber").blur(function() {
				var temp = $(this).val();
				var reg = /^1([38]\d|5[0-35-9]|7[3678])\d{8}$/;
				if (temp != "") {
					if (!reg.test(temp)) {
						alert('请输入正确格式的手机号码');
						$("#phonenumber").val("");
						document.getElementById("phonenumber").select();
						$(this).css({
							'outline' : 'none',
							'border-color' : 'rgba(255, 0, 0, 0.8)'
						});
					} else {
						$(this).css({
							'outline' : 'none',
							'border-color' : '#ccc'
						});
					}
				}
			});

			$("#introduction").blur(function() {
				var temp = $(this).val();
				var length =$(this).val().length;
				if(parseInt(length)>100){
					alert('请输入正确格式的简介');
					$("#introduction").val("");
					document.getElementById("introduction").focus();
					$(this).css({
						'outline' : 'none',
						'border-color' : 'rgba(255, 0, 0, 0.8)'
					});
				}else {
					$(this).css({
						'outline' : 'none',
						'border-color' : '#ccc'
					});
				}
			});
		});
		
		function check() {

			if (document.getElementById("introduction").value.length>100) {
				alert('请输入正确格式的简介！');
				return false;
			} 
			return true;
		};

	</script>
</body>
</html>