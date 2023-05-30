package board;

public class BoardVO {
	private int idx;
	private String mid;
	private String email;
	private String title;
	private String content;
	private String hostIp;
	private String wDate;
	private String openInfo;
	
	private int hour_diff;
	private int day_diff;
	
	private int replyCount;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getOpenInfo() {
		return openInfo;
	}
	public void setOpenInfo(String openInfo) {
		this.openInfo = openInfo;
	}
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
	public int getDay_diff() {
		return day_diff;
	}
	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", mid=" + mid + ", email=" + email + ", title=" + title + ", content=" + content
				+ ", hostIp=" + hostIp + ", wDate=" + wDate + ", openInfo=" + openInfo + ", hour_diff=" + hour_diff
				+ ", day_diff=" + day_diff + ", replyCount=" + replyCount + "]";
	}
}
