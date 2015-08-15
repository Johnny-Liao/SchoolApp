package cn.edu.jxau.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.jxau.Bean.Houseinfo;
import cn.edu.jxau.DAO.HouseDAO;

public class HouseServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		String house = request.getParameter("house");
		if(house != null && !house.equals("")) {
		List<Houseinfo> list = HouseDAO.getHouseInfo(house);
		request.setAttribute("houseinfo", list);
		request.getRequestDispatcher("/liebiao/houselb.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}
