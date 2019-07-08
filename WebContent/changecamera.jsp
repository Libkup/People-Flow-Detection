<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>更改摄像头信息</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
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
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
              <input type="search" placeholder="What are you looking for..." class="form-control">
            </form>
          </div>
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <!-- Navbar Header-->
              <div class="navbar-header">
                <!-- Navbar Brand --><a href="adminindex.jsp" class="navbar-brand d-none d-sm-inline-block">
                  <strong>人流量监控平台</strong>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Logout    -->
                <li class="nav-item"><a href="Logout" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
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
              <img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle">
            </div>
            <div class="title">
              <h1 class="h4">${sessionScope.admin.name}</h1>
              <p>email: ${sessionScope.admin.email}</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">information</span>
          <ul class="list-unstyled">
                    <li><a href="adminindex.jsp"> <i class="icon-home"></i>主页 </a></li>
                    <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>用户管理</a>
                        <ul id="exampledropdownDropdown" class="list-unstyled collapse">
                          <li><a href="adduser.jsp">添加用户</a></li>
                          <li><a href="deleteuser.jsp">删除用户</a></li>
                          <li><a href="changeuser.jsp">更改用户信息 </a></li>
                          <li><a href="finduser.jsp">查找用户</a></li>
                        </ul>
                    </li>
                    <li><a href="#exampledropdownDropdown1" aria-expanded="true" data-toggle="collapse"> <i class="icon-list-1"></i>摄像头管理</a>
                        <ul id="exampledropdownDropdown1" class="list-unstyled collapse show">
                            <li><a href="addcamera.jsp">添加摄像头</a></li>
                            <li><a href="deletecamera.jsp">删除摄像头</a></li>
                            <li  class="active"><a href="changecamera.jsp">更改摄像头信息 </a></li>
                            <li><a href="findcamera.jsp">查看摄像头信息</a></li>
                        </ul>
                    </li>
          </ul>
        </nav>
        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">摄像头管理</h2>
            </div>
          </header>

          <section class="forms" > 
                <div class="container-fluid">
                  <div class="row" style="text-align: center;">
                    <!-- Form Elements -->
                    <div class="col-lg-2">

                    </div>
                    <div class="col-lg-8">
                      <div class="card">
                        <div class="card-header d-flex align-items-center">
                          <h3 class="h4">更改摄像头信息</h3>
                        </div>
                        <div class="card-body">
                          <form action="ChangeCamera" method="post" class="form-horizontal">
                          	<div class="form-group row">
												<label class="col-sm-4 form-control-label">标识</label>
												<div class="col-sm-7">
													<div class="form-group">
														<div class="input-group">

															<input id="name" name="name" type="text" class="form-control">
															<div class="input-group-append">
																<button type="button" class="btn btn-primary"  onclick="SearchCameraInfo()" >查询</button>
															</div>
														</div>
													</div>
												</div>
											</div>
							<div id="lin1" style="display: none;" class="line"></div>
                            <div id="text1" style="display: none;" class="form-group row">
                              <label class="col-sm-4 form-control-label">标识</label>
                              <div class="col-sm-7">
                                <input id="cameraname" name="cameraname" type="text" class="form-control">
                              </div>
                            </div>
                            <div id="lin2" style="display: none;" class="line"></div>
                            <div id="text2" style="display: none;" class="form-group row">
                                <label class="col-sm-4 form-control-label">地址</label>
                                <div class="col-sm-7">
                                    <input id="location" name="location" type="text" class="form-control">
                                </div>
                            </div>
                            <div id="lin3" style="display: none;" class="line"></div>
                            <div id="text3" style="display: none;" class="form-group row">
                                <label class="col-sm-4 form-control-label">描述</label>
                                <div class="col-sm-7">
                                    <input type="text" id="description" name="description" class="form-control">
                                </div>
                            </div>
                            <div id="lin4" style="display: none;" class="line"></div>
                            <div id="text4" style="display: none;" class="form-group row">
                                <div class="col-sm-6 ">
                                    <!-- <button type="submit" class="btn btn-secondary">Cancel</button> -->
                                    <button  type="submit" class="btn btn-primary">确认更改</button>
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
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="js/charts-home.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
    <script>
		function SearchCameraInfo() {
			var value = document.getElementById("name").value;
			$.ajax({
				type : 'POST',
				url : "SearchCamera",
				data : {
					name : value
				},
				success : function(result) {
					console.log(result)
					if(result == ""){
    					alert("未查询到结果");}
					else{
					var resultArr = result.split(",");
					document.getElementById("lin1").style.display = "";//显
					document.getElementById("text1").style.display = "";//显
					document.getElementById("lin2").style.display = "";//显
					document.getElementById("text2").style.display = "";//显
					document.getElementById("lin3").style.display = "";//显
					document.getElementById("text3").style.display = "";//显
					document.getElementById("lin4").style.display = "";//显
					document.getElementById("text4").style.display = "";//显
					document.getElementById("cameraname").value=resultArr[0];
					document.getElementById("location").value=resultArr[1];
					document.getElementById("description").value=resultArr[2];
					}
				}
			});
		};
	</script>
  </body>
</html>