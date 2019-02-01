package pers.lqresier.picc.entity;

import java.sql.Timestamp;

/**
 * 保单类
 * @author Administrator
 *
 */
public class Policy {
	private Integer id=null;//保单主键
	private String policyCode=null;//保单编号
	private String documentNum=null;//单证流水号
	private String documentCode=null;//单证识别号
	private Timestamp createTime=null;//投保时间(保单生成时间)
	private Timestamp beginTime=null;//起保时间
	private Timestamp endTime=null;//结束时间(根据产品期限算出)
	private Integer policyNum=null;//保险人数
	private Double premium=null;//单个保费
	private Double premiumTotal=null;//总保费(人数*单个保费)
	private Double coverage=null;//单个保额
	private Double coverageTotal=null;//总保额(人数*单个保额)
	/**
	 * 保单状态
	 * 1:正常
	 * 0:退保
	 */
	private Integer status=null;//保单状态
	private Document document=null;//单证
	private Product product=null;//产品
	private User user=null;//用户
	private Website website=null;//网点
	private Insurer policyHolder=null;//投保人
	private Insurer insured=null;//被保人
	private Insurer beneficiary=null;//受益人
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPolicyCode() {
		return policyCode;
	}
	public void setPolicyCode(String policyCode) {
		this.policyCode = policyCode;
	}
	public String getDocumentNum() {
		return documentNum;
	}
	public void setDocumentNum(String documentNum) {
		this.documentNum = documentNum;
	}
	public String getDocumentCode() {
		return documentCode;
	}
	public void setDocumentCode(String documentCode) {
		this.documentCode = documentCode;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
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
	public Integer getPolicyNum() {
		return policyNum;
	}
	public void setPolicyNum(Integer policyNum) {
		this.policyNum = policyNum;
	}
	public Double getPremium() {
		return premium;
	}
	public void setPremium(Double premium) {
		this.premium = premium;
	}
	public Double getPremiumTotal() {
		return premiumTotal;
	}
	public void setPremiumTotal(Double premiumTotal) {
		this.premiumTotal = premiumTotal;
	}
	public Double getCoverage() {
		return coverage;
	}
	public void setCoverage(Double coverage) {
		this.coverage = coverage;
	}
	public Double getCoverageTotal() {
		return coverageTotal;
	}
	public void setCoverageTotal(Double coverageTotal) {
		this.coverageTotal = coverageTotal;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Document getDocument() {
		return document;
	}
	public void setDocument(Document document) {
		this.document = document;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Website getWebsite() {
		return website;
	}
	public void setWebsite(Website website) {
		this.website = website;
	}
	public Insurer getPolicyHolder() {
		return policyHolder;
	}
	public void setPolicyHolder(Insurer policyHolder) {
		this.policyHolder = policyHolder;
	}
	public Insurer getInsured() {
		return insured;
	}
	public void setInsured(Insurer insured) {
		this.insured = insured;
	}
	public Insurer getBeneficiary() {
		return beneficiary;
	}
	public void setBeneficiary(Insurer beneficiary) {
		this.beneficiary = beneficiary;
	}
	
}
