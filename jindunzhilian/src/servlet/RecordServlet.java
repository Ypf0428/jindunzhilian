package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;
/**
 * @author Y1041
 * */
public class RecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//按时间查询
		String username = request.getParameter("username");
		String selectWay = request.getParameter("selectway");
		String plate = request.getParameter("plate");
		String startTimeScope = request.getParameter("starttimescope");
		String endTimeScope = request.getParameter("endtimescope");
		String currentPage = request.getParameter("currentPage");
		
		
		
	}

}
