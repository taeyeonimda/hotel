package kimkwangsoo.hotel.user.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.user.dao.map.UserMap;
import kimkwangsoo.hotel.user.domain.User;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired private UserMap userMap;

	public List<User> getUsers(Page page){
		return userMap.getUsers(page);
	}
	
	public User getUser(String userId) {
		return userMap.getUser(userId);
	}

	public User loginUser(User user) {
		return userMap.loginUser(user);
	}
	
	public void addUser(User user) {
		userMap.addUser(user);
	}
	
	public void updateUser(User user) {
		userMap.updateUser(user);
	}
	
	public void deleteUser(User user) {
		userMap.deleteUser(user);
	}

	@Override
	public User chkEmail(String userEmail) {
		return userMap.chkEmail(userEmail);
	}

	@Override
	public User serchId(User user) {
		return	userMap.serchId(user);
	}
	
	@Override
	public User serchPw(User user) {
		return userMap.serchPw(user);
	}

	@Override
	public int getUsersCnt() {
		return userMap.getUsersCnt();
	}

	@Override
	public int todayCnt() {
		return userMap.todayCnt();
	}
}
