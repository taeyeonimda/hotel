package kimkwangsoo.hotel.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.user.dao.UserDao;
import kimkwangsoo.hotel.user.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;
	
	public List<User>getUsers(Page page){
		return userDao.getUsers(page);
	}
	
	public User getUser(String userId) {
		return userDao.getUser(userId);
	}
	
	public User loginUser(User user) {
		return userDao.loginUser(user);
	}
	
	public void addUser(User user) {
		userDao.addUser(user);
	}	
	
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	
	public void deleteUser(User user) {
		userDao.deleteUser(user);
	}

	@Override
	public User chkEmail(String userEmail) {
		return userDao.chkEmail(userEmail);
	}

	@Override
	public User serchId(User user) {
		return userDao.serchId(user);
	}
	
	@Override
	public User serchPw(User user) {
		return userDao.serchPw(user);
	}

	@Override
	public int getUsersCnt() {
		return userDao.getUsersCnt();
	}

	@Override
	public int todayCnt() {
		return userDao.todayCnt();
	}
}
