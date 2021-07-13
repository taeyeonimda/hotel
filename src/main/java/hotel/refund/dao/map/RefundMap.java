package hotel.refund.dao.map;

import java.util.List;

import hotel.common.domain.Page;
import hotel.refund.domain.Refund;

public interface RefundMap {
	List<Refund> getRefunds(Page page);
	Refund getReservation(int resNum);
	Refund getRefund(int refundNum);
	void addRefundInfo(Refund refund);
	void updateRefundStatus(Refund refund);
	int getRefundsCnt();
}
