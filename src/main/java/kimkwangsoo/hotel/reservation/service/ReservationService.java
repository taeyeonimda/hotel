package kimkwangsoo.hotel.reservation.service;

import java.util.List;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.reservation.domain.Reservation;

public interface ReservationService {
	List<Reservation> listReservations(Page page);
	Reservation displayReservation(int resNum);
	void registerResInfo(Reservation res);
	void registerResPay(Reservation res);
	void updateResStatus(Reservation res);
	int getResCnt();
}
