package pers.lqresier.picc.entity;

import java.sql.Date;

/**
 * 保险人类
 * @author Administrator
 *
 */
public class Insurer {
	private Integer id=null;//保险人主键
	private String cardType=null;//证件类型
	private String cardCode=null;//证件号
	private String name=null;//姓名
	private String phone=null;//电话
	private String address=null;//住址
	private Date birthday=null;//生日
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardCode() {
		return cardCode;
	}
	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
}
