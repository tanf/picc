package pers.lqresier.picc.service;

import pers.lqresier.picc.condition.UserCondition;
import pers.lqresier.picc.entity.User;

import java.util.List;

public interface UserService extends Service{
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @return 用户对象
	 */
	User login(String username, String password) throws Exception;

	/**
	 * 通过UserCondition查询User
	 * @param userCondition
	 * @return
	 */
	List<User> queryUserByUserCondition(UserCondition userCondition) throws Exception;
	
	/**
	 * 添加User
	 * @param user
	 * @return
	 */
	boolean addUser(User user) throws Exception;
	
	/**
	 * 修改User
	 * @param user
	 * @return
	 */
	boolean updateUser(User user) throws Exception;
	
	/**
	 * 删除User
	 * 把userStatus置为0
	 * 调用update，不是真正意义上的删除
	 * @param user
	 * @return
	 */
	boolean deleteUser(User user) throws Exception;

	/**
	 * 通过id查询用户
	 * @param userId
	 * @return
	 */
	User queryUserById(Integer userId) throws Exception;

	/**
	 * 判断该用户名是否存在
	 * @param username
	 * @param id
	 * @return
	 */
	boolean isUsernameExist(String username, Integer id) throws Exception;

	/**
	 * 启用用户
	 * 把userStatus置为1
	 * @param user
	 * @return
	 */
	boolean openUser(User user) throws Exception;
}
