package kimkwangsoo.hotel.reservation.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.reservation.dao.map.ReservationMap;
import kimkwangsoo.hotel.reservation.domain.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	@Autowired
	private ReservationMap resMap;
	
	@Override
	public List<Reservation> getReservations(Page page) {
		return resMap.getReservations(page);
	}
	
	@Override
	public int getResCnt() {
		return resMap.getResCnt();
	}
	
	@Override
	public Reservation getReservation(int resNum) {
		return resMap.getReservation(resNum);
	}
	
	@Override
	public void addResInfo(Reservation res) {
		resMap.addResInfo(res);
	}

	@Override
	public void addResPay(Reservation res) {
		resMap.addResPay(res);
	}

	@Override
	public void updateResStatus(Reservation res) {
		resMap.updateResStatus(res);
	}
}
