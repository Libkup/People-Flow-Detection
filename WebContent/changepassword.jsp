<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>更改个人密码</title>
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
						data-toggle="collapse"> <i class="icon-interface-windows"></i>个人信息</a>
						<ul id="exampledropdownDropdown"
							class="list-unstyled collapse show">
							<li><a href="information.jsp">更改个人信息</a></li>
							<li class="active"><a href="changepassword.jsp">更改个人密码</a></li>
						</ul>
					</li>
					<li><a href="#exampledropdownDropdown1" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>摄像头管理</a>
                      <ul id="exampledropdownDropdown1" class="list-unstyled collapse">
                        <li><a href="userAddCamera.jsp">添加摄像头</a></li>
                        <li><a href="userDeleteCamera.jsp">删除摄像头</a></li>
                      </ul>
                    </li>
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
										<h3 class="h4">更改你的密码</h3>
									</div>
									<div class="card-body">
										<div class="form-group row">
											<label class="col-sm-4 form-control-label">邮箱</label>
											<div class="col-sm-7">

												<div class="form-group">
													<form action="SendVerificationCode" method="post"
														class="form-validate">
														<div class="input-group">
															<input id="emailaddress" type="email" name="emailAddress"
																required data-msg="请输入正确的邮箱"
																placeholder="${sessionScope.emailAddress}"
																class="form-control" value="${sessionScope.emailAddress}">
															<div class="input-group-append">
																<button id="button" type="submit"
																	class="btn btn-primary">发送验证码</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
										<form action="ChangePassword" method="post"
											class="form-horizontal" onSubmit="return check()">
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">验证码</label>
												<div class="col-sm-7">
													<input type="text" id="verificationCode"
														name="verificationcode" placeholder="请输入验证码"
														required="required"
														class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">密码</label>
												<div class="col-sm-7">
													<input id="password" type="password" placeholder="请输入密码"
													required="required"
														name="password" class="form-control">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label"></label>
												<div class="col-sm-7">
													<input id="passwordConfirm" type="password"
														placeholder="请再次输入密码" name="passwordConfirm"
														required="required"
														class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<div class="col-sm-6 ">
													<button id="button_save" type="submit"
														class="btn btn-primary">保存更改</button>
												</div>
												<div class="col-sm-6 ">
													<button type="button" class="btn btn-secondary" onclick="location.href='UserIndex'">取消</button>
												</div>
											</div>
											<input type="hidden" id="after1" name="password">
											<input type="hidden" id="after2" name="passwordConfirm">
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
	<script src="vendor/popper.js/umd/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
	<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="js/charts-home.js"></script>
	<script src="js/front.js"></script>
	<script src="js/check-password.js"></script>
	<script type="text/javascript" src="js/jquery.md5.js"></script>
	<script>
	$(function() {
		$("#password").blur(function() {
			var before = $(this).val();
			var reg = /^[0-9a-zA-Z]{6,16}$/;
			if(before != ""){
				if(!reg.test(before)){					
					alert('请输入正确格式的密码');
					$("#password").val("");
					document.getElementById("password").focus();
			        $(this).css({
			            'outline': 'none',
			            'border-color': 'rgba(255, 0, 0, 0.8)'
			        });
				}
				var beforeVal = $.md5(before);
				$("#after1").val(beforeVal);
		        $(this).css({
		            'outline': 'none',
		            'border-color': '#ccc'
		        });
			}
		});
		$("#passwordConfirm").blur(function() {
			var before = $(this).val();
			var reg = /^[0-9a-zA-Z]{6,16}$/;
			if(before != ""){
				if(!reg.test(before)){					
					alert('请输入正确格式的密码');
					$("#passwordConfirm").val("");
					document.getElementById("passwordConfirm").focus();
				}
				var beforeVal = $.md5(before);
				$("#after2").val(beforeVal);
			}
		});
	});
	</script>
</body>
</html>