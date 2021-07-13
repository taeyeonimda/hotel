package hotel.user.service;

import java.util.List;

import hotel.common.domain.Page;
import hotel.user.domain.User;

public interface UserService {
	List<User> getUsers(Page page);
	int getUsersCnt();
	int todayCnt();
	User getUser(String userId);
	User loginUser(User user);
	User chkEmail(String userEmail);//이메일 중복체크용
	void addUser(User user);
	void updateUser(User user);
	void deleteUser(User user);
	
	User serchId(User user);//아이디찾기
	User serchPw(User user);//비번찾기
}
