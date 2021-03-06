<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>金盾智联</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/css.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="js/jquery-1.9.1.min.js"></script>
<link href="css/animate.min.css" rel="stylesheet" />
<script src="js/banner.js"></script>
    <style type="text/css">



    </style>
</head>

<body>
<%
String username = (String)session.getAttribute("username");

%>
	<div class="header">
		<div class="container">
			<div class="row header_box">
				<a href="index.jsp"><img src="images/logo.png" class="pull-left logo" /></a>
				<div class="pull-right call">
					<ul>
						<li class="border_rt">
							<i class="icon iconfont"></i>
							24小时服务热线<br/>4000-798-369
						</li>
						<li class="play">
								微信关注<br/>下载APP
							<div class="play_box animated">
									<div class="pull-left box">
										<h4>微信关注</h4>
										<img src="images/erweima.png" />
									</div>
									<div class="pull-left box">
										<h4>下载APP</h4>
										<img src="images/mg.png" />
									</div>
								<div class="clear"></div>
								<span></span>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="nav_box">
			<div class="container warp">
				<ul class="pull-left">
					<li>
						<a href="index.jsp">
							<i class="icon iconfont">&#xe606;</i>
							网站首页
						</a>
					</li>
					<li class="ac">
						<a href="serve.jsp">
							<i class="icon iconfont">&#xe634;</i>
							服务介绍
						</a>
					</li>
					<li>
						<a href="news.jsp">
							<i class="icon iconfont">&#xe6cb;</i>
							新闻资讯
						</a>
					</li>
					<li>
						<a href="contact.jsp">
							<i class="icon iconfont">&#xe605;</i>
							联系我们
						</a>
					</li>
					<li>
						<a href="RecordServlet2?username=<%=username%>">
							<i class="icon iconfont">&#xe66c;</i>
							通行记录
						</a>
					</li>
					<div class="clear"></div>
				</ul>
				<div class="logoin pull-right">
					<%
						if(username==null){
							out.print("<a href='logoin.jsp' class='ac'>");
							out.print("<i class='icon iconfont'>&#xe60c;</i>登陆</a>");
							out.print("<a href='enroll.jsp'>");
							out.print("<i class='icon iconfont' >&#xe697;</i>注册</a>");
						}else{
							out.print("<a href='index.jsp' class='ac'>");
							out.print("<i class='icon iconfont'>&#xe60c;</i>");
							out.print(username+"</a>");
							out.print("<a href='logoin.jsp'");
							out.print("<i class='icon iconfont' >&#xe697;</i>注销</a>");
						}
						%>	
				</div>
			</div>		
		</div>
	</div>
	
	<!------------banner---------->
	<!--全屏滚动-->
	<div class="banner">
	  <div class="b-img">
		  <a href="#" style="background:url(images/banner01.png) center no-repeat;"></a>
		  <a href="#" style="background:url(images/banner02.png) center no-repeat;"></a>

	  </div>
	  <div class="b-list"></div>
	  <!---
		  <a class="bar-left" href="#"><em></em></a>
		  <a class="bar-right" href="#"><em></em></a> 
		  --->
	</div>
	<!--end 全屏滚动-->
   <div class="container-fluid catalogue">
		<div class="container">
			<!---------------导航------------------>
			<div class="row">
				<div class="col-xs-4 text-center">
					<p>服务介绍</p>
				</div>
				<div class="col-xs-8 text-center">
				<a href="serve.jsp">服务介绍</a>
					<a href="serve_2.jsp"  class="ac">北斗卫星定位</a>
					<a href="serve_3.jsp">汽车增值服务</a>
				</div>
			</div>
		</div>
	</div>	
	<!-------主体-北斗卫星定位------------->
	
	<div class="container serve_box">
		<div class="row">
			<div class="col-xs-3">
				<div class="serve_lf">
					<ul>
						<li>
							<a href="#" class="ac_s">北斗卫星定位</a>
						</li>
						<li>
							<a href="#">部标北斗卫星定位</a>
						</li>
						<li>
							<a href="#">全国货运平台</a>
						</li>
						<li>
							<a href="#">北斗车联网</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-xs-9">
				<div class="serve_ron">
					<h3>北斗卫星定位-简介</h3>
					<p>
						简介
北斗卫星定位系统是由中国建立的区域导航定位系统。该系统由三颗（两颗工作卫星、一颗备用卫星）北斗定位卫星（北斗一号）、地面控制中心为主的地面部份、北斗用户终端三部分组成。北斗定位系统可向用户提供全天候、二十四小时的即时定位服务，授时精度可达数十纳秒(ns)的同步精度，其定位精度与GPS相当。北斗一号导航定位卫星由中国空间技术研究院研究制造。三颗导航定位卫星的发射时间分别为：2000年10月31日；2000年12月21日；2003年5月25日，第三颗是备用卫星。2008年北京奥运会期间，它将在交通、场馆安全的定位监控方面，和已有的GPS卫星定位系统一起，发挥“双保险”作用。
北斗一号卫星定位系统的英文简称为BD，在ITU（国际电信联合会）登记的无线电频段为L波段（发射）和S波段（接收）。  北斗二代卫星定位系统的英文为Compass（即指南针），在ITU登记的无线电频段为L波段。
北斗一号系统的基本功能包括：定位、通信（短消息）和授时。
北斗二代系统的功能与GPS相同，即定位与授时。


