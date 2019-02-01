package pers.lqresier.picc.entity;

import java.sql.Timestamp;

/**
 * 日志信息实体类
 * @author Administrator
 *
 */
public class Log {
	private Integer id=null;//日志主键
	private String userName=null;//用户名字
	private String operationModel=null;//操作模块
	/**
	 * 操作类型
	 * add：添加
	 * update：修改
	 * del：停用
	 * login：登录
	 * open：启用
	 */
	private String operationType=null;//操作类型
	private Timestamp operationTime=null;//操作时间
	private String desc=null;//描述
	private User user=null;//用户
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
	public Timestamp getOperationTime() {
		return operationTime;
	}
	public void setOperationTime(Timestamp operationTime) {
		this.operationTime = operationTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
