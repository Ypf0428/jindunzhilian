package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Page;
import entity.Record;
import service.RecordService;

/**
 * Servlet implementation class RecordMonthServlet
 */
public class RecordMonthServlet extends HttpServlet {
	static String now;
	static String last;
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
		System.out.println(selectWay);
		String plate = request.getParameter("plate");
		String NowMonth = request.getParameter("nowmonth");
		System.out.println(NowMonth);
		String LastMonth = request.getParameter("lastmonth");
		String month = "";
		//获取时间
		Calendar c = Calendar.getInstance();
		String year = String.valueOf(c.get(Calendar.YEAR));
		int nowmonth = c.get(Calendar.MONTH)+1;
		int lastmonth = c.get(Calendar.MONTH);
		System.out.println(nowmonth);
		System.out.println(lastmonth);
		//判断月份
		if (nowmonth < 10) {
			now="/0"+nowmonth;
			System.out.println();
		}else {
			now="/"+nowmonth;
		}
		
		if (lastmonth<10) {
			last = "/0"+lastmonth;
		}else {
			last = "/"+lastmonth;
		}
		
		
		if ("查询本月".equals(NowMonth)) {
		month = year+now;
		System.out.println(month);
		}else if("查询上月".equals(LastMonth)) {
			month = year+last;
			System.out.println(month);
		}
		RecordService service = new RecordService();
		List<Record> records = new ArrayList<Record>() ;
		Page page = new Page();
		//调用业务逻辑层
		if ("消费时间".equals(selectWay)) {
			records = service.queryRecordByMonStartTime(username, plate, month);
			System.out.println(records);
		}else if("结算时间".equals(selectWay)) {
			records = service.queryRecordByMonArrivalTime(username, plate, month);
		}
		page.setRecords(records);
		request.setAttribute("pages", page);
		request.getRequestDispatcher("record_details_1.jsp").forward(request, response);
	}
}
