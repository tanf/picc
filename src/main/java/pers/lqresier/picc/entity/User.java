package pers.lqresier.picc.entity;

import java.sql.Timestamp;

/**
 * 用户类
 * @author Administrator
 *
 */
public class User {
	private Integer id=null;//用户id
	private String username=null;//用户名（工号）
	private String password=null;//密码
	private String name=null;//姓名
	/**
	 * 角色
	 * 0:出单人员，1:保险公司管理员，2:景区管理人员
	 */
	private Integer role=null;//角色
	private Timestamp createTime=null;//用户创建时间
	/**
	 * 用户状态
	 * 0:停用中，1:启用中
	 */
	private Integer status=null;//用户状态
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
