package pers.lqresier.picc.mapper;

import pers.lqresier.picc.condition.LogCondition;
import pers.lqresier.picc.entity.Log;

import java.util.List;

public interface LogMapper{
	
	/**
	 * 条件查询
	 * @param logCondition
	 * @return
	 */
	List<Log> queryByCondition(LogCondition logCondition);
	
	int add(Log log);//添加
}
