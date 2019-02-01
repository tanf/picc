package pers.lqresier.picc.service.impl;

import ch.qos.logback.core.db.dialect.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.condition.LogCondition;
import pers.lqresier.picc.entity.Log;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.mapper.LogMapper;
import pers.lqresier.picc.service.LogService;

import java.sql.Timestamp;
import java.util.List;

@Transactional
@Service
public class LogServiceImpl implements LogService {
	@Autowired
	private LogMapper logMapper;

	@SuppressWarnings("unchecked")
	@Override
	public List<Log> queryLogByLogCondition(LogCondition logCondition) throws Exception{
		List<Log> list=logMapper.queryByCondition(logCondition);
		if(list==null||list.size()==0){
			return null;
		}
		return list;
	}

	@Override
	public void addLog(User user, String operationModel, String operationType, String desc) throws Exception{
		Log log=new Log();
		log.setUser(user);
		log.setUserName(user.getName());
		log.setOperationModel(operationModel);
		log.setOperationType(operationType);
		if(desc!=null&&!"".equals(desc)) {
			log.setDesc(desc);
		}
		log.setOperationTime(new Timestamp(System.currentTimeMillis()));
		logMapper.add(log);
	}

}
