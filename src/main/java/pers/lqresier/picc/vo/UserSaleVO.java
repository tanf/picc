package pers.lqresier.picc.vo;

/**
 * 出单员-销售保单数
 * @author Administrator
 *
 */
public class UserSaleVO {
	private String userName=null;//用户姓名
	private Integer saleNum=null;//销售保单数
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}
	
	
}
