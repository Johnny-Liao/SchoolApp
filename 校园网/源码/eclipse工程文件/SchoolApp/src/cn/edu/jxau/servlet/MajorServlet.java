package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.DAO.MajorDAO;
import cn.edu.jxau.DAO.ToolsDAO;

public class MajorServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String major = request.getParameter("major");
		String sid = request.getParameter("sid");
		
		if(id != null && !id.equals("")) {
			List<String> list = ToolsDAO.getInfo("major",id,"majorname");
			request.setAttribute("listinfo", list);
			request.getRequestDispatcher("/liebiao/liebiao.jsp").forward(request, response);
		}
		
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
