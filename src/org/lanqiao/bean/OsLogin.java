package org.lanqiao.bean;

public class OsLogin {
	private  int osLoginId; 
	private  String loginIp;
	private  String loginInTime;
	private  String loginOutTime;
	private  int timeLong;
	private  Os  os;
	
	public OsLogin(){
		super();
	}
	
	public int getOsLoginId() {
		return osLoginId;
	}

	public void setOsLoginId(int osLoginId) {
		this.osLoginId = osLoginId;
	}

	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public String getLoginInTime() {
		return loginInTime;
	}
	public void setLoginInTime(String loginInTime) {
		this.loginInTime = loginInTime;
	}
	public String getLoginOutTime() {
		return loginOutTime;
	}
	public void setLoginOutTime(String loginOutTime) {
		this.loginOutTime = loginOutTime;
	}
	public int getTimeLong() {
		return timeLong;
	}
	public void setTimeLong(int timeLong) {
		this.timeLong = timeLong;
	}
	public Os getOs() {
		return os;
	}
	public void setOs(Os os) {
		this.os = os;
	}

	@Override
	public String toString() {
		return "OsLogin [osLoginId=" + osLoginId + ", loginIp=" + loginIp + ", loginInTime=" + loginInTime
				+ ", loginOutTime=" + loginOutTime + ", timeLong=" + timeLong + ", os=" + os + "]";
	}

}
