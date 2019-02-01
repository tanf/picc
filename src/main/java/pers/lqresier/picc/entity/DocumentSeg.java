package pers.lqresier.picc.entity;

import java.sql.Timestamp;

/**
 * 单证号段类
 * @author Administrator
 *
 */
public class DocumentSeg{
	private Integer id=null;//单证号段主键
	private String documentCode=null;//单证识别码
	private String beginNum=null;//起始单证码
	private String endNum=null;//结束单证码
	private String allotNum=null;//已分配号段
	/**
	 * 是否分配完毕
	 * 0:未分配完
	 * 1:已分配完
	 */
	private Integer status=null;//是否分配完毕
	private Timestamp createTime=null;//分发时间
	private User allocator=null;//分发员
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDocumentCode() {
		return documentCode;
	}
	public void setDocumentCode(String documentCode) {
		this.documentCode = documentCode;
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
	public String getAllotNum() {
		return allotNum;
	}
	public void setAllotNum(String allotNum) {
		this.allotNum = allotNum;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public User getAllocator() {
		return allocator;
	}
	public void setAllocator(User allocator) {
		this.allocator = allocator;
	}
	
}
