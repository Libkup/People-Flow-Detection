<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>删除摄像头</title>
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
					<li><a href="#exampledropdownDropdown" aria-expanded="false"
						data-toggle="collapse"> <i class="icon-interface-windows"></i>个人信息
					</a>
						<ul id="exampledropdownDropdown" class="list-unstyled collapse">
							<li><a href="information.jsp">更改个人信息</a></li>
							<li><a href="changepassword.jsp">更改个人密码</a></li>
						</ul></li>
					<li><a href="#exampledropdownDropdown1" aria-expanded="true"
						data-toggle="collapse"> <i class="icon-interface-windows"></i>摄像头管理
					</a>
						<ul id="exampledropdownDropdown1"
							class="list-unstyled collapse show">
							<li><a href="userAddCamera.jsp">添加摄像头</a></li>
							<li class="active"><a href="userDeleteCamera.jsp">删除摄像头</a></li>
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
						<div class="row">
							<!-- Form Elements -->
							<div class="col-lg-2"></div>
							<div class="col-lg-8">
								<div class="recent-activities card">
									<div class="card-header">
										<h3 class="h4">删除摄像头</h3>
									</div>

									<div class="card-body">
										<div id="items" style="display: none">
											<div class="item">
												<div class="row">
													<div class="col-2 date-holder text-center">
														<br>
														<h5>地点</h5>
													</div>
													<div class="col-8 content text-center">
														<h5>标识</h5>
														<p>地方官梵蒂冈</p>
														<div class="row">
															<div class="col-4 date-holder text-center">
																<p>历史最高人数：</p>
															</div>
															<div class="col-4 date-holder text-center">
																<p>一小时内最高人数：</p>
															</div>
															<div class="col-4 date-holder text-center">
																<p>摄像头阈值：</p>
															</div>
														</div>
													</div>
													<div class="col-2 date-holder text-center">
														<br>
														<button id="useremail1" name="useremail1" type="submit"
															class="btn btn-primary" value=>添加</button>
													</div>
												</div>
											</div>
										</div>
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
		window.onload = getAddedCamera();
		function getAddedCamera() {
			$
					.ajax({
						type : "POST",
						url : "UserAddedCamera",
						error : function() {
							alert('error');
						},
						success : function(data) {
							if (data == "") {
								alert("未查询到结果");
							} else {
								document.getElementById('items').style.display = "";
								var user = data.split("||");
								var content = "";
								for (i = 0; i < user.length - 1; i++) {
									var attributes = user[i].split(",");
									content += '<div class="item">';
									content += '<div class="row">';
									content += '<div class="col-2 date-holder text-center">';
									content += '<br>';
									content += '<h5>标识：' + attributes[0]
											+ '</h5>';
									content += '</div>';
									content += '<div class="col-8 content text-center">';
									content += '<h5><b>地点：</b>' + attributes[1]
											+ '</h5>';
									content += '<p><b>描述：</b>' + attributes[2]
											+ '</p>';
									content += '<div class="row">';
									content += '<div class="col-4 date-holder text-center">';
									content += '<p><b>历史最高人数：</b>'
											+ attributes[3] + '</p>';
									content += '</div>';
									content += '<div class="col-4 date-holder text-center">';
									content += '<p><b>一小时内最高人数：</b>'
											+ attributes[4] + '</p>';
									content += '</div>';
									content += '<div class="col-4 date-holder text-center">';
									content += '<p><b>摄像头阈值：</b>'
											+ attributes[5] + '</p>';
									content += '</div>';
									content += '</div>';
									content += '</div>';
									content += '<div class="col-2 date-holder text-center">';
									content += '<br>';
									content += '<button id="'
											+ attributes[0]
											+ '" type="button" class="btn btn-primary" onclick="deleteCamera(this)">删除</button>';
									content += '</div>';
									content += '</div>';
									content += '</div>';

								}

								//document.getElementById('userItem').innerHTML="";
								$("#items").html(content);
							}
						}
					})
		}

		function deleteCamera(obj) {
			var cameraName = obj.id;
			console.log(cameraName);
			$.ajax({
				type : 'POST', // 请求类型, 默认为 GET
				url : "UserDeleteCamera", // 	必需。规定把请求发送到哪个 URL。
				data : {
					cameraName : cameraName
				},
				success : function(result) { // 可选。请求成功时执行的回调函数。
					alert("删除成功")
					location.reload();
				}
			});
		}
	</script>
</body>
</html>