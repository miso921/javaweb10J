package manager;

public class ManagerVO {
	private int idx;
	private String part;
	private String eventName;
	private String eTime;
	private String people;
	private String place;
	private String target;
	private String money;
	private String photo;
	
	private String eDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
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
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
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
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	
	@Override
	public String toString() {
		return "ManagerVO [idx=" + idx + ", part=" + part + ", eventName=" + eventName + ", eTime=" + eTime + ", people="
				+ people + ", place=" + place + ", target=" + target + ", money=" + money + ", photo=" + photo + ", eDate="
				+ eDate + "]";
	}
	
}
