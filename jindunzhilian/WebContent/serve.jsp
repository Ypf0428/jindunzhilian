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
				<a href="serve.jsp" class="ac">服务介绍</a>
					<a href="serve_2.jsp">北斗卫星定位</a>
					<a href="serve_3.jsp">汽车增值服务</a>
				</div>
			</div>
		</div>
	</div>	
	<!-------主体------------->
	<div class="container-fluid">
		<div class="container">
			<div class="row">

				<div class="col-xs-12">
					<div class="serve">
						<div class="serve_ig">
							<img src="images/d1.png" />
						</div>
						<div class="serve_content">
							<h1>全国道路货运车辆公共监管与服务平台</h1>

							<p>全本地化保障！更靠谱！</p>
							<p>全省各区覆盖！更贴心！</p>
							<p>全国联网服务！更专业！</p>
							<button class="btn btn-danger">更多内容</button>

						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid" style="background: #F5F5F5">
		<div class="container">
			<div class="row">

				<div class="col-xs-12">
					<div class="serve">
						<div class="serve_content">
							<h1>金盾网联·智能车联网服务平台</h1>

							<p>全国高速信用通行服务</p>
							<p>中石化加油专享优惠服务</p>
							<p>车辆保险特色服务</p>
							<p>特色道路接力救援服务</p>
							<p>法律咨询免费服务</p>
							<p>机油、轮胎、维修等服务</p>
							<p>中国银行金盾网联信用卡金融服务</p>
							<button class="btn btn-danger">更多内容</button>
						</div>
						<div class="serve_ig">
							<img src="images/d2.png" />
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="container">
			<div class="row">

				<div class="col-xs-12">
					<div class="serve">
						<div class="serve_ig">
							<img src="images/d3.png" />
						</div>
						<div class="serve_content">
							<h1>轻轻松松一站式 网上办理<br/>快速享受金盾网联·智能车联网服务平台的超值体验</h1>
							<p>网上办理</p>
							<p>申请信用卡</p>
							<p>高速路信用通行</p>
							<p>其他业务……</p>
							<button class="btn btn-danger">更多内容</button>

						</div>
						<div class="clear"></div>
					</div>
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