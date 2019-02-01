package pers.lqresier.picc.condition;

import java.sql.Timestamp;

/**
 * 日志条件类
 * @author Administrator
 *
 */
public class LogCondition implements Condition{
	private String userName=null;//用户名字
	private String operationModel=null;//操作模块
	private String operationType=null;//操作类型
	private Timestamp beginTime=null;//起始时间
	private Timestamp endTime=null;//结束时间
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getOperationModel() {
		return operationModel;
	}
	public void setOperationModel(String operationModel) {
		this.operationModel = operationModel;
	}
	public String getOperationType() {
		return operationType;
	}
	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}
	public Timestamp getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
}
