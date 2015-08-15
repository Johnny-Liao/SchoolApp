package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Organization;
import cn.edu.jxau.DAO.OrganizationDAO;
import cn.edu.jxau.DAO.ToolsDAO;

public class OrganServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		if(id != null && !id.equals("")) {
			List<String> list = OrganizationDAO.getInfo(id);
			request.setAttribute("Organization", list);
			request.getRequestDispatcher("/liebiao/organlb.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
	