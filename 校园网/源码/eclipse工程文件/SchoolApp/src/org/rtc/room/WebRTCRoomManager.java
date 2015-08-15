package org.rtc.room;

import java.util.HashMap;
import java.util.Map;

public class WebRTCRoomManager {

	private static final Map<String,WebRTCSimpleRoom> provider = new HashMap<String,WebRTCSimpleRoom>();
	
	public static void addUser(String roomKey,String user){
		WebRTCSimpleRoom room = provider.get(roomKey);
		if(room == null){
			System.out.println("add room : " + roomKey);
			room = new WebRTCSimpleRoom(roomKey,user);
			provider.put(roomKey, room);
		}else{
			room.addUser(user);
		}
	}
	
	public static void removeUser(String roomKey,String user){
		WebRTCSimpleRoom room = provider.get(roomKey);
		if(room != null){
			System.out.println("remove user : " + user);
			room.removeUser(user);
		}
		if(!room.haveUser()){
			provider.remove(roomKey);
			System.out.println("remove room : " + roomKey);
		}
	}
	
	public static boolean haveUser(String key){
		WebRTCSimpleRoom room = provider.get(key);
		if(room != null){
			return room.haveUser();
		}else{
			return false;
		}
	}
	
	public static String getOtherUser(String roomKey,String user){
		WebRTCSimpleRoom room = provider.get(roomKey);
		return room.getOtherUser(user);

	}
}
