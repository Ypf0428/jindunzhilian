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
							通行记录 / 用户信息
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
							<a href="record_2.jsp">账单查询</a>
						</li>
						<li>
							<a href="record_3.jsp">修改密码</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-xs-9">
				<div class="record_ron">
					<h3>车辆信息</h3>
					<div class="table_box">
						<table id="sample-table-1" class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>用户名称</th>
									<th>鲁通卡号码</th>
									<th>车牌号码</th>
									<th>近3天</th>
									<th>近7天</th>
									<th>近30天</th>
									<th>上月</th>
									<th>当月</th>
									<th>日通行额度</th>
									<th>通行记录</th>
								</tr>
							</thead>
							<tbody>
							<%
								
								int LTID = (Integer)session.getAttribute("LTID");
								List<Record> res = (List)request.getAttribute("record");
								if (res != null) {
									for (int i = 0; i < res.size(); i++) {
										out.print("<tr>");
										out.print("<td>" + username + "</td>");
										out.print("<td>" + LTID + "</td>");
										out.print("<td>" + res.get(i).getPlate()+ "</td>");
										out.print("<td><a href='record_check_2.jsp'>9.5</a></td>");
										out.print("<td><a href='record_check_2.jsp'>33.25</a></td>");
										out.print("<td><a href='record_check_2.jsp'>"+res.get(i).getSum()+"</a></td>");
										out.print("<td><a href='record_check_2.jsp'>90.25</a></td>");
										out.print("<td><a href='record_check_2.jsp'>33.25</a></td>");
										out.print("<td><button class='btn btn-xs btn btn-primary' id='set'>设定</button></td>");
										out.print("<td><a href='RecordCheckServlet?plate="+res.get(i).getPlate()+"'>查询</a></td>");
										out.print("</tr>");
									}
								}
							%>																
							</tbody>
						</table>
						<div class="state">
							<h4>详细查询： </h4>
							<p>1、现全国高速路联网收费，数据上传周期较长，结算账单非以消费日期进行月结算。 </p>
							<p>2、结算账单明细中有可能包含上月消费数据或本月消费数据，属于正常现象。 </p>
							<p>3、已结算的通行明细，不会出现在下个结算账单中，若上月未结算的通行明细，将记入下个结算账单中。 </p>
							<p>4、每月账单出具以交通厅系统出具的上传数据为准，其他查询仅供参考。 </p>
							<p>如有疑问，请致电全国客服专线：4000-798-369 </p>
							<p>消费时间：用于查询通行费用产生的详情 </p>
							<p>结算时间：用于查询结算账单明细对账使用</p>
						</div>
					</div>
				</div>
                <div class="soso">
						<h3>查询</h3>
						<ul>
							<li>
								<h3>按月份查询：</h3>
								<form action="RecordMonthServlet?username=<%=username %>" method="post">
								<select name="selectway" class="form-control">
									<option>请选择查询方式</option>
									<option value="消费时间">消费时间</option>
									<option value="结算时间">结算时间</option>
								</select>
								<select name="plate" class="form-control">
									<option>请选择查询车辆</option>
									<%for(int i = 0; i < res.size();i++){
										out.print("<option>"+res.get(i).getPlate()+"</option>");
									}
									%>
								</select>
								<input type="submit" class="btn btn-danger" name="nowmonth" value="查询本月">
								<input type="submit" class="btn btn-danger" name="lastmonth" value="查询上月">
								</form>
							</li>
							<li>
								<h3>按时间查询：</h3>
								<form action="RecordServlet?username=<%=username %>" method="post">
								<select class="form-control" name="selectway">
									<option>请选择查询方式</option>
									<option value="消费时间">消费时间</option>
									<option value="结算时间">结算时间</option>
								</select>
								<select class="form-control" name="plate">
									<option>请选择查询车辆</option>
									<%for(int i = 0; i < res.size();i++){
										out.print("<option>"+res.get(i).getPlate()+"</option>");
									}
									%>
								</select>
								<input type="date" class="form-control" name="starttimescope">
								<label>至</label>
								<input type="date" class="form-control" name="endtimescope">
								<input type="submit" value="开始查询" class="btn btn-danger">
								</form>
								
							</li>
							
						</ul>
						<div class="state">
							<h4>其他查询方式： </h4>
							<p>1、关注“金盾网联”微信公众号，输入鲁通卡号查询通行明细（适用于1-3辆车的车主查询）微信号：jdwlkf  </p>
							<p>2、关注“金盾网联”微信公众号，下载最新版本“金盾网联”手机App客户端，绑定鲁通卡号查询通行明细（适用于10辆车以内的车主查询）</p>
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


<div id="dv" style="display:none">

	<ul>
		<li >
			<label>设定金额：</label>
			 <input type="text" class="form-control" id="inp" placeholder="请设定金额"/>
		</li>
		<li>
			<button class="btn btn-danger" id="dv2">确定</button>
		</li>
	</ul>
					 
	</div>
<script>

$("#dv2").click(
function(){
	layer.msg('设定成功')  
	}
)

$("#set").click(
function(){
layer.open({
  type: 1 //Page层类型
  ,area: ['500px', '300px']
  ,title: '日通行额度设定'
  ,shade: 0.6 //遮罩透明度
  ,anim: 0 //0-6的动画形式，-1不开启
  ,content: $("#dv")
}); 
	}
)

    
</script>
<script>
		$(".play").mouseover(function(){
			$(".play_box").addClass("fadeInUp");
		});
	</script>
</body>
</html>