package hotel.reservation.service;

import java.util.List;

import hotel.common.domain.Page;
import hotel.reservation.domain.Reservation;

public interface ReservationService {
	List<Reservation> listReservations(Page page);
	Reservation displayReservation(int resNum);
	void registerResInfo(Reservation res);
	void registerResPay(Reservation res);
	void updateResStatus(Reservation res);
	int getResCnt();
}
