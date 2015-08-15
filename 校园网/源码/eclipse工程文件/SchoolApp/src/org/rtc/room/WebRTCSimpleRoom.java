package org.rtc.room;

import org.apache.commons.lang.StringUtils;

public class WebRTCSimpleRoom {

	private String key;

	private String user1;

	private String user2;
	
	public WebRTCSimpleRoom(){
		
	}
	
	public WebRTCSimpleRoom(String key,String user1){
		this.key = key;
		this.user1 = user1;
	}

	/**
	 * @return the key
	 */
	public String getKey() {
		return key;
	}

	/**
	 * @param key
	 *            the key to set
	 */
	public void setKey(String key) {
		this.key = key;
	}

	public String getUser1() {
		return user1;
	}

	public void setUser1(String user1) {
		this.user1 = user1;
	}

	public String getUser2() {
		return user2;
	}

	public void setUser2(String user2) {
		this.user2 = user2;
	}

	public void addUser(String user) {
		if (StringUtils.isEmpty(user1)) {
			this.setUser1(user);
		} else if (StringUtils.isEmpty(user2)) {
			this.setUser2(user);
		}
	}

	public void removeUser(String user) {
		if (StringUtils.isNotEmpty(user1)) {
			if (user1.equals(user)) {
				this.setUser1(null);
			}
		} else if (StringUtils.isNotEmpty(user2)) {
			if (user2.equals(user)) {
				this.setUser2(null);
			}
		}
	}

	public boolean haveUser() {
		return !(this.getUser1() == null && this.getUser2() == null);
	}
	
	public String getOtherUser(String user){
		if(user.equals(user1)){
			return user2;
		}else{
			return user1;
		}
	}
}
