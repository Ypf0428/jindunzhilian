package servlet;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.RecordService;

/**
 * Servlet implementation class RecordMonthServlet
 */
public class RecordMonthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**设置编码格式统一为utf-8*/
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//获取各种参数
		String username=request.getParameter("username");
		String selectWay = request.getParameter("selectway");
		String plate = request.getParameter("plate");
		String NowMonth = request.getParameter("nowmonth");
		String LastMonth = request.getParameter("lastmonth");
		String month = "";
		//获取时间
		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR));
		int nowmonth = c.get(Calendar.MONTH+1);
		int lastmonth = c.get(Calendar.MONTH);
		//判断月份
		if ("nowmonth".equals(NowMonth)) {
		month = year+String.valueOf(nowmonth);
		}else if("lastmonth".equals(LastMonth)) {
			month = year+String.valueOf(lastmonth);
		}
		RecordService service = new RecordService();
		//调用业务逻辑层
		if ("消费时间".equals(selectWay)) {
			service.queryRecordByMonStartTime(username, plate, month);
		}else if("结算时间".equals(selectWay)) {
			service.queryRecordByMonArrivalTime(username, plate, month);
		}
	}
}
