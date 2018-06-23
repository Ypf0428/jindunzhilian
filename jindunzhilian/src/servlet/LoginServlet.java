package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entity.User;
import service.UserService;



public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserService us = new UserService();
		User user = us.findUserByusername(username);
		if(user!=null){
			if(user.getPassword().equals(password)) {
				        session.setAttribute("LTID", user.getLTID());
				        session.setAttribute("username", username);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}else {
						
						request.setAttribute("error", "用户名或密码错误，请重新输入！");
						request.getRequestDispatcher("logoin.jsp").forward(request, response);
					}
			}
	}

}
