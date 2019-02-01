package pers.lqresier.picc.condition;

import java.sql.Timestamp;

/**
 * 单证号段条件类
 * @author Administrator
 *
 */
public class DocumentSegCondition implements Condition{
	private Integer status=null;//状态
	private Timestamp beginTime=null;//起始时间
	private Timestamp endTime=null;//结束时间
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
	
}
