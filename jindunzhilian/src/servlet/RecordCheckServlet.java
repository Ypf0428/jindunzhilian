package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Record;
import service.RecordService;

public class RecordCheckServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String plate = request.getParameter("plate");
		RecordService service = new RecordService();
		List<Record> record = service.selectByPlate(plate);
		request.setAttribute("record", record);
		request.getRequestDispatcher("record_check.jsp").forward(request, response);
	}

}
