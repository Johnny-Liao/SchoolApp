package org.rtc.servlet;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.rtc.room.WebRTCRoomManager;

@WebServlet(urlPatterns = {"/room"})
public class WebRTCRoomServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String r = request.getParameter("r");
		if(StringUtils.isEmpty(r)){
			r = String.valueOf(System.currentTimeMillis());
			String password = (String)request.getSession().getAttribute("password");
			Map<String,String> map = (Map)request.getServletContext().getAttribute("MettingMap");
			map.put(r, password);
			response.sendRedirect("room?r=" + r);
		}else{
			Integer initiator = 1;
			String user = UUID.randomUUID().toString().replace("-", "");
			if(!WebRTCRoomManager.haveUser(r)){
				initiator = 0;
			}
			WebRTCRoomManager.addUser(r, user);
			String roomLink = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +  request.getContextPath() +"/room?r=" + r;
			String roomKey = r;
			request.setAttribute("initiator", initiator);
			request.setAttribute("roomLink", roomLink);
			request.setAttribute("roomKey", roomKey);
			request.setAttribute("user", user);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}
}
