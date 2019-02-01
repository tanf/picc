package pers.lqresier.picc.entity;

/**
 * 机构类
 * @author Administrator
 *
 */
public class Organization {
	private Integer id=null;//主键
	private String name=null;//机构名
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
