package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import entity.Page;
import entity.Record;
import service.RecordService;
/**
 * @author Y1041
 * record.jsp 按时间查询
 * */
public class RecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<Record> records = new ArrayList<Record>();
		//按时间查询
		String username = request.getParameter("username");
		String selectWay = request.getParameter("selectway");
		String plate = request.getParameter("plate");
		String startTimeScope = request.getParameter("starttimescope");
		String endTimeScope = request.getParameter("endtimescope");
		RecordService service = new RecordService();
		Page page = new Page();
		
		if (selectWay.equals("消费时间")) {
			records = service.queryRecordByStartTime(username, plate, startTimeScope, endTimeScope);
			page.setRecords(records);
			request.setAttribute("pages", page);
			request.getRequestDispatcher("record_details_1.jsp").forward(request, response);
		}else {
			
		}
		
	}

}
