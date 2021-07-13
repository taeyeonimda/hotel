package kimkwangsoo.hotel.room.domain;

public class Room extends RoomType{
	private int roomNum;
	private String roomResStatus;
	private String roomStatus;
	private String roomType;
	
	public Room() {}
	
	public Room(int roomNum, String roomResStatus, String roomStatus, String roomType) {
		this.roomNum = roomNum;
		this.roomResStatus = roomResStatus;
		this.roomStatus = roomStatus;
		this.roomType = roomType;
	}
	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public String getRoomResStatus() {
		return roomResStatus;
	}

	public void setRoomResStatus(String roomResStatus) {
		this.roomResStatus = roomResStatus;
	}

	public String getRoomStatus() {
		return roomStatus;
	}

	public void setRoomStatus(String roomStatus) {
		this.roomStatus = roomStatus;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	@Override
	public String toString() {
		return roomNum + roomResStatus + roomStatus + roomType; 
	}

	
}
