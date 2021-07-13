package kimkwangsoo.hotel.refund.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.refund.dao.map.RefundMap;
import kimkwangsoo.hotel.refund.domain.Refund;

@Repository
public class RefundDaoImpl implements RefundDao {
	@Autowired
	private RefundMap refundMap;
	
	@Override
	public List<Refund> getRefunds(Page page) {
		return refundMap.getRefunds(page);
	}
	
	@Override
	public int getRefundsCnt() {
		return refundMap.getRefundsCnt();
	}

	@Override
	public Refund getReservation(int resNum) {
		return refundMap.getReservation(resNum);
	}
	
	@Override
	public Refund getRefund(int refundNum) {
		return refundMap.getRefund(refundNum);
	}
	
	@Override
	public void addRefundInfo(Refund refund) {
		refundMap.addRefundInfo(refund);
	}

	@Override
	public void updateRefundStatus(Refund refund) {
		refundMap.updateRefundStatus(refund);
	}
}
