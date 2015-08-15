package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Majordis;
import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DAO.MajordisDAO;
import cn.edu.jxau.DAO.UserDAO;

public class MajoreditorServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		Majordis majordis = new Majordis();
		majordis.setId(Integer.parseInt(request.getParameter("insititute")));
		majordis.setTitle(request.getParameter("title"));
		majordis.setText(request.getParameter("content"));
		User user = UserDAO.getUser(request.getParameter("id"));
		majordis.setAuthor(user.getNickname());
		MajordisDAO.setMajordis(majordis);
		request.setAttribute("Userinfo", user);
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
