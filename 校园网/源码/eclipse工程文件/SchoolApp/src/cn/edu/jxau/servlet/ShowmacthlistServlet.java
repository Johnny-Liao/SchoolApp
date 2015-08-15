package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Mymatch;
import cn.edu.jxau.DAO.MatchlistDAO;

public class ShowmacthlistServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		Mymatch mymatch = MatchlistDAO.getMatch(id);
		request.setAttribute("mymatch", mymatch);
		request.getRequestDispatcher("matchshow.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
