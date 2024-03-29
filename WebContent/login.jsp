<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>用户登录</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
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
	<div class="page login-page">
		<div class="container d-flex align-items-center">
			<div class="form-holder has-shadow">
				<div class="row">
					<!-- Logo & Information Panel-->
					<div class="col-lg-6">
						<div class="info d-flex align-items-center">
							<div class="content">
								<div class="logo">
									<h1>视频监控云监管云平台</h1>
								</div>
								<p>明察秋毫,尽在掌控。安防天下,有备无患。</p>
							</div>
						</div>
					</div>
					<!-- Form Panel    -->
					<div class="col-lg-6 bg-white">
						<div class="form d-flex align-items-center">
							<div class="content">
								<form action="Login" method="post" class="form-validate"
									onSubmit="return check()">
									<div class="form-group">
										<input id="login-username" type="email" name="loginUsername"
											required data-msg="请输入您的注册邮箱" class="input-material">
										<label for="login-username" class="label-material">邮箱
										</label>
									</div>
									<div class="form-group">
										<input id="origin" type="password" name="loginPassword2"
											required data-msg="请输入您的密码" class="input-material"> <label
											for="login-password" class="label-material">密码</label>
									</div>
									<input type="hidden" id="after" name="loginPassword"> <input
										type="submit" value="登录" id="button_login"
										class="btn btn-primary">

								</form>
								<a href="forgetpassword.jsp" class="forgot-pass">忘记密码?</a>
							</div>
						</div>
					</div>
				</div>
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
	<!-- Main File-->
	<script src="js/front.js"></script>
	<script type="text/javascript" src="js/jquery.md5.js"></script>
	<script>
		$(function() {
			$("#origin").blur(function() {
				var before = $(this).val();
				if(before != ""){
					var beforeVal = $.md5(before);
					$("#after").val(beforeVal);
				}
			});
		});
		
		$("#origin").bind('keyup', function(event) {
			if(event.keyCode == "13"){
				var before = $(this).val();
				if(before != ""){
					var beforeVal = $.md5(before);
					$("#after").val(beforeVal);
				}
	　　　			$("#button_login").click();
			}
		});
	</script>
</body>
</html>