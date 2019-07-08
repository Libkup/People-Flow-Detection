<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home</title>
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
	<link href="css/video-js.css" rel="stylesheet">
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
                <!-- Navbar Brand --><a href="UserIndex" class="navbar-brand d-none d-sm-inline-block">
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
            <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
            <div class="title">
              <h1 class="h4">${sessionScope.loginUsername}</h1>
              <p>email: ${sessionScope.email}</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus-->
          <span class="heading">Main</span>
          <ul class="list-unstyled">
                    <li class="active"><a href="UserIndex"> <i class="icon-home"></i>主页 </a></li>
                    <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>个人信息</a>
                      <ul id="exampledropdownDropdown" class="list-unstyled collapse">
                        <li><a href="information.jsp">更改个人信息</a></li>
                        <li><a href="changepassword.jsp">更改个人密码</a></li>
                      </ul>
                    </li>
                    <li><a href="#exampledropdownDropdown1" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>摄像头管理</a>
                      <ul id="exampledropdownDropdown1" class="list-unstyled collapse">
                        <li><a href="userAddCamera.jsp">添加摄像头</a></li>
                        <li><a href="userDeleteCamera.jsp">删除摄像头</a></li>
                      </ul>
                    </li>
                    <!-- <li><a href="tables.html"> <i class="icon-grid"></i>Tables </a></li> -->
                    <!-- <li><a href="charts.html"> <i class="fa fa-bar-chart"></i>Charts </a></li> -->
                    <!-- <li><a href="forms.html"> <i class="icon-padnote"></i>Forms </a></li> -->
                    <!-- <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Example dropdown </a>
                      <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                        <li><a href="#">Page</a></li>
                        <li><a href="#">Page</a></li>
                        <li><a href="#">Page</a></li>
                      </ul>
                    </li> -->
                    <!-- <li><a href="login.html"> <i class="icon-interface-windows"></i>Login page </a></li> -->
          </ul>
          
          <!-- <span class="heading">Extras</span>
          <ul class="list-unstyled">
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
              <h2 class="no-margin-bottom">监控中心</h2>
            </div>
          </header>
          
          <!-- Dashboard Header Section    -->
          <c:forEach items="${requestScope.datas}" var="data" varStatus="status">
		       <section class="dashboard-header">
		            <div class="container-fluid">
		              <!-- title -->
		              <div class="project">
		                <div class="row bg-white has-shadow">
		                  <div class="left-col col-lg-6 d-flex align-items-center justify-content-between">
		                    <div class="project-title d-flex align-items-center">
		                      <div class="image has-shadow">
		                        <img src="img/project-1.jpg" alt="..." class="img-fluid">
		                      </div>
		                      <div class="text">
		                        <h3 class="h4">${data[0] }</h3>
		                        <small>${data[1] }</small>
		                      </div>
		                    </div>
		                  </div>
		                  <div class="right-col col-lg-6 d-flex align-items-center">
		                    <div class="time">
		                      <i class="fa fa-clock-o"></i>
		                      <span id="cg${data[4] }" class="hidden-sm-down">2018 / 12 / 21上午12:00:00</span>
		                    </div>
		                    <div class="project-progress">
		                      <div class="progress">
		                        <div role="progressbar" style="width: 45%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-red"></div>
		                      </div>
		                    </div>
		                  </div>
		                </div>
		              </div>
		              <!-- datas and groph -->
		              <div class="row">
		                <!-- Statistics -->
		                <div class="statistics col-lg-2 col-12">
		                  <div class="statistic d-flex align-items-center bg-white has-shadow">
		                    <div class="icon bg-orange"><i class="fa fa-paper-plane-o"></i></div>
		                    <div class="text"><strong id="Camera${data[4] }currentCount">147</strong><br><small>当前人数</small></div>
		                  </div>
		                  <div class="statistic d-flex align-items-center bg-white has-shadow">
		                    <div class="icon bg-red"><i class="fa fa-tasks"></i></div>
		                    <div class="text"><strong id="Camera${data[4] }historyHighest">234</strong><br><small>历史最高人数</small></div>
		                  </div>
		                  <div class="statistic d-flex align-items-center bg-white has-shadow">
		                    <div class="icon bg-green"><i class="fa fa-calendar-o"></i></div>
		                    <div class="text"><strong id="Camera${data[4] }hourHighest">152</strong><br><small>近一小时最高人数</small></div>
		                  </div>
		                  
		                  <div class="statistic d-flex align-items-center bg-white has-shadow">
		                    <div class="icon bg-blue"><i class="fa fa-circle-thin"></i></div>
		                    <div class="text"><strong id="Camera${data[4] }prediction">147</strong><br><small>预测未来2分钟内人数</small></div>
		                  </div>
		                  <div class="articles card">
		                  	<div class="card-body no-padding">
		                      <div class="item d-flex align-items-center">
		                        <div class="image"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
		                        <div class="text"><a href="#">
		                            <h3 class="h5">Security Officer 1</h3></a><small>Tel: 18351567516</small></div>
		                      </div>
		                     </div>
		                   </div>
		                </div>
		                <div class="chart col-lg-5 col-12">
		                  <div class="card">
		                    <div class="card-header d-flex align-items-center">
		                      <h3 class="h4" id="camera${data[4] }CurrentThreshole">当前阈值：0人</h3>
		                    </div>
		                    <div class="card-body">
		                      <div class="form-group">
		                         <div class="input-group">
		                            <input id="camera${data[4] }Threshold" type="text" class="form-control" placeholder="大于零的数字">
		                              <div class="input-group-append">
		                                <button id="button${data[4] }" type="button" onclick="check(this)" class="btn btn-primary">Go!</button>
		                              </div>
		                         </div>
		                       </div>
		                    </div>
		                  </div>
		                  <div class="line-chart-example card">
		                    <!-- <canvas id="lineCahrt"></canvas> -->
		                    <div class="card-header d-flex align-items-center">
		                      <h3 class="h4">监控视频</h3>
		                    </div>
		                    <div class="card-body">
		                      <video class="video-js vjs-big-play-centered vjs-fluid" controls preload="auto"  width="600" height="400" poster="img/timg.jpg"
		                      data-setup="{}">
		                      <source src="${data[2] }" type="rtmp/flv"> </p>
		                      </video>
		                    </div>
		                  </div>
		               </div>
		
		                <div class="chart col-lg-5 col-12">
		                  
		                  <div class="line-chart-example card">
		                    <div class="card-header d-flex align-items-center">
		                      <h3 class="h4">近十分钟人流量</h3>
		                    </div>
		                    <div class="card-body">
		                      <canvas id="${data[3] }"></canvas>
		                    </div>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </section>
		       
		  </c:forEach>

          
          <input type="hidden" id="tempdatas" value="${requestScope.charts }">
          
          
          <!-- Updates Section -->
          
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
    <script src="js/charts-custom.js"></script>
    <script src="js/front.js"></script>
    <script src="js/videojs-ie8.min.js"></script>
    <script src="js/video.js"></script>
    <script>
        setInterval("#span.innerHTML=new Date().toLocaleString()",1000);
    </script>
    <script>
        setInterval("cg2.innerHTML=new Date().toLocaleString()",1000);
    </script>
	<script>
		function updatecgs(){
			var cgs = "${requestScope.cgids}";
			cgs = cgs.replace("[", "");
			cgs = cgs.replace("]", "");
			var cgsarray = cgs.split(",");
			for(i = 0;i < cgsarray.length; i++ ){
				var cgid = document.getElementById(cgsarray[i].replace(" ", ""));
				cgid.innerHTML=new Date().toLocaleString();
			}
		}
		setInterval("updatecgs()",1000);
		
		var ids = "${requestScope.ids}";
		ids = ids.replace("[", "");
		ids = ids.replace("]", "");
		var idsarray = ids.split(",");
		for(i = 0; i < idsarray.length; i++){
			idsarray[i] = idsarray[i].replace(" ","");
		}
		function reloadView(x) {
			$.ajax({
				type : 'GET', // 请求类型, 默认为 GET
				url : "PeopleCount", // 	必需。规定把请求发送到哪个 URL。
				data: {"ids": ids}, // 可选。映射或字符串值。规定连同请求发送到服务器的数据。
				success : function(result) { // 可选。请求成功时执行的回调函数。
					var resultArr = result.split(",");
					for(i = 0; i < idsarray.length; i++){
						$("#Camera"+idsarray[i]+"currentCount").html(resultArr[i*5+0]);
						$("#Camera"+idsarray[i]+"historyHighest").html(resultArr[i*5+1]);
						$("#Camera"+idsarray[i]+"hourHighest").html(resultArr[i*5+2]);
						$("#Camera"+idsarray[i]+"prediction").html(resultArr[i*5+3]);
						$("#camera"+idsarray[i]+"CurrentThreshole").html("当前阈值：" + resultArr[i*5+4] + "人");
						var th = new Number(resultArr[i*5+4]);
						if(resultArr[i*5+0] >= th){
							var oPtxt=document.getElementById("Camera"+idsarray[i]+"currentCount");
							oPtxt.style.fontSize='50px';
							oPtxt.style.color='red';
						}else{
							var oPtxt=document.getElementById("Camera"+idsarray[i]+"currentCount");
							oPtxt.style.fontSize='25px';
							oPtxt.style.color='black';
						}
					}
				}
			});
		};
		setInterval('reloadView()', 1000);
		
		function check(obj) {
			var buttonid = obj.id.substr(6);
			var value = document.getElementById("camera" + buttonid + "Threshold").value;
			$.ajax({
				type : 'POST', // 请求类型, 默认为 GET
				url : "ThresholdSetting", // 	必需。规定把请求发送到哪个 URL。
				data: {Threshold: buttonid + "@" + value}, 
				success : function(result) { // 可选。请求成功时执行的回调函数。
					$("#camera" + buttonid + "CurrentThreshole").html("当前阈值：" + result + "人");
					document.getElementById("camera1Threshold").value = "";
				}
			});
		}
		
	</script>
	<!-- Main File-->
    
  </body>
</html>