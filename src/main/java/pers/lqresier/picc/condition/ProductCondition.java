package pers.lqresier.picc.condition;

/**
 * 产品条件类
 * 
 * @author Administrator
 *
 */
public class ProductCondition implements Condition {
	private String name = null;// 产品名
	private String code = null;// 产品编号
	private Integer typeId = null;// 险种主键
	private Double premium = null;// 保费
	private Integer timeLimit = null;// 产品期限
	private Integer status = null;// 产品状态

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

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Double getPremium() {
		return premium;
	}

	public void setPremium(Double premium) {
		this.premium = premium;
	}

	public Integer getTimeLimit() {
		return timeLimit;
	}

	public void setTimeLimit(Integer timeLimit) {
		this.timeLimit = timeLimit;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
