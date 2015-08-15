package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Myorgan;
import cn.edu.jxau.DAO.OrganizationDAO;

public class JoinorganServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		Myorgan organ = new Myorgan();
		organ.setMyaccount(request.getParameter("myaccount"));
		organ.setMyappraise(request.getParameter("myappraise"));
		organ.setMybedroom(Integer.parseInt(request.getParameter("mybedroom")));
		organ.setMyclass(Integer.parseInt(request.getParameter("myclass")));
		organ.setMyinsititute(request.getParameter("myinsititute"));
		organ.setMyname(request.getParameter("myname"));
		organ.setMyqq(request.getParameter("myqq"));
		organ.setMysex(request.getParameter("mysex"));
		organ.setMytel(request.getParameter("mytel"));
		organ.setOrgan(Integer.parseInt(request.getParameter("organid")));
		OrganizationDAO.setMyorgan(organ);
		response.sendRedirect("index.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
