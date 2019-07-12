<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>历史视频查询</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/daterangepicker-bs3.css">
    <link rel="stylesheet" href="css/daterangepicker-1.3.7.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
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
                <!-- Navbar Brand --><a href="AdminIndex" class="navbar-brand d-none d-sm-inline-block">
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
                <li class="nav-item"><a href="AdminLogout" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
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
                    <li><a href="AdminIndex"> <i class="icon-home"></i>主页 </a></li>
                    <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>用户管理</a>
                        <ul id="exampledropdownDropdown" class="list-unstyled collapse">
                          <li><a href="adduser.jsp">添加用户</a></li>
                          <li><a href="deleteuser.jsp">删除用户</a></li>
                          <li><a href="changeuser.jsp">更改用户信息 </a></li>
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
                    <li class="active"><a href="HistoricalVideo"> <i class="icon-home"></i>历史视频 </a></li>
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
              <h2 class="no-margin-bottom">历史视频</h2>
            </div>
          </header>
			
            <section class="forms" > 
                <div class="container-fluid">
                  <div class="row">
                    <!-- Form Elements -->
                    <div class="col-lg-12">
                      <div class="recent-activities card">
                        <div class="card-header">
                          <h3 class="h4">查看历史视频</h3>
                        </div>
                        
                        <div class="card-body">
                          <div class="form-group row">
                                <div class="col-sm-3">
                                <div class="page-content">
													<!-- BEGIN PAGE CONTAINER-->
													<div class="container-fluid">
														<div class="row-fluid" style="margin-top: 5px">
															<div class="span4">
																<div class="input-group">
																	<div class="control-group">
																		
																		<div class="pull-left">
																			<select id="cameraOption" name="cameraOption" class="form-control">
																				<c:forEach items="${requestScope.cameras}" var="camera" varStatus="status">
																				<option>${camera}</option>
																				</c:forEach>
																			</select>
																			&nbsp;
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>

												</div>
                                
                                </div>
                                <div class="col-sm-6">
												<div class="page-content">
													<!-- BEGIN PAGE CONTAINER-->
													<div class="container-fluid">
														<div class="row-fluid" style="margin-top: 5px">
															<div class="span4">
																<div class="input-group">
																	<div class="control-group">
																		
																		<div id="reportrange" class="pull-left dateRange"
																			style="height: 40px">
																			
																			<span id="time">time</span> 
																			
																		</div>
																		
																		
																	</div>
																</div>
															</div>
														</div>
													</div>

												</div>
											</div>
                                <div class="col-sm-3">
                                <div class="page-content">
													<!-- BEGIN PAGE CONTAINER-->
													<div class="container-fluid">
														<div class="row-fluid" style="margin-top: 5px">
															<div class="span4">
																<div class="input-group">
																	<div class="control-group">
																		
																		<div class="input-group-append">
																			<button type="button" class="btn btn-primary"
																				onclick="getVideos()">查询</button>
																		</div>
																		
																	</div>
																</div>
															</div>
														</div>
													</div>

												</div>
                                
                                </div>
                            </div>
                          <div class="line"></div>
                          
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
                
            </section>
          
              <!-- Page Footer-->
          
			<section class="dashboard-header">
		            <div class="container-fluid">
		              
		              <!-- datas and groph -->
		              
		              <div class="row" id = "videos" >
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
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="js/charts-home.js"></script>
    <script src="js/charts-custom.js"></script>
    <script src="js/front.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/daterangepicker-1.3.7.js"></script>
    <script src="js/videojs-ie8.min.js"></script>
    <script src="js/video.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
    <script>
    	
	    $(document).ready(function (){
			//时间插件
			$('#reportrange span').html(moment().subtract('hours', 1).format('YYYY/MM/DD HH:mm:ss') + ' - ' + moment().format('YYYY/MM/DD HH:mm:ss'));
	
			$('#reportrange').daterangepicker(
					{
						// startDate: moment().startOf('day'),
						//endDate: moment(),
						//minDate: '01/01/2012',	//最小时间
						maxDate : moment(), //最大时间 
						dateLimit : {
							days : 30
						}, //起止时间的最大间隔
						showDropdowns : true,
						showWeekNumbers : false, //是否显示第几周
						timePicker : true, //是否显示小时和分钟
						timePickerIncrement : 60, //时间的增量，单位为分钟
						timePicker12Hour : false, //是否使用12小时制来显示时间
						ranges : {
							//'最近1小时': [moment().subtract('hours',1), moment()],
							// '今日': [moment().startOf('day'), moment()],
		                    // '昨日': [moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day')],
		                    // '最近7日': [moment().subtract('days', 6), moment()],
		                    // '最近30日': [moment().subtract('days', 29), moment()]
						},
						opens : 'right', //日期选择框的弹出位置
						buttonClasses : [ 'btn btn-default' ],
						applyClass : 'btn-small btn-primary blue',
						cancelClass : 'btn-small',
						format : 'YYYY/MM/DD HH:mm:ss', //控件中from和to 显示的日期格式
						separator : ' to ',
						locale : {
							applyLabel : '确定',
							cancelLabel : '取消',
							fromLabel : '起始时间',
							toLabel : '结束时间',
							customRangeLabel : '选择时间',
							daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
							monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
									'七月', '八月', '九月', '十月', '十一月', '十二月' ],
							firstDay : 1
						}
					}, function(start, end, label) {//格式化日期显示框
		                
	                 	$('#reportrange span').html(start.format('YYYY/MM/DD HH:mm:ss') + ' - ' + end.format('YYYY/MM/DD HH:mm:ss'));
	               });
	
		//设置日期菜单被选项  --开始--
	  	  var dateOption ;
	  	  if("${riqi}"=='day') {
				dateOption = "今日";
	      }else if("${riqi}"=='yday') {
				dateOption = "昨日";
	      }else if("${riqi}"=='week'){
				dateOption ="最近7日";
	      }else if("${riqi}"=='month'){
				dateOption ="最近30日";
	      }else if("${riqi}"=='year'){
				dateOption ="最近一年";
	      }else{
				dateOption = "选择时间";
	      }
	  	   $(".daterangepicker").find("li").each(function (){
				if($(this).hasClass("active")){
					$(this).removeClass("active");
				}
				if(dateOption==$(this).html()){
					$(this).addClass("active");
				}
	      });
	      	   //设置日期菜单被选项  --结束--
	})
    
    	
    	function getVideos(){
    			var option = document.getElementById("cameraOption").value;
    			var times = document.getElementById("time").innerText;
    			var startTime = times.split("-")[0];
    			var endTime = times.split("-")[1];
        		$.ajax({
        			type : "POST",
        			url : "FindVideos",
        			data : {option: option, startTime : startTime, endTime : endTime},
        			error : function(){   
        				alert('error');   
        			},
        			success: function(data){
        				if(data == ""){
        					alert("未查询到结果");
        				}else{
        					document.getElementById('videos').style.display="";
        					var addressAndTime = data.split("|");
        					var videoAddress = addressAndTime[0].split(",");
        					var videoTime = addressAndTime[1].split(",");
            				var content = "";
          					for(i = 0;i < videoAddress.length-1; i++){
          						content += '<div class="col-lg-6">';
          						content += '<div class="line-chart-example card">';
          						content += '<div class="card-header d-flex align-items-center">';
          						content += '<h3 class="h4"> ' + videoTime[i] + '</h3>';
          						content += '</div>';
          						content += '<div class="card-body">';
          						content += '<video src="/savedVideo/' + videoAddress[i] + '" type="video/mp4" style="width:100%;height:100%; object-fit:fill;" controls="controls">' ;
          						content += '</video>';
          						content += '</div>';
          						content += '</div>';
          						content += '</div>';
          					}
        					$("#videos").html(content);
        				}
        			}
    		})
    	}
    
    </script>
  </body>
</html>