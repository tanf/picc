package pers.lqresier.picc.vo;

import java.sql.Timestamp;

/**
 * 单证展示类
 * @author Administrator
 *
 */
public class DocumentVO {
	private String userName=null;//出单员姓名
	private String allocatorName=null;//发放员姓名
	private String beginNum=null;//起始号段
	private String endNum=null;//结束号段
	private String nextNum=null;//下一个有效号段
	private Timestamp allotTime=null;//发放时间
	/**
	 * 状态
	 * 0:使用中
	 * 1：使用完
	 */
	private Integer status=null;//状态
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
	public String getNextNum() {
		return nextNum;
	}
	public void setNextNum(String nextNum) {
		this.nextNum = nextNum;
	}
	public Timestamp getAllotTime() {
		return allotTime;
	}
	public void setAllotTime(Timestamp allotTime) {
		this.allotTime = allotTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
