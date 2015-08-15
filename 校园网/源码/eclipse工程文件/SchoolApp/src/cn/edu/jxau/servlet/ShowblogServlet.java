package cn.edu.jxau.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Blog;
import cn.edu.jxau.Bean.Mydiscuss;
import cn.edu.jxau.DAO.BlogDAO;
import cn.edu.jxau.DAO.MydiscussDAO;

public class ShowblogServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		Blog blog = BlogDAO.getBlog(id);
		List<Mydiscuss> list = MydiscussDAO.getMd(id);
		request.setAttribute("blog", blog);
		request.setAttribute("bloglist", list);
		request.getRequestDispatcher("showblog.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
