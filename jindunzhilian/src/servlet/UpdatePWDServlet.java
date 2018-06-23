package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import entity.User;

public class UpdatePWDServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("inputPassword_1");
		String password1 = request.getParameter("inputPassword_2");
		UserService service = new UserService();
		User user = service.findUserByusername(username);
		if(user!=null){
			if(user.getPassword().equals(password)) {
				        User user1 = new User(username,password1);
				        boolean flag = service.updateUser(user1, username);
				        if(flag == true){
				        request.setAttribute("error", "修改成功！");
						request.getRequestDispatcher("record_3.jsp").forward(request, response);
				        }else{
				        	request.setAttribute("error", "修改失败！");
							request.getRequestDispatcher("record_3.jsp").forward(request, response);
				        }
					}else {
						request.setAttribute("error", "原始密码错误，请重新输入！");
						request.getRequestDispatcher("record_3.jsp").forward(request, response);
					}
			}else{
				request.setAttribute("error", "用户不存在");
				request.getRequestDispatcher("record_3.jsp").forward(request, response);
			}
		
	}

}
