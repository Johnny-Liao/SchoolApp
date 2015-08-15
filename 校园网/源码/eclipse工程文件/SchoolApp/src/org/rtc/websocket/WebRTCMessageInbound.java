package org.rtc.websocket;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.WsOutbound;

public class WebRTCMessageInbound extends MessageInbound {

    private final String user;

    public WebRTCMessageInbound(String user) {
        this.user = user;
    }
    
    public String getUser(){
    	return this.user;
    }

    @Override
    protected void onOpen(WsOutbound outbound) {
    	//触发连接事件，在连接池中添加连接
    	WebRTCMessageInboundPool.addMessageInbound(this);
    }

    @Override
    protected void onClose(int status) {
    	//触发关闭事件，在连接池中移除连接
    	WebRTCMessageInboundPool.removeMessageInbound(this);
    }

    @Override
    protected void onBinaryMessage(ByteBuffer message) throws IOException {
        throw new UnsupportedOperationException(
                "Binary message not supported.");
    }

    @Override
    protected void onTextMessage(CharBuffer message) throws IOException {
    	
    }
}
