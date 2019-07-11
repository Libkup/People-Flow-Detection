<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>查找用户</title>
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
							<a href="adminindex.jsp"
								class="navbar-brand d-none d-sm-inline-block"> <strong>人流量监控平台</strong>
							</a>
							<!-- Toggle Button-->
							<a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
						</div>
						<!-- Navbar Menu -->
						<ul
							class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
							<!-- Logout    -->
							<li class="nav-item"><a href="LogoutServlet"
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
					<li><a href="adminindex.jsp"> <i class="icon-home"></i>主页
					</a></li>
					<li><a href="#exampledropdownDropdown" aria-expanded="true"
						data-toggle="collapse"> <i class="icon-interface-windows"></i>用户管理
					</a>
						<ul id="exampledropdownDropdown"
							class="list-unstyled collapse show">
							<li><a href="adduser.jsp">添加用户</a></li>
							<li><a href="deleteuser.jsp">删除用户</a></li>
							<li><a href="changeuser.jsp">更改用户信息 </a></li>
							<li class="active"><a href="finduser.jsp">查找用户</a></li>
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
						<h2 class="no-margin-bottom">个人信息</h2>
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
										<h3 class="h4">查找用户</h3>
									</div>
									<div class="card-body">
										<div class="form-group row">
											<div class="col-sm-1"></div>
											<div class="col-sm-10">
												<div class="input-group">
													<div>
														<select id="option" name="option" class="form-control">
															<option>用户名</option>
															<option>邮箱</option>
															<option>性别</option>
															<option>电话号码</option>
															<option>职位</option>
														</select>
													</div>
													<input id="input_type" name="input_type" type="text"
														class="form-control">
													<div class="input-group-append">
														<button type="button" class="btn btn-primary"
															onclick="getUsers()">查询</button>
													</div>
												</div>
											</div>
											<div class="col-sm-1"></div>
										</div>
										<div class="line"></div>
										<form id="userFrom" class="form-horizontal"
											style="display: none;">

											<div class="form-group row">
												<div class="col-sm-2"></div>
												<div class="col-sm-8">
													<div class="daily-feeds">
														<div id="userItem" class="card-body no-padding">
															<!-- Item-->
															<div class="item clearfix">
																<div class="feed d-flex justify-content-between">
																	<div class="feed-body d-flex justify-content-between">
																		<a href="#" class="feed-profile"> <img
																			src="img/avatar-3.jpg" alt="person"
																			class="img-fluid rounded-circle">
																		</a>
																		<div class="content">
																			<h5>用户名</h5>
																			<span>邮箱</span>
																			<div class="full-date">
																				<small>电话号码</small>
																			</div>
																		</div>
																	</div>
																	<div class="date text-right">
																		<small>职位</small>
																	</div>
																</div>
																<div class="quote has-shadow">
																	<small>个人简介</small>
																</div>
															</div>

														</div>
													</div>
												</div>
												<div class="col-sm-2"></div>
											</div>
											<div class="line"></div>

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
		function getUsers() {
			var option = document.getElementById("option").value;
			var input = document.getElementById("input_type").value;
			
					$.ajax({
						type : "POST",
						url : "FindUser",
						data : {
							option : option,
							input : input
						},
						error : function() {
							alert('error');
						},
						success : function(data) {
							if (data == "") {
								alert("未查询到结果");
								document.getElementById('userFrom').style.display = "none";
								document.getElementById("input_type").value = "";
								document.getElementById("input_type").select();
								
							} else {
								document.getElementById('userFrom').style.display = "";
								var user = data.split("||");
								var content = "";
								for (i = 0; i < user.length - 1; i++) {
									var attributes = user[i].split(",");
									content += '<div class="item clearfix">';
									content += '<div class="feed d-flex justify-content-between">';
									content += '<div class="feed-body d-flex justify-content-between">';
									content += '<a href="#" class="feed-profile">';
									content += '<img src="img/avatar-3.jpg" alt="person" class="img-fluid rounded-circle">';
									content += '</a>';
									content += '<div class="content text-left">';
									content += '<h5>' + attributes[0] + '</h5>';
									content += '<span>' + attributes[1]
											+ '</span>';
									content += '<div class="full-date">';
									content += '<small>' + attributes[2]
											+ '</small>';
									content += '</div>';
									content += '</div>';
									content += '</div>';
									content += '<div class="date text-right">';
									content += '<small>' + attributes[3]
											+ '</small>';
									content += '</div>';
									content += '</div>';
									content += '<div class="quote has-shadow">';
									content += '<small>' + attributes[4]
											+ '</small>';
									content += '</div>';
									content += '</div>';
								}

								//document.getElementById('userItem').innerHTML="";
								$("#userItem").html(content);
								console.log(data);
								document.getElementById("input_type").value = "";
							}

						}
					})
		}
	</script>
</body>
</html>