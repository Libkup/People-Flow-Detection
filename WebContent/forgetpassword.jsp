<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>忘记密码</title>
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
							<a class="navbar-brand d-none d-sm-inline-block"> <strong>视频监控云监管平台</strong>
							</a>
						</div>
					</div>
				</div>
			</nav>
		</header>

		<div class="page-content d-flex align-items-stretch">
			<div class="content-inner">
				<!-- Forms Section-->
				<section class="forms">
					<div class="container-fluid">
						<div class="row" style="text-align: center;">
							<!-- Form Elements -->
							<div class="col-lg-3"></div>
							<div class="col-lg-8">
								<div class="card">
									<div class="card-header d-flex align-items-center">
										<h3 class="h4">忘记密码</h3>
									</div>
									<div class="card-body">
										<div class="form-group row">
											<label class="col-sm-4 form-control-label">邮箱</label>
											<div class="col-sm-7">

												<div class="form-group">
													<form action="ForgetPassword" method="post"
														class="form-validate">
														<div class="input-group">
															<input id="emailaddress" type="email" required
																data-msg="请输入正确的邮箱" name="emailAddress"
																value="${sessionScope.emailAddress}"
																class="form-control">
															<div class="input-group-append">
																<button type="submit" id="button"
																	class="btn btn-primary" onclick="send()">发送验证码</button>
															</div>
														</div>
													</form>
												</div>
												<!--  
												<small class="help-block-none">邮箱地址不正确，请输入正确的邮箱地址</small>-->
											</div>
										</div>
										<form action="ChangePasswordForget" method="post"
											class="form-horizontal" onSubmit="return check()">
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">验证码</label>
												<div class="col-sm-7">
													<input type="text" id="verificationCode"
														name="verificationcode" placeholder="请输入验证码"
														class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label">密码</label>
												<div class="col-sm-7">
													<input id="password" type="password" placeholder="请输入密码（6-16位，同时包含字母数字）"
														name="password2" class="form-control" required="required">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 form-control-label"></label>
												<div class="col-sm-7">
													<input id="passwordConfirm" type="password"
														placeholder="请再次输入密码（6-16位，同时包含字母数字）" name="passwordConfirm2" required="required"
														class="form-control">
												</div>
											</div>
											<div class="line"></div>
											<div class="form-group row">
												<div class="col-sm-6 ">
													<!-- <button type="submit" class="btn btn-secondary">Cancel</button> -->
													<button id="button_save" type="submit"
														class="btn btn-primary">保存更改</button>
												</div>
												<div class="col-sm-6 ">
													<button type="button" class="btn btn-secondary"
														onclick="window.location.href='login.jsp'">取消</button>
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
			</div>
		</div>

		<!-- Page Footer-->
		<footer class="main-footer">
			<nav>
				<div class="container-fluid">
					<div class="container-fluid ">
						<!-- Navbar Header-->
						<div class="row">
							<!-- Navbar Brand -->
							<div class="col-sm-6">
								<p>Copyright &copy; 2019.NWPU All rights reserved.</p>
							</div>
						</div>
					</div>
				</div>
			</nav>
		</footer>
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
	<script src="js/check-password.js"></script>
	<script type="text/javascript" src="js/jquery.md5.js"></script>
	<script>
	function send(){
		alert('发送成功！')
	}
	$(function() {
		$("#password").blur(function() {
			var before = $(this).val();
			var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
			if(before != ""){
				if(!reg.test(before)){		
					alert('请输入正确格式的密码');
					$("#password").val("");
					document.getElementById("password").select();
			        $(this).css({
			            'outline': 'none',
			            'border-color': 'rgba(255, 0, 0, 0.8)'
			        });
				}
				else{
					var beforeVal = $.md5(before);
					$("#after1").val(beforeVal);
			        $(this).css({
			            'outline': 'none',
			            'border-color': '#ccc'
			        });
				}
			}
		});
		$("#passwordConfirm").blur(function() {
			var before2 = $(this).val();
			var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
			if(before2 != ""){
				if(!reg.test(before2)){
					alert('请输入正确格式的密码');
					$("#passwordConfirm").val("");
					document.getElementById("passwordConfirm").select();
			        $(this).css({
			            'outline': 'none',
			            'border-color': 'rgba(255, 0, 0, 0.8)'
			        });
				}
				else if(reg.test(before2)){
					var beforeVal2 = $.md5(before2);
					$("#after2").val(beforeVal2);
			        $(this).css({
			            'outline': 'none',
			            'border-color': '#ccc'
			        });
				}
			}
		});
	});
	</script>
</body>
</html>