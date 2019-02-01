package pers.lqresier.picc.condition;

/**
 * 用户条件类
 * @author Administrator
 *
 */
public class UserCondition implements Condition{
	private String username=null;//工号(用户名)
	private String password=null;//密码
	private String name=null;//名字
	private Integer role=null;//角色
	private Integer status=null;//用户状态
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
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	
}
