package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import entity.User;



public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User(username,password);
		user.setUsername(username);
		user.setPassword(password);
		UserDao userdao = new UserDao();
		List<User> list = userdao.findUser();
		for(User users:list) {
				if(user.getUsername().equals(users.getUsername())&&user.getPassword().equals(users.getPassword())) {
					request.getRequestDispatcher("record.jsp").forward(request, response);
				}else {
					//括号里的用法
					out.print("<script language='javascript'>alert('请输入正确的用户名和密码');window.location.href='logoin.jsp';</script>");
				}
		}
	}

}
