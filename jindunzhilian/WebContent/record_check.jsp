<%@page import="entity.Record"%>
<%@page import="java.util.List"%>
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
<script src="js/jquery-1.9.1.min.js"></script>
<link href="css/animate.min.css" rel="stylesheet" />
<script src="layer/layer.js"></script>
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
					<li>
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
					<li  class="ac">
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
    <!-- 新闻中心-->
	<div class="container-fluid catalogue">
		<div class="container">
			<!---------------导航------------------>
			<div class="row">
				<div class="col-md-4 col-sm-12 col-xs-12 text-center">
					<p>通行记录</p>
				</div>
				<div class="col-md-8 col-sm-12 col-xs-12 text-center">
					<div class="record">
						<p>
							通行记录 / 查看
						</p>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!---------------用户信息------------------>
	<div class="container serve_box">
		<div class="row">
			<div class="col-xs-3">
				<div class="serve_lf">
					<ul>
						<li>
							<a href="RecordServlet2?username=<%=username %>" class="ac_s">用户信息</a>
						</li>
						<li>
							<a href="record_2.jsp" >账单查询</a>
						</li>
						<li>
							<a href="record_3.jsp">修改密码</a>
						</li>
					</ul>
				</div>
			</div>
							
			<div class="col-xs-9">
				<div class="record_ron">
					<h3>通行记录表</h3>
					<div class="table_box">
						<table id="sample-table-1" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th width="4%">鲁通卡号</th>
									<th width="11%">车牌号码</th>
									<th width="50%">交易摘要</th>
									<th width="10%">消费金额</th>
									<th>消费时间</th>
								</tr>
							</thead>
							<tbody>
							<%
								int sum = 0;
								int LTID = (Integer)session.getAttribute("LTID");
								List<Record> res = (List)request.getAttribute("record");
								if (res != null) {
									for (int i = 0; i < res.size(); i++) {
										out.print("<tr>");
										out.print("<td>" + LTID + "</td>");
										out.print("<td>" + res.get(i).getPlate()+ "</td>");
										out.print("<td style='width: 436px'>"+res.get(i).getStarttime()+res.get(i).getStartstation()+"站入,"+res.get(i).getArrivaltime()+res.get(i).getArrivalstation()+"站出</td>");
										out.print("<td style='width: 436px'>"+res.get(i).getMonetary()+"</td>");
										out.print("<td style='width: 436px'>"+res.get(i).getStarttime()+"</td>");
										out.print("</tr>");
										sum += res.get(i).getMonetary();
									}
								}
							%>									
								<tr>
									<td colspan="5">
										<div class="row">
											<div class="col-xs-2">
												<button class="btn btn-danger">导出文件</button>
											</div>
											<div class="col-xs-10 txt">
												<p>合计消费金额：<span>￥<%=sum %></span>扣款金额：<span>￥508.25</span></p>
											</div>
										</div>
										
									</td>
								</tr>
								
							</tbody>
						</table>
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