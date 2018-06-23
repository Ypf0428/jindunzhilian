package service;

import dao.UserDao;
import entity.User;

public class UserService {
	
	UserDao userdao = new UserDao();
	
	public User findUserByusername(String username) {
		return userdao.findUserByusername(username);
	}
	
	public boolean isExistByusername(String username) {
		return userdao.isExistByusername(username);
	}
	
	public boolean updateUser(User user,String username) {
		return userdao.updateUser(user, username);
	}
	public boolean addUser(User user){
		return userdao.addUser(user);
	}
	
}
