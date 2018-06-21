package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Page;
import entity.Record;
import service.RecordService;

public class QueryRecordDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**设置编码格式统一为utf-8*/
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
//		/*获取record2.jsp中的消费时间*/
		String arrivalTime = request.getParameter("arrivaltime");
//		
		String currentPage = request.getParameter("currentPage");
		String username = request.getParameter("username");
		//String pageSize = request.getParameter("pageSize");
		if (currentPage==null) {
			currentPage = "1";
		}
		int currentPageNo = Integer.parseInt(currentPage);
		/*调用业务逻辑*/
		RecordService service = new RecordService();
		int totalCount = service.getTotalCount(arrivalTime,username);
		Page page = new Page();
		// 如果currentPage的值为null,说明是第一次进入此Servlet,故设为第 1 页
		/*if (pageSize != null) {
			page.setPageSize(Integer.parseInt(pageSize));
		}else {
			page.setPageSize(5);
		}*/
		page.setPageSize(2);
		/*设置总记录数*/
		page.setTotalCount(totalCount);
		/*获取总页数*/
		int totalPage = page.getTotalPage();
		/*首尾页控制*/
		if (currentPageNo < 1) {
			currentPageNo = 1;
		}else if (currentPageNo > page.getTotalPage()) {
			currentPageNo = totalPage;
		}
		/*设置当前页的页码*/
		page.setCurrentPage(currentPageNo);
		List<Record> records = service.getRecordCurrentPage(page.getCurrentPage(),page.getPageSize(),arrivalTime,username);
		page.setRecords(records);
		page.setUsername(username);
		System.out.println(records.toString());
		/*list对象放入request作用域中*/
		request.setAttribute("page",page);
		/*请求转发*/
		request.getRequestDispatcher("record_details.jsp").forward(request, response);
	}

}
