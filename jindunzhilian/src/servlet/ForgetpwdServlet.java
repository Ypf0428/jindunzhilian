package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import entity.User;

public class ForgetpwdServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		String repassword = request.getParameter("repwd");
		
		//无法更新，null
		//jsp里的input标签里没name属性
		User user = new User(username,repassword);
//		user.setUsername(username);
//		user.setPassword(repassword);
		
		UserDao userdao = new UserDao();
		userdao.updateUser(user, username);
		
		request.getRequestDispatcher("logoin.jsp").forward(request, response);
	}

}
