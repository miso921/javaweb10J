package manager;

public class ManagerVO {
	private int idx;
	private String eventName;
	private String eTime;
	private int ticketNum;
	private String place;
	private String target;
	private int people;
	private int money;
	private String part;
	private String thumbnail;
	private String detail;
	private String road;
	
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
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public int getTicketNum() {
		return ticketNum;
	}
	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getRoad() {
		return road;
	}
	public void setRoad(String road) {
		this.road = road;
	}
	
	@Override
	public String toString() {
		return "ManagerVO [idx=" + idx + ", eventName=" + eventName + ", eTime=" + eTime + ", ticketNum=" + ticketNum
				+ ", place=" + place + ", target=" + target + ", people=" + people + ", money=" + money + ", part=" + part
				+ ", thumbnail=" + thumbnail + ", detail=" + detail + ", road=" + road + "]";
	}
}
