package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.User;
import cn.edu.jxau.DAO.UserDAO;

public class RegisterServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("hidd");
		if(id!= null && id.equals("1")) {
			UserDAO.delUser(request.getParameter("myusername"));
		}
		if(UserDAO.addUser(this.getUser(request))) {
			response.sendRedirect("returntrue.jsp");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public User getUser(HttpServletRequest request) {
		User user = new User();
		user.setMyusername(request.getParameter("myusername"));
		user.setPassword(request.getParameter("password"));
		user.setNickname(request.getParameter("nickname"));
		user.setPlace(request.getParameter("place"));
		user.setSex(request.getParameter("sex"));
		user.setInsititute(request.getParameter("insititute"));
		user.setMyclass(Integer.parseInt(request.getParameter("class")));
		user.setMobile(request.getParameter("mobile"));
		user.setQq(request.getParameter("qq"));
		user.setMajor(request.getParameter("major"));
		user.setBedroom(Integer.parseInt(request.getParameter("bedroom")));
		return user;
	}
}
