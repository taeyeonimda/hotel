package hotel.reservation.domain;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("reservation")
public class Reservation {
	private String resNum;
	private String resPername;
	private String resPernum;
	private Date resDate;
	private String resTel;
	private String resEmail;
	private Date resChkin;
	private Date resChkout;
	private String resStatus;
	private String resPay;
	private int resPrice;
	private int roomNum;
	private String userId;
	
	public String getResNum() {
		return resNum;
	}
	
	public void setResNum(String resNum) {
		this.resNum = resNum;
	}
	
	public String getResPername() {
		return resPername;
	}
	
	public void setResPername(String resPername) {
		this.resPername = resPername;
	}
	
	public String getResPernum() {
		return resPernum;
	}
	
	public void setResPernum(String resPernum) {
		this.resPernum = resPernum;
	}
	
	public Date getResDate() {
		return resDate;
	}
	
	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}
	
	public String getResTel() {
		return resTel;
	}
	
	public void setResTel(String resTel) {
		this.resTel = resTel;
	}
	
	public String getResEmail() {
		return resEmail;
	}
	
	public void setResEmail(String resEmail) {
		this.resEmail = resEmail;
	}
	
	public Date getResChkin() {
		return resChkin;
	}
	
	public void setResChkin(Date resChkin) {
		this.resChkin = resChkin;
	}
	
	public Date getResChkout() {
		return resChkout;
	}
	
	public void setResChkout(Date resChkout) {
		this.resChkout = resChkout;
	}
	
	public String getResStatus() {
		return resStatus;
	}
	
	public void setResStatus(String resStatus) {
		this.resStatus = resStatus;
	}
	
	public String getResPay() {
		return resPay;
	}
	
	public void setResPay(String resPay) {
		this.resPay = resPay;
	}
	
	public int getResPrice() {
		return resPrice;
	}
	
	public void setResPrice(int resPrice) {
		this.resPrice = resPrice;
	}
	
	public int getRoomNum() {
		return roomNum;
	}
	
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
