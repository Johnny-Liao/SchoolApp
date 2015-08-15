package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Mymatch;
import cn.edu.jxau.DAO.MatchlistDAO;

public class MatchlistServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		String id = request.getParameter("id");
		if(id != null && !id.equals("")) {
			List<Mymatch> list = MatchlistDAO.getall(id);
			request.setAttribute("matchlist", list);
			request.getRequestDispatcher("/liebiao/matchlb.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
