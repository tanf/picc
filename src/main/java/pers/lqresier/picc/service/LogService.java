package pers.lqresier.picc.service;

import pers.lqresier.picc.condition.LogCondition;
import pers.lqresier.picc.entity.Log;
import pers.lqresier.picc.entity.User;

import java.util.List;

public interface LogService extends Service{
	
	/**
	 * 根据logCondition查询日志
	 * @param logCondition
	 * @return
	 */
	List<Log> queryLogByLogCondition(LogCondition logCondition) throws Exception;
	
	/**
	 * 添加日志
	 * @param user 用户
	 * @param operationModel 操作模块
	 * @param operationType 操作类型
	 * @param desc 描述
	 */
	void addLog(User user, String operationModel, String operationType, String desc) throws Exception;
}
