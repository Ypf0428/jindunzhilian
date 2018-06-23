package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.UserService;

public class EnRollServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//编码方式
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//验证码
		String piccode = (String) request.getSession().getAttribute("piccode");
		String checkcode = request.getParameter("checkcode");
		//将验证码转换为大写
		checkcode = checkcode.toUpperCase();
		PrintWriter out = response.getWriter();
		
		//接收客户输入的数据
		String userName = request.getParameter("userName");
		UserService service =new UserService();
		User user1 = service.findUserByusername(userName);
		int LTID = Integer.parseInt(request.getParameter("LTID")); 
		String passWord = request.getParameter("passWord");
		String passWord2 = request.getParameter("passWord2");
		User user = new User(userName,passWord,LTID);
		/*
		 * 用户名为空跳转至enroll.jsp
		 * 否则注册成功
		 */
			if(userName != null&&passWord.equals(passWord2)) {
				if(user1 == null) {
				//正确登陆
				boolean result = service.addUser(user);
					if(result&&checkcode.equals(piccode)) {
						request.getRequestDispatcher("logoin.jsp").forward(request, response);
					}else {
						request.setAttribute("a", "用户已存在");
						response.sendRedirect("enroll.jsp");
					}
				}else {
					request.setAttribute("a", "用户已存在");
					request.getRequestDispatcher("enroll.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("a", "输入错误");
				request.getRequestDispatcher("enroll.jsp").forward(request, response);
			}
		out.flush();
		out.close();
	}
}