package cn.edu.jxau.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.jxau.Bean.Mymatch;
import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DAO.AdminDAO;
import cn.edu.jxau.DAO.MatchlistDAO;
import cn.edu.jxau.DAO.UserDAO;

public class LoginServlet extends HttpServlet { // 登入判断的Servlet

	String path = "main.jsp";
	User user = null;
	String username;
	String password;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		if(application.getAttribute("MettingMap") == null) {
			Map<String,String> map = new HashMap<String,String>();
			application.setAttribute("MettingMap", map);
		}
		List<Mymatch> list = MatchlistDAO.getall();
		HttpSession session = request.getSession();
		response.setCharacterEncoding("gbk");
		int login = 0; // 初始登入条件
		String str = "";
		username = request.getParameter("username"); // 取得用户名
		password = request.getParameter("password"); // 取得密码
		if (username == null || username.equals("") || password == null
				|| password.equals("")) { // 输入判断是否为空
			str = "用户名或密码不能为空";
		} else {
			if (UserDAO.isUser(username, password)) { // 判断是否是用户
				str = "欢迎" + username + "用户"; // 添加登入字符串
				login = 1; // 更改登入的条件
			} else if (AdminDAO.isAdmin(username, password)) { // 判断是否是管理员
				str = "欢迎" + username + "管理员"; // 添加登入字符串
				login = 2; // 更改登入的条件
			} else {
				str = "用户名或密码错误"; // 数据库中没有admin和user的用户数据
			}
		}
		
		if (login == 0) {
			session.setAttribute("login", str);
			response.sendRedirect("login.jsp");
		}

		if (login == 1) {
			user = UserDAO.getUser(username, password);
			session.setAttribute("login", "User");
			request.setAttribute("str", str);
			session.setAttribute("Userinfo", user);
			request.setAttribute("info", list);
			request.getRequestDispatcher(path).forward(request, response);
		}
//		if (login == 2) {
//			session.setAttribute("login", "Admin");
//			request.setAttribute("str", str);
//			request.getRequestDispatcher(path2).forward(request, response);
//			
//		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
