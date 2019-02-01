package pers.lqresier.picc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.condition.UserCondition;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.mapper.UserMapper;
import pers.lqresier.picc.service.UserService;

import java.util.List;

@Transactional
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@SuppressWarnings("unchecked")
	@Override
	public User login(String username, String password) throws Exception{
		UserCondition userCondition = new UserCondition();
		userCondition.setUsername(username);
		userCondition.setPassword(password);
		userCondition.setStatus(1);//启用中
		List<User> list =userMapper.queryByCondition(userCondition);
		if (list == null || list.size() == 0) {
			return null;
		}
		return list.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryUserByUserCondition(UserCondition userCondition) throws Exception{
		List<User> list=userMapper.queryByCondition(userCondition);
		if(list==null||list.size()==0){
			return null;
		}
		return list;
	}

	@Override
	public boolean addUser(User user) throws Exception{
		userMapper.add(user);
		return true;
	}

	@Override
	public boolean updateUser(User user) throws Exception{
		userMapper.update(user);
		return true;
	}

	@Override
	public boolean deleteUser(User user) throws Exception{
		// 状态设为停用0
		user.setStatus(0);
		userMapper.update(user);
		return true;
	}

	@Override
	public User queryUserById(Integer userId) throws Exception{
		User user=new User();
		user.setId(userId);
		User result =userMapper.query(user);
		return result;
	}

	@Override
	public boolean isUsernameExist(String username,Integer id) throws Exception{
		Integer count=userMapper.getCountByUserName(username,id);
		if(count==null||count==0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean openUser(User user) throws Exception{
		user.setStatus(1);
		userMapper.update(user);
		return true;
	}

}
