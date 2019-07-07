<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>更改用户信息</title>
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
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
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
                  <div class="brand-text d-none d-lg-inline-block"><strong>人流量监控平台</strong></div>
                  <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                <!-- Notifications-->
                
                <!-- Messages                        -->
                <!-- <li class="nav-item dropdown"> <a id="messages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-envelope-o"></i><span class="badge bg-orange badge-corner">10</span></a>
                  <ul aria-labelledby="notifications" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                        <div class="msg-profile"> <img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="msg-body">
                          <h3 class="h5">Jason Doe</h3><span>Sent You Message</span>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                        <div class="msg-profile"> <img src="img/avatar-2.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="msg-body">
                          <h3 class="h5">Frank Williams</h3><span>Sent You Message</span>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item d-flex"> 
                        <div class="msg-profile"> <img src="img/avatar-3.jpg" alt="..." class="img-fluid rounded-circle"></div>
                        <div class="msg-body">
                          <h3 class="h5">Ashley Wood</h3><span>Sent You Message</span>
                        </div></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>Read all messages   </strong></a></li>
                  </ul>
                </li> -->
                <!-- Languages dropdown    -->
                <!-- <li class="nav-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="img/flags/16/GB.png" alt="English"><span class="d-none d-sm-inline-block">English</span></a>
                  <ul aria-labelledby="languages" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/DE.png" alt="English" class="mr-2">German</a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/FR.png" alt="English" class="mr-2">French                                         </a></li>
                  </ul>
                </li> -->
                <!-- Logout    -->
                <li class="nav-item"><a href="LogoutServlet" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
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
              <h1 class="h4">${sessionScope.loginUsername}</h1>
              <p>email: ${sessionScope.email}</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">information</span>
          <ul class="list-unstyled">
                    <li><a href="adminindex.jsp"> <i class="icon-home"></i>用户管理 </a></li>
                    <li><a href="#exampledropdownDropdown" aria-expanded="true" data-toggle="collapse"> <i class="icon-interface-windows"></i>个人信息</a>
                        <ul id="exampledropdownDropdown" class="list-unstyled collapse show">
                          <li><a href="adduser.jsp">添加用户</a></li>
                          <li><a href="deleteuser.jsp">删除用户</a></li>
                          <li  class="active"><a href="changeuser.jsp">更改用户信息 </a></li>
                          <li><a href="finduser.jsp">查找用户</a></li>
                        </ul>
                    </li>
                    <li><a href="#exampledropdownDropdown1" aria-expanded="false" data-toggle="collapse"> <i class="icon-list-1"></i>摄像头管理</a>
                        <ul id="exampledropdownDropdown1" class="list-unstyled collapse">
                            <li><a href="addcamera.jsp">添加摄像头</a></li>
                            <li><a href="deletecamera.jsp">删除摄像头</a></li>
                            <li><a href="changecamera.jsp">更改摄像头信息 </a></li>
                            <li><a href="findcamera.jsp">查看摄像头信息</a></li>
                        </ul>
                    </li>
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

          <section class="forms" > 
                <div class="container-fluid">
                  <div class="row" style="text-align: center;">
                    <!-- Form Elements -->
                    <div class="col-lg-2">

                    </div>
                    <div class="col-lg-8">
                      <div class="card">
                        <!-- <div class="card-close">
                          <div class="dropdown">
                            <button type="button" id="closeCard5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                            <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                          </div>
                        </div> -->
                        <div class="card-header d-flex align-items-center">
                          <h3 class="h4">更改用户信息</h3>
                        </div>
                        <div class="card-body">
                          <form class="form-horizontal">
                            <div class="form-group row">
                                <label class="col-sm-4 form-control-label">邮箱</label>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input type="email" class="form-control">
                                            <div class="input-group-append">
                                                <button type="button" class="btn btn-primary">查询</button>
                                            </div>
                                        </div>
                                    </div>
                                    <small class="help-block-none">邮箱地址不正确，请输入正确的邮箱地址</small>
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="card-body text-center">
                                <div class="client-avatar">
                                    <img src="img/avatar-2.jpg" alt="..." class="img-fluid rounded-circle">
                                    <div class="status bg-green"></div>
                                </div>
                                <!-- <div class="client-title">
                                    <h3>Jason Doe</h3>
                                    <span>Web Developer</span>
                                    <a href="#">Follow</a>
                                </div> -->
                                <div class="line"></div>
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                
                                    </div>
                                
                                    <div class="col-sm-6">
                                        <div class="card-body no-padding">
                                            <!-- Item-->
                                            <div class="item d-flex justify-content-between">
                                                <div class="info d-flex">
                                                    <div class="title">
                                                        <h5>用户名</h5>
                                                    </div>
                                                </div>
                                                <div class="text-right">
                                                    <div class="form-group row">
                                                        <div class="col-sm-4">
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" placeholder="请输入用户名" class="form-control">
                                                        </div>
                                                    </div>
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
                                                    <div class="form-group row">
                                                        <div class="col-sm-4">
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="email" placeholder="请输入邮箱地址" class="form-control">
                                                        </div>
                                                    </div>
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
                                                    <div class="form-group row">
                                                        <div class="col-sm-4">
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <select name="account" class="form-control">
                                                                <option>男</option>
                                                                <option>女</option>
                                                            </select>
                                                        </div>
                                                    </div>
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
                                                    <div class="form-group row">
                                                        <div class="col-sm-4">
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" placeholder="请输入电话号码" class="form-control">
                                                        </div>
                                                    </div>
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
                                                    <div class="form-group row">
                                                        <div class="col-sm-4">
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <select name="position" class="form-control">
                                                                <option>职位1</option>
                                                                <option>职位2</option>
                                                            </select>
                                                        </div>
                                                    </div>
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
                                                    <div class="form-group row">
                                                        <div class="col-sm-4">
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <input type="text" placeholder="请输入个人简介" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                                    <div class="col-sm-3">
                                
                                    </div>
                                </div>
                            </div>
                            <div class="line"></div>
                            <div class="form-group row">
                                <div class="col-sm-6 ">
                                    <button type="submit" class="btn btn-primary">确认更改</button>
                                </div>
                                <div class="col-sm-6 ">
                                    <button type="submit" class="btn btn-secondary">取消</button>
                                </div>
                            </div>

                          </form>
                        </div>
                      </div>
                    </div>

                    <div class="col-lg-2">

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
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="js/charts-home.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>