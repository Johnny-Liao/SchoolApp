package org.rtc.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.rtc.room.WebRTCRoomManager;
import org.rtc.websocket.WebRTCMessageInboundPool;

@WebServlet(urlPatterns = {"/message"})
public class WebRTCMessageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String r = request.getParameter("r");
		String u = request.getParameter("u");
	    BufferedReader br = request.getReader();
        String line = null;
        StringBuilder sb = new StringBuilder();
        while((line = br.readLine())!=null){
            sb.append(line); 
        }
		
		String message = sb.toString();
		JSONObject json = JSONObject.fromObject(message);
		if (json != null) {
			String type = json.getString("type");
			if ("bye".equals(type)) {
				System.out.println("user :" + u + " exit..");
				WebRTCRoomManager.removeUser(r, u);
			}
		}
		String otherUser = WebRTCRoomManager.getOtherUser(r, u);
		if (u.equals(otherUser)) {
			message = message.replace("\"offer\"", "\"answer\"");
			message = message.replace("a=crypto:0 AES_CM_128_HMAC_SHA1_32",
					"a=xrypto:0 AES_CM_128_HMAC_SHA1_32");
			message = message.replace("a=ice-options:google-ice\\r\\n", "");
		}
		
		WebRTCMessageInboundPool.sendMessage(otherUser, message);
	}
}
