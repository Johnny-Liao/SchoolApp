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

public class LoginServlet extends HttpServlet { // �����жϵ�Servlet

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
		int login = 0; // ��ʼ��������
		String str = "";
		username = request.getParameter("username"); // ȡ���û���
		password = request.getParameter("password"); // ȡ������
		if (username == null || username.equals("") || password == null
				|| password.equals("")) { // �����ж��Ƿ�Ϊ��
			str = "�û��������벻��Ϊ��";
		} else {
			if (UserDAO.isUser(username, password)) { // �ж��Ƿ����û�
				str = "��ӭ" + username + "�û�"; // ��ӵ����ַ���
				login = 1; // ���ĵ��������
			} else if (AdminDAO.isAdmin(username, password)) { // �ж��Ƿ��ǹ���Ա
				str = "��ӭ" + username + "����Ա"; // ��ӵ����ַ���
				login = 2; // ���ĵ��������
			} else {
				str = "�û������������"; // ���ݿ���û��admin��user���û�����
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
