package pers.lqresier.picc.mapper;

import pers.lqresier.picc.condition.UserCondition;
import pers.lqresier.picc.entity.User;

import java.util.List;

public interface UserMapper{
	
	List<User> queryByCondition(UserCondition userCondition);//条件查询

	/**
	 * 通过姓名查询用户个数
	 */
	Integer getCountByUserName(String username,Integer id);

	User query(User user);//主键查询

	int add(User user);//添加

	int update(User user);//修改
}
