package pers.lqresier.picc.entity;

/**
 * 产品类
 * @author Administrator
 *
 */
public class Product {
	private Integer id=null;//产品主键
	private String name=null;//产品名
	private String code=null;//产品编码
	private String documentCode=null;//单证识别码
	private String info=null;//险种信息
	private Integer timeLimit=null;//产品期限(天)
	private Double coverage=null;//保额(可以获保多少)
	private Double premium=null;//保费(需付金额)
	private Double compensat1=null;//赔付1
	private Double compensat2=null;//赔付2
	private Double compensat3=null;//赔付3
	private Double compensat4=null;//赔付4
	private ProductType type=null;//险种类型
	/**
	 * 产品状态
	 * 0:下架，1:使用中
	 */
	private Integer productStatus=null;//产品状态
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
	public String getDocumentCode() {
		return documentCode;
	}
	public void setDocumentCode(String documentCode) {
		this.documentCode = documentCode;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Integer getTimeLimit() {
		return timeLimit;
	}
	public void setTimeLimit(Integer timeLimit) {
		this.timeLimit = timeLimit;
	}
	public Double getCoverage() {
		return coverage;
	}
	public void setCoverage(Double coverage) {
		this.coverage = coverage;
	}
	public Double getPremium() {
		return premium;
	}
	public void setPremium(Double premium) {
		this.premium = premium;
	}
	public Double getCompensat1() {
		return compensat1;
	}
	public void setCompensat1(Double compensat1) {
		this.compensat1 = compensat1;
	}
	public Double getCompensat2() {
		return compensat2;
	}
	public void setCompensat2(Double compensat2) {
		this.compensat2 = compensat2;
	}
	public Double getCompensat3() {
		return compensat3;
	}
	public void setCompensat3(Double compensat3) {
		this.compensat3 = compensat3;
	}
	public Double getCompensat4() {
		return compensat4;
	}
	public void setCompensat4(Double compensat4) {
		this.compensat4 = compensat4;
	}
	public ProductType getType() {
		return type;
	}
	public void setType(ProductType type) {
		this.type = type;
	}
	public Integer getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(Integer productStatus) {
		this.productStatus = productStatus;
	}
	
}
