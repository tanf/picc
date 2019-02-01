package pers.lqresier.picc.entity;

/**
 * 网点类
 * @author Administrator
 *
 */
public class Website {
	private Integer id=null;//网点主键
	private String marketingChannelCode=null;//销售渠道代码
	private String code=null;//网点代码
	private String name=null;//网点名称
	private String salemanPhone=null;//业务员联系方式
	private String salemanName=null;//联系人姓名
	private Organization organization=null;//机构
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMarketingChannelCode() {
		return marketingChannelCode;
	}
	public void setMarketingChannelCode(String marketingChannelCode) {
		this.marketingChannelCode = marketingChannelCode;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSalemanPhone() {
		return salemanPhone;
	}
	public void setSalemanPhone(String salemanPhone) {
		this.salemanPhone = salemanPhone;
	}
	public String getSalemanName() {
		return salemanName;
	}
	public void setSalemanName(String salemanName) {
		this.salemanName = salemanName;
	}
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	
}
