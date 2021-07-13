package hotel.refund.domain;

import java.sql.Date;
import java.util.List;

import hotel.reservation.domain.Reservation;

public class Refund {
	private int refundNum;
	private String refundAccountNum;
	private String refundContent;
	private int refundPrice;
	private Date refundDate;
	private String userId;
	private int resNum;
	private String refundStatus;
	
	private int roomNum;
	private int resPernum;
	private int resPrice;
	private List<Reservation> reservations;
	
	public int getRefundNum() {
		return refundNum;
	}
	
	public void setRefundNum(int refundNum) {
		this.refundNum = refundNum;
	}
	
	public String getRefundAccountNum() {
		return refundAccountNum;
	}
	
	public void setRefundAccountNum(String refundAccountNum) {
		this.refundAccountNum = refundAccountNum;
	}
	
	public String getRefundContent() {
		return refundContent;
	}
	
	public void setRefundContent(String refundContent) {
		this.refundContent = refundContent;
	}
	
	public int getRefundPrice() {
		return refundPrice;
	}
	
	public void setRefundPrice(int refundPrice) {
		this.refundPrice = refundPrice;
	}
	
	public Date getRefundDate() {
		return refundDate;
	}
	
	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getResNum() {
		return resNum;
	}
	
	public void setResNum(int resNum) {
		this.resNum = resNum;
	}

	public String getRefundStatus() {
		return refundStatus;
	}

	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}

	public List<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public int getResPernum() {
		return resPernum;
	}

	public void setResPernum(int resPernum) {
		this.resPernum = resPernum;
	}

	public int getResPrice() {
		return resPrice;
	}

	public void setResPrice(int resPrice) {
		this.resPrice = resPrice;
	}
}
