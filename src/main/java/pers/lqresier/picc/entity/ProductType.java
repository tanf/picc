package pers.lqresier.picc.entity;

/**
 * 险种类
 * @author Administrator
 *
 */
public class ProductType {
	private Integer id=null;//险种主键
	private String name=null;//险种名
	private String code=null;//险种编号
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
