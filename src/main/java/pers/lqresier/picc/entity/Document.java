package pers.lqresier.picc.entity;

import java.sql.Timestamp;

/**
 * 单证类
 * @author Administrator
 *
 */
public class Document{
	private Integer id=null;//单证主键
	private String num=null;//单证
	/**
	 * 单证状态
	 * 0:未使用
	 * 1:已使用
	 * 2:停用
	 * 3:作废
	 * 4:丢弃
	 */
	private Integer status=null;//单证状态
	private Timestamp useTime=null;//使用时间
	private Timestamp createTime=null;//发放时间
	private String userName=null;//使用人姓名
	private String allocatorName=null;//发放员姓名
	private DocumentSeg seg=null;//单证号段
	private User user=null;//使用人
	private User allocator=null;//发放员
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Timestamp getUseTime() {
		return useTime;
	}
	public void setUseTime(Timestamp useTime) {
		this.useTime = useTime;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public DocumentSeg getSeg() {
		return seg;
	}
	public void setSeg(DocumentSeg seg) {
		this.seg = seg;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getAllocator() {
		return allocator;
	}
	public void setAllocator(User allocator) {
		this.allocator = allocator;
	}
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
	
}
