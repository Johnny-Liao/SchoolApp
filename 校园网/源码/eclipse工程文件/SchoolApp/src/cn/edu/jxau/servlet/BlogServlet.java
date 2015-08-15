package cn.edu.jxau.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Blog;
import cn.edu.jxau.DAO.BlogDAO;

public class BlogServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Blog> list = BlogDAO.getallBlog();
		request.setAttribute("bloginfo", list);
		request.getRequestDispatcher("/liebiao/bloglb.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
