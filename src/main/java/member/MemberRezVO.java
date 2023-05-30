package member;

public class MemberRezVO {
	private int idx;
	private String eventName;
	private String mid;
	private String rDate;
	private String rTime;
	private int rPeopleNum;
	private String aplDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public String getrTime() {
		return rTime;
	}
	public void setrTime(String rTime) {
		this.rTime = rTime;
	}
	public int getrPeopleNum() {
		return rPeopleNum;
	}
	public void setrPeopleNum(int rPeopleNum) {
		this.rPeopleNum = rPeopleNum;
	}
	public String getAplDate() {
		return aplDate;
	}
	public void setAplDate(String aplDate) {
		this.aplDate = aplDate;
	}
	
	@Override
	public String toString() {
		return "MemberRezVO [idx=" + idx + ", eventName=" + eventName + ", mid=" + mid + ", rDate=" + rDate + ", rTime="
				+ rTime + ", rPeopleNum=" + rPeopleNum + ", aplDate=" + aplDate + "]";
	}
}
