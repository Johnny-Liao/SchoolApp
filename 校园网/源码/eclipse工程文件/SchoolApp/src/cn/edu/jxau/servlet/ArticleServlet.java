package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Majordis;
import cn.edu.jxau.DAO.MajordisDAO;

public class ArticleServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String major = request.getParameter("title");
		major = new String(major.getBytes("ISO8859-1"),"gbk");
		Majordis majordis = MajordisDAO.getarticle(major);
		request.setAttribute("Majordis", majordis);
		request.getRequestDispatcher("majorarticle.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
