package hotel.refund.service;

import java.util.List;

import hotel.common.domain.Page;
import hotel.refund.domain.Refund;

public interface RefundService {
	List<Refund> listRefunds(Page page);
	Refund displayReservation(int resNum);
	Refund displayRefund(int refundNum);
	void registerRefundInfo(Refund refund);
	void updateRefundStatus(Refund refund);
	int getRefundsCnt();
}
