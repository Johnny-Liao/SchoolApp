package com.baiyang.lc.websocketservlet;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.catalina.websocket.WsOutbound;

@WebServlet("/chat")
public class ChatWebSocketServlet extends WebSocketServlet {
	private final Map<Integer, WsOutbound> map = new HashMap<Integer, WsOutbound>();

	/**
	 * 
	 */
	private static final long serialVersionUID = -1058445282919079067L;

	@Override
	protected StreamInbound createWebSocketInbound(String arg0, HttpServletRequest request) {
		return new ChatMessageInbound();
	}

	class ChatMessageInbound extends MessageInbound {

		@Override
		protected void onOpen(WsOutbound outbound) {
			map.put(outbound.hashCode(), outbound);
			super.onOpen(outbound);
		}

		@Override
		protected void onClose(int status) {
			map.remove(getWsOutbound().hashCode());
			super.onClose(status);
		}

		@Override
		protected void onBinaryMessage(ByteBuffer buffer) throws IOException {
			// TODO Auto-generated method stub

		}

		@Override
		protected void onTextMessage(CharBuffer buffer) throws IOException {
			String msg = buffer.toString();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			msg = " <font color=green>ƒ‰√˚”√ªß  " + sdf.format(date) + "</font><br/> " + msg;
			broadcast(msg);
		}

		private void broadcast(String msg) {
			Set<Integer> set = map.keySet();
			for (Integer integer : set) {
				WsOutbound outbound = map.get(integer);
				CharBuffer buffer = CharBuffer.wrap(msg);
				try {
					outbound.writeTextMessage(buffer);
					outbound.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
