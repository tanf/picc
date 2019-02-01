package pers.lqresier.picc.condition;

import java.sql.Timestamp;

/**
 * 单证条件类
 * @author Administrator
 *
 */
public class DocumentCondition implements Condition{
	private String userName=null;//出单员姓名
	private String allocatorName=null;//发放员姓名
	/**
	 * 状态
	 * 0:使用中
	 * 1:使用完
	 */
	private Integer status=null;//状态
	private Timestamp beginTime=null;//起始时间
	private Timestamp endTime=null;//结束时间
	private String beginNum=null;//起始号段
	private String endNum=null;//结束号段
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAllocatorName() {
		return allocatorName;
	}
	public void setAllocatorName(String allocatorName) {
		this.allocatorName = allocatorName;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
	public String getBeginNum() {
		return beginNum;
	}
	public void setBeginNum(String beginNum) {
		this.beginNum = beginNum;
	}
	public String getEndNum() {
		return endNum;
	}
	public void setEndNum(String endNum) {
		this.endNum = endNum;
	}
	
}
