package cn.edu.jxau.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Major;
import cn.edu.jxau.DAO.MajorDAO;
import cn.edu.jxau.DAO.MajordisDAO;

public class ConcreteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String insititute = request.getParameter("insititute");				
		insititute = new String(insititute.getBytes("ISO-8859-1"),"UTF-8");
		Major major = MajorDAO.getMajor(insititute);
		List<String> list = MajordisDAO.getDis(major.getId());
		
		request.setAttribute("list", list);
		request.setAttribute("majorinfo", major);

		request.getRequestDispatcher("Show.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
