package hotel.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotel.common.domain.Page;
import hotel.reservation.dao.ReservationDao;
import hotel.reservation.domain.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDao resDao;
	
	@Override
	public List<Reservation> listReservations(Page page) {
		return resDao.getReservations(page);
	}
	
	@Override
	public int getResCnt() {
		return resDao.getResCnt();
	}
	
	@Override
	public Reservation displayReservation(int resNum) {
		return resDao.getReservation(resNum);
	}
	
	@Override
	public void registerResInfo(Reservation res) {
		resDao.addResInfo(res);
	}

	@Override
	public void registerResPay(Reservation res) {
		resDao.addResPay(res);
	}

	@Override
	public void updateResStatus(Reservation res) {
		resDao.updateResStatus(res);
	}
}
