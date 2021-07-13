package kimkwangsoo.hotel.user.dao;

import java.util.List;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.user.domain.User;

public interface UserDao {
	List<User> getUsers(Page page);
	int getUsersCnt();
	int todayCnt();
	User getUser(String userId);
	User loginUser(User user);
	User chkEmail(String userEmail);
	void addUser(User user);
	void updateUser(User user);
	void deleteUser(User user);
	
	User serchId(User user);
	User serchPw(User user);
}
