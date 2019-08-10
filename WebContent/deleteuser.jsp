<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>删除用户</title>
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
				<!-- Search Box-->
				<div class="search-box">
					<button class="dismiss">
						<i class="icon-close"></i>
					</button>
					<form id="searchForm" action="#" role="search">
						<input type="search" placeholder="What are you looking for..."
							class="form-control">
					</form>
				</div>
				<div class="container-fluid">
					<div
						class="navbar-holder d-flex align-items-center justify-content-between">
						<!-- Navbar Header-->
						<div class="navbar-header">
							<!-- Navbar Brand -->
							<a href="AdminIndex"
								class="navbar-brand d-none d-sm-inline-block"> <strong>视频监控云监管平台</strong></a>
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
						<h1 class="h4">${sessionScope.admin.name}</h1>
						<p>email: ${sessionScope.admin.email}</p>
					</div>
				</div>
				<!-- Sidebar Navidation Menus-->
				<span class="heading">information</span>
				<ul class="list-unstyled">
					<li><a href="AdminIndex"> <i class="icon-home"></i>主页
					</a></li>
					<li><a href="#exampledropdownDropdown" aria-expanded="true"
						data-toggle="collapse"> <i class="icon-interface-windows"></i>用户管理
					</a>
						<ul id="exampledropdownDropdown"
							class="list-unstyled collapse show">
							<li><a href="adduser.jsp">添加用户</a></li>
							<li class="active"><a href="deleteuser.jsp">删除用户</a></li>
							<li><a href="changeuser.jsp">更改用户信息 </a></li>
							<li><a href="finduser.jsp">查找用户</a></li>
						</ul></li>
					<li><a href="#exampledropdownDropdown1" aria-expanded="false"
						data-toggle="collapse"> <i class="icon-list-1"></i>摄像头管理
					</a>
						<ul id="exampledropdownDropdown1" class="list-unstyled collapse">
							<li><a href="addcamera.jsp">添加摄像头</a></li>
							<li><a href="deletecamera.jsp">删除摄像头</a></li>
							<li><a href="changecamera.jsp">更改摄像头信息 </a></li>
							<li><a href="findcamera.jsp">查看摄像头信息</a></li>
						</ul></li>
					<li><a href="HistoricalVideo"> <i class="icon-home"></i>历史视频 </a></li>
				</ul>

			</nav>
			<div class="content-inner">
				<!-- Page Header-->
				<header class="page-header">
					<div class="container-fluid">
						<h2 class="no-margin-bottom">用户管理</h2>
					</div>
				</header>

				<section class="forms">
					<div class="container-fluid">
						<div class="row" style="text-align: center;">
							<!-- Form Elements -->
							<div class="col-lg-2"></div>
							<div class="col-lg-8">
								<div class="card">

									<div class="card-header d-flex align-items-center">
										<h3 class="h4">删除用户</h3>
									</div>
									<div class="card-body">
										<div class="form-group row">
											<label class="col-sm-4 form-control-label">邮箱</label>
											<div class="col-sm-7">
												<div class="form-group">
													<div class="input-group">
														<input id="Email" type="email" class="form-control">
														<div class="input-group-append">
															<button type="button" class="btn btn-primary"
																onclick="settingUserInformation()">查询</button>
														</div>
													</div>
												</div>
											</div>
										</div>
										<form action="DeleteUser" method="post" class="form-validate">
											<div id="lin1" style="display: none;" class="line"></div>
											<div id="information" style="display: none;"
												class="card-body text-center">
												<div class="client-avatar">
													<img src="img/avatar-2.jpg" alt="..."
														class="img-fluid rounded-circle">
													<div class="status bg-green"></div>
												</div>
												<div class="line"></div>
												<div class="form-group row">
													<div class="col-sm-4"></div>

													<div class="col-sm-4">
														<div class="card-body no-padding">
															<!-- Item-->
															<div class="item d-flex justify-content-between">
																<div class="info d-flex">
																	<div class="title">
																		<h5>用户名</h5>
																	</div>
																</div>
																<div class="text-right">
																	<strong id="username">sdfsdf</strong>
																</div>
															</div>
															<div class="line"></div>
															<!-- Item-->
															<div class="item d-flex justify-content-between">
																<div class="info d-flex">
																	<div class="title">
																		<h5>邮箱</h5>
																	</div>
																</div>
																<div class="text-right">
																	<strong id="useremail">sdfsdf</strong>
																</div>
															</div>
															<div class="line"></div>
															<!-- Item-->
															<div class="item d-flex justify-content-between">
																<div class="info d-flex">
																	<div class="title">
																		<h5>性别</h5>
																	</div>
																</div>
																<div class="text-right">
																	<strong id="gender">sdfsdf</strong>
																</div>
															</div>
															<div class="line"></div>
															<!-- Item-->
															<div class="item d-flex justify-content-between">
																<div class="info d-flex">
																	<div class="title">
																		<h5>电话号码</h5>
																	</div>
																</div>
																<div class="text-right">
																	<strong id="phonenumber">sdfsdf</strong>
																</div>
															</div>
															<div class="line"></div>
															<!-- Item-->
															<div class="item d-flex justify-content-between">
																<div class="info d-flex">
																	<div class="title">
																		<h5>职位</h5>
																	</div>
																</div>
																<div class="text-right">
																	<strong id="position">sdfsdf</strong>
																</div>
															</div>
															<div class="line"></div>
															<!-- Item-->
															<div class="item d-flex justify-content-between">
																<div class="info d-flex">
																	<div class="title">
																		<h5>个人简介</h5>
																	</div>
																</div>
																<div class="text-right">
																	<strong id="introduction">sdfsdf</strong>
																</div>
															</div>
														</div>
													</div>

													<div class="col-sm-4"></div>
												</div>
											</div>
											<div id="lin2" style="display: none;" class="line"></div>
											<div id="deleteuser" style="display: none;"
												class="form-group row">
												<div class="col-sm-6 ">
													<button id="useremail1" name="useremail1" type="submit"
														class="btn btn-primary" value=>确认删除</button>
												</div>
											</div>
										</form>

									</div>
								</div>
							</div>

							<div class="col-lg-2"></div>
						</div>
					</div>
				</section>

				<!-- Page Footer-->


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
		function settingUserInformation() {
			var value = document.getElementById("Email").value;
			console.log("1111" + value);
			if (value == "") {
				alert('查询条件不能为空');
				document.getElementById("Email").select();
				$(this).css({
					'outline' : 'none',
					'border-color' : 'rgba(255, 0, 0, 0.8)'
				});
			} else {
				$
						.ajax({
							type : 'POST',
							url : "SearchUser",
							data : {
								Email : value
							},
							success : function(result) {
								if (result == "") {
									alert("未查询到结果");
									document.getElementById("useremail1").value = "";
									document.getElementById("Email").value = "";
									document.getElementById("lin1").style.display = "none";//显
									document.getElementById("information").style.display = "none";//显
									document.getElementById("lin2").style.display = "none";//显
									document.getElementById("deleteuser").style.display = "none";//显
								} else {
									var resultArr = result.split(",");
									$("#username").html(resultArr[0]);
									$("#useremail").html(resultArr[1]);
									$("#gender").html(resultArr[2]);
									$("#phonenumber").html(resultArr[3]);
									$("#position").html(resultArr[4]);
									$("#introduction").html(resultArr[5]);
									document.getElementById("useremail1").value = resultArr[1];
									document.getElementById("Email").value = "";
									document.getElementById("lin1").style.display = "";//显
									document.getElementById("information").style.display = "";//显
									document.getElementById("lin2").style.display = "";//显
									document.getElementById("deleteuser").style.display = "";//显
								}
							}
						});
			}
		};

		$("#Email").blur(function() {
			var temp = $(this).val();
			var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
			if (temp != "") {
				if (!reg.test(temp)) {
					alert('请输入正确格式的邮箱');
					$("#Email").val("");
					document.getElementById("Email").select();
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
	</script>
</body>
</html>