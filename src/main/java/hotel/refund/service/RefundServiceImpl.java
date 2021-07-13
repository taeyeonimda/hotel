package hotel.refund.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotel.common.domain.Page;
import hotel.refund.dao.RefundDao;
import hotel.refund.domain.Refund;

@Service
public class RefundServiceImpl implements RefundService {
	@Autowired
	private RefundDao refundDao;
	
	@Override
	public List<Refund> listRefunds(Page page) {
		return refundDao.getRefunds(page);
	}
	
	@Override
	public int getRefundsCnt() {
		return refundDao.getRefundsCnt();
	}

	@Override
	public Refund displayReservation(int resNum) {
		return refundDao.getReservation(resNum);
	}
	
	@Override
	public Refund displayRefund(int refundNum) {
		return refundDao.getRefund(refundNum);
	}
	
	@Override
	public void registerRefundInfo(Refund refund) {
		refundDao.addRefundInfo(refund);
	}

	@Override
	public void updateRefundStatus(Refund refund) {
		refundDao.updateRefundStatus(refund);
	}
}
