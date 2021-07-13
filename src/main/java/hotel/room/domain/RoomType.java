package hotel.room.domain;

public class RoomType {
	private String roomType;
	private String roomInfo;
	private String roomBed;
	private String roomPerCnt;
	private int roomPrice;
	private String attachName1;
	private String attachName2;
	private String attachName3;
	
	public RoomType() {}
	
	public RoomType(String roomType, String roomInfo, String roomBed, String roomPerCnt, int roomPrice,
			String attachName1, String attachName2, String attachName3) {
		this.roomType = roomType;
		this.roomInfo = roomInfo;
		this.roomBed = roomBed;
		this.roomPerCnt = roomPerCnt;
		this.roomPrice = roomPrice;
		this.attachName1 = attachName1;
		this.attachName2 = attachName2;
		this.attachName3 = attachName3;
	}
	
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getRoomInfo() {
		return roomInfo;
	}
	public void setRoomInfo(String roomInfo) {
		this.roomInfo = roomInfo;
	}
	public String getRoomBed() {
		return roomBed;
	}
	public void setRoomBed(String roomBed) {
		this.roomBed = roomBed;
	}
	public String getRoomPerCnt() {
		return roomPerCnt;
	}
	public void setRoomPerCnt(String roomPerCnt) {
		this.roomPerCnt = roomPerCnt;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	
	public String getAttachName1() {
		return attachName1;
	}
	public void setAttachName1(String attachName1) {
		this.attachName1 = attachName1;
	}
	public String getAttachName2() {
		return attachName2;
	}
	public void setAttachName2(String attachName2) {
		this.attachName2 = attachName2;
	}
	public String getAttachName3() {
		return attachName3;
	}
	public void setAttachName3(String attachName3) {
		this.attachName3 = attachName3;
	}
	
	@Override
	public String toString() {
		return "RoomType [roomType=" + roomType + ", roomInfo=" + roomInfo + ", roomBed=" + roomBed + ", roomPerCnt="
				+ roomPerCnt + ", roomPrice=" + roomPrice + ", attachName1=" + attachName1 + ", attachName2="
				+ attachName2 + ", attachName3=" + attachName3 + "]";
	}
}
