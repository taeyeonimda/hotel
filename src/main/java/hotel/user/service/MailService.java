package hotel.user.service;

import hotel.user.domain.User;

public interface MailService {
	void send(User user,String userEmail);
}
