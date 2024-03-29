<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>主页</title>
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
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
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
								class="navbar-brand d-none d-sm-inline-block">
									<strong>视频监控云监管平台</strong>
							</a>
							<!-- Toggle Button-->
							<a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
						</div>
						<!-- Navbar Menu -->
						<ul
							class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
							<!-- Logout    -->
							<li class="nav-item"><a href="AdminLogout"
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
					<li class="active"><a href="AdminIndex"> <i
							class="icon-home"></i>个人信息
					</a></li>
					<li><a href="#exampledropdownDropdown" aria-expanded="false"
						data-toggle="collapse"> <i class="icon-interface-windows"></i>用户管理
					</a>
						<ul id="exampledropdownDropdown" class="list-unstyled collapse">
							<li><a href="adduser.jsp">添加用户</a></li>
							<li><a href="deleteuser.jsp">删除用户</a></li>
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
				<!-- <span class="heading">Extras</span> -->
				<!-- <ul class="list-unstyled">

            <li> <a href="#"> <i class="icon-flask"></i>Demo </a></li>
            <li> <a href="#"> <i class="icon-screen"></i>Demo </a></li>
            <li> <a href="#"> <i class="icon-mail"></i>Demo </a></li>
            <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
          </ul> -->
			</nav>
			<div class="content-inner">
				<!-- Page Header-->
				<header class="page-header">
					<div class="container-fluid">
						<h2 class="no-margin-bottom">个人信息</h2>
					</div>
				</header>

				<!-- Dashboard Counts Section-->
				<section class="dashboard-counts no-padding-bottom">
					<div class="container-fluid">
						<div class="row bg-white has-shadow">
							<!-- Item -->
							<div class="col-xl-3 col-sm-6">
								<div class="item d-flex align-items-center">
									<div class="icon bg-violet">
										<i class="icon-user"></i>
									</div>
									<div class="title">
										<span>当前 <br>在线
										</span>
										<div class="progress">
											<div role="progressbar" style="width: 25%; height: 4px;"
												aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"
												class="progress-bar bg-violet"></div>
										</div>
									</div>
									<div class="number">
										<strong>${sessionScope.online_user}</strong>
									</div>
								</div>
							</div>
							<!-- Item -->
							<div class="col-xl-3 col-sm-6">
								<div class="item d-flex align-items-center">
									<div class="icon bg-green">
										<i class="icon-bill"></i>
									</div>
									<div class="title">
										<span>用户 <br>总人数
										</span>
										<div class="progress">
											<div role="progressbar" style="width: 40%; height: 4px;"
												aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
												class="progress-bar bg-green"></div>
										</div>
									</div>
									<div class="number">
										<strong>${sessionScope.user_count}</strong>
									</div>
								</div>
							</div>
							<!-- Item -->
							<div class="col-xl-3 col-sm-6">
								<div class="item d-flex align-items-center">
									<div class="icon bg-red">
										<i class="icon-padnote"></i>
									</div>
									<div class="title">
										<span>摄像头 <br>总数
										</span>
										<div class="progress">
											<div role="progressbar" style="width: 70%; height: 4px;"
												aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"
												class="progress-bar bg-red"></div>
										</div>
									</div>
									<div class="number">
										<strong>${sessionScope.camera_count}</strong>
									</div>
								</div>
							</div>
							<!-- Item -->
							<div class="col-xl-3 col-sm-6">
								<div class="item d-flex align-items-center">
									<div class="icon bg-orange">
										<i class="icon-check"></i>
									</div>
									<div class="title">
										<span>监控 <br>最高人数
										</span>
										<div class="progress">
											<div role="progressbar" style="width: 50%; height: 4px;"
												aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
												class="progress-bar bg-orange"></div>
										</div>
									</div>
									<div class="number">
										<strong>${sessionScope.highest_history}</strong>
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
							<div class="col-sm-6 text-right">
								<p></p>
								<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
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
</body>
</html>