系统工作原理
“北斗一号”卫星定位系出用户到第一颗卫星的距离，以及用户到两颗卫星距离之和，从而知道用户处于一个以第一颗卫星为球心的一个球面，和以两颗卫星为焦点的椭球面之间的交线上。另外中心控制系统从存储在计算机内的数字化地形图查寻到用户高程值，又可知道用户出于某一与地球基准椭球面平行的椭球面上。从而中心控制系统可最终计算出用户所在点的三维坐标，这个坐标经加密由出站信号发送给用户。
“北斗一号”的覆盖范围是北纬5°一55°，东经70°一140°之间的心脏地区，上大下小，最宽处在北纬35°左右。其定位精度为水平精度100米(1σ)，设立标校站之后为20米(类似差分状态)。工作频率：2491.75MHz。系统能容纳的用户数为每小时540000户。
					</p>
					<img src="images/e1.jpg" />
					<h3>与GPS系统对比</h3>
					
					<p>1、覆盖范围：北斗导航系统是覆盖我国本土的区域导航系统。覆盖范围东经约70°一140°，北纬5°一55°。GPS是覆盖全球的全天候导航系统。能够确保地球上任何地点、任何时间能同时观测到6-9颗卫星(实际上最多能观测到11颗)。</p>
					<p>2、卫星数量和轨道特性：北斗导航系统是在地球赤道平面上设置2颗地球同步卫星颗卫星的赤道角距约60°。GPS是在6个轨道平面上设置24颗卫星，轨道赤道倾角55°，轨道面赤道角距60°。航卫星为准同步轨道，绕地球一周11小时58分。</p>
					<p>3、定位原理：北斗导航系统是主动式双向测距二维导航。地面中心控制系统解算，供用户三维定位数据。GPS是被动式伪码单向测距三维导航。由用户设备独立解算自位解算在那里而不是由用户设备完成的。为了弥补这种系统易损性，GPS正在发展星际横向数据链技术，使万一主控站被毁后GPS卫星可以独立运行。而“北斗一号”系统从原理上排除了这种可能性，一旦中心控制系统受损，系统就不能继续工作了。</p>
					<p>4、实时性：“北斗一号”用户的定位申请要送回中心控制系统，中心控制系统解算出用户的三维位置数据之后再发回用户，其间要经过地球静止卫星走一个来回，再加上卫星转发，中心控制系统的处理，时间延迟就更长了，因此对于高速运动体，就加大了定位的误差。此外，“北斗一号”卫星导航系统也有一些自身的特点，其具备的短信通讯功能就是GPS所不具备的。</p>
					<p>综上所述，北斗导航系统具有卫星数量少、投资小、用户设备简单价廉、能实现一定区域的导航定位、通讯等多用途，可满足当前我国陆、海、空运输导航定位的需求。缺点是不能覆盖两极地区，赤道附近定位精度差，只能二维主动式定位，且需提供用户高程数据，不能满足高动态和保密的军事用户要求，用户数量受一定限制。但最重要的是，“北斗一号”导航系统是我国独立自主建立的卫星导少的初步起步系统。此外，该系统并不排斥国内民用市场对GPS的广泛使用。相反，在此基础上还将建立中国的GPS广域差分系统。可以使受SA干扰的GPS民用码接收机的定位精度由百米级修正到数米级，可以更好的促进GPS在民间的利用。当然，我们也需要认识到，随着我军高技术武器的不断发展，对导航定位的信息支持要求越来越高。</p>
				
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
<!---------footer-------------->
<div class="footer ">
	<div class="container box">
    	<div class="row">
        	<div class="col-xs-4">
            	<h4>关于我们</h4>
                <a>
				金盾网联是由省有关部门牵头发起面向全省推行的惠民直通车项目，其携手中国银行、中国石化等多家百强企业全新联合打造，为有车一族提供便捷、安全、实惠、省时的客户绿色通道。
				</a>
            </div>
            <div class="col-xs-4">
            	<h4>友情链接</h4>
                <a href="http://www.zonuo-china.com/">烟台中诺网络科技有限公司</a>
                <a href="http://www.dotopyun.com/">山东兴鋆网络科技有限公司</a>
            </div>
            <div class="col-xs-4  text-center">
				<div class="pull-left ig_d">
					<h4>微信关注</h4>
                	<img src="images/erweima.png" />
				</div>
           		<div class="pull-left ig_d">
					<h4>下载APP</h4>
                	<img src="images/mg.png" />
				</div>
            	

            </div>
        </div>
    </div>
    <div class="copyright">
    	<div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <span></span>
                    <span>©2005-2015 山东金盾经贸投资有限公司 版权所有 鲁ICP备12010501号</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
		$(".play").mouseover(function(){
			$(".play_box").addClass("fadeInUp");
		});
	</script>
</html>