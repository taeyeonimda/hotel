package kimkwangsoo.hotel.reservation.dao.map;

import java.util.List;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.reservation.domain.Reservation;

public interface ReservationMap {
	List<Reservation> getReservations(Page page);
	Reservation getReservation(int resNum);
	void addResInfo(Reservation res);
	void addResPay(Reservation res);
	void updateResStatus(Reservation res);
	int getResCnt();
}
