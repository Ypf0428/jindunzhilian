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
					<a href="serve_2.jsp">北斗卫星定位</a>
					<a href="serve_3.jsp"  class="ac">汽车增值服务</a>
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
							<a href="#" class="ac_s">汽车增值服务</a>
						</li>
						<li>
							<a href="#">全国高速畅行</a>
						</li>
						<li>
							<a href="#">加油专享优惠</a>
						</li>
						<li>
							<a href="#">多家车险折扣</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-xs-9">
				<div class="serve_ron">
					<h3>一、中石化加油特殊优惠</h3>
					<p>
					免费办卡、专享省25‰、优惠无封顶、便捷充值
免费办理独立号段中石化加油卡，专享返现优惠无封顶，包括加油返现、积分礼品等项目折抵高达千分之二十五的优惠待遇；现可实现网上充值，即将实现信用卡绑定加油卡后台自动充值，免除窗口排队等候环节。
					</p>
					<img src="images/e2.jpg" />
					<h3>二、高速鲁通卡信用通行</h3>
					
					<p>
					 免费OBU、9.5折、先过路后付费、无需圈存、全国联网
符合条件的可免费获赠OBU电子标签实现高速路畅通无阻；高速路先通行、后付费，享通行费95折优待；免去网点排队充值圈存的麻烦；2015年10月实现全国联网。
					</p>
					<img src="images/e3.jpg" />
					
					<h3>三、车辆保险特色服务</h3>
					<p>
						省级集团VIP、多家选择、上门服务、理赔专享绿色通道
多家保险公司任意选择；凡加入协作保险公司服务网，即可享省级集团大客户尊贵待遇；保险专员上门服务；享受优先理赔，全本地化一站式理赔。
					</p>
					<img src="images/e4.jpg" />
					
					<h3>四、北斗卫星定位管理系统服务</h3>
					<p>
						 符合国家标准、省技术服务平台、免费送设备、企业管理平台
货运车辆可预交年服务费或商业保费达到标准，即可免费获赠符合国家最新标准的北斗卫星定位装置及符合交通部要求的车辆综合管理平台；小汽车和单位用车也可预交服务费送设备。
					</p>
					<img src="images/e5.jpg" />
					
					<h3>五、特色道路接力救援服务</h3>
					<p>
						接力救援、无限次、非事故车救援
加入协作保险服务网的客户，专享距离长达200公里道路事故拖车救援服务；服务有效期内不限使用次数；同时12座以下非营运客车提供全国救援服务。
*以上道路救援服务根据客户所选择的不同保险协作公司而定
					</p>
					<img src="images/e6.jpg" />
					
					<h3>六、法律咨询免费服务</h3>
					<p>
						免费咨询、高达20%律师费补助
多家知名律师事务所提供专享VIP客户免费法律咨询援助服务；递交诉状打官司可独享20%律师费补助。
					</p>
					<img src="images/e7.jpg" />
					
					<h3>七、机油、轮胎、维修等服务</h3>
					<p>
						机油专享价省10%、厂家直供、免费送货
多家知名机油供应商集团购价格，包括长城，嘉实多，壳牌等；大客户提供预约免费送货上门服务；轮胎、维修等服务近期即将对外推放。
					</p>
					<img src="images/e8.jpg" />
					
					<h3>八、中国银行金盾网联信用卡特色功能</h3>
					<p>
						无年费、金融IC卡、借贷合一、取现无手续费、缴违章罚款
目前最具竞争力的金融芯片IC卡，符合中国人民银行要求；无办卡年费及手续费；信用卡与借记卡二合一，存款有利息，并可透支消费；该卡可享全国任意省内柜台存、取、汇免手续费以及网银跨行汇免费；网银缴纳交通违章罚款。
					</p>
					<img src="images/e10.jpg" />

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