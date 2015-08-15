package cn.edu.jxau.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Matchlist;
import cn.edu.jxau.DAO.MatchlistDAO;

public class JoinmatchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		Matchlist matchlist = new Matchlist();
		matchlist.setMatchtype(Integer.parseInt(request.getParameter("matchid")));
		matchlist.setPerson1(request.getParameter("person1"));
		matchlist.setPerson2(request.getParameter("person2"));
		matchlist.setPerson3(request.getParameter("person3"));
		matchlist.setPerson4(request.getParameter("person4"));
		matchlist.setTel(request.getParameter("tel"));
		matchlist.setPerson5(request.getParameter("person5"));
		matchlist.setTitle(request.getParameter("title"));
		matchlist.setInsititute(request.getParameter("insititute"));
		matchlist.setOurwork(request.getParameter("ourwork"));
		matchlist.setTeacher(request.getParameter("teacher"));
		matchlist.setRemarks(request.getParameter("remarks"));
		MatchlistDAO.setMatchlist(matchlist);
		response.sendRedirect("index.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
