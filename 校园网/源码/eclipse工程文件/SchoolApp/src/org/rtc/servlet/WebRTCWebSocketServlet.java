package org.rtc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.rtc.websocket.WebRTCMessageInbound;

@WebServlet(urlPatterns = { "/websocket"})
public class WebRTCWebSocketServlet extends WebSocketServlet {

	private static final long serialVersionUID = 1L;

	private String user;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.user = request.getParameter("u");
		super.doGet(request, response);
	}

    @Override
    protected StreamInbound createWebSocketInbound(String subProtocol,HttpServletRequest request) {
        return new WebRTCMessageInbound(user);
    }
}
