package managerEventDate;

public class EventDateVO {
	private int idx;
	private String eventName;
	private String eDate;
	
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
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	
	@Override
	public String toString() {
		return "EventDateVO [idx=" + idx + ", eventName=" + eventName + ", eDate=" + eDate + "]";
	}
}
