package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;
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
		int LTID = Integer.parseInt(request.getParameter("LTID"));
		UserService service = new UserService();
		User user = service.findUserByusername(username);
		if(user!=null){
			if(user.getLTID()==LTID) {
				        request.setAttribute("error", "您的密码是："+user.getPassword());
						request.getRequestDispatcher("logoin.jsp").forward(request, response);
					}else {
						request.setAttribute("error", "卡号错误，请重新输入！");
						request.getRequestDispatcher("forgetpwd.jsp").forward(request, response);
					}
			}else{
				request.setAttribute("error", "用户名错误或用户不存在，请重新输入！");
				request.getRequestDispatcher("forgetpwd.jsp").forward(request, response);
			}
	}

}
