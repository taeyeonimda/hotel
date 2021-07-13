package kimkwangsoo.hotel.user.service;

import kimkwangsoo.hotel.user.domain.User;

public interface MailService {
	void send(User user,String userEmail);
}
