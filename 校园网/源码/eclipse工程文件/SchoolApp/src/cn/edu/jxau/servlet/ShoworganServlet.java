package cn.edu.jxau.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Myorgan;
import cn.edu.jxau.Bean.Organization;
import cn.edu.jxau.DAO.MyorganDAO;
import cn.edu.jxau.DAO.OrganizationDAO;

public class ShoworganServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("gbk");
		String id = request.getParameter("id");
		Organization listinfo = OrganizationDAO.getOrgan(id);
		List<Myorgan> listorgan = MyorganDAO.getall(id);
		request.setAttribute("organshow", listinfo);
		request.setAttribute("showorgan", listorgan);
		request.getRequestDispatcher("organshow.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
