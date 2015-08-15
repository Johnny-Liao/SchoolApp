package org.rtc.websocket;

import java.io.IOException;
import java.nio.CharBuffer;
import java.util.HashMap;
import java.util.Map;

public class WebRTCMessageInboundPool {

	private static final Map<String,WebRTCMessageInbound > connections = new HashMap<String,WebRTCMessageInbound>();
	
	public static void addMessageInbound(WebRTCMessageInbound inbound){
		//添加连接
		System.out.println("user : " + inbound.getUser() + " join..");
		connections.put(inbound.getUser(), inbound);
	}
	
	public static void removeMessageInbound(WebRTCMessageInbound inbound){
		//移除连接
		System.out.println("user : " + inbound.getUser() + " exit..");
		connections.remove(inbound.getUser());
	}
	
	public static void sendMessage(String user,String message){
		try {
			//向特定的用户发送数据
			System.out.println("send message to user : " + user + " ,message content : " + message);
			WebRTCMessageInbound inbound = connections.get(user);
			if(inbound != null){
				inbound.getWsOutbound().writeTextMessage(CharBuffer.wrap(message));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
