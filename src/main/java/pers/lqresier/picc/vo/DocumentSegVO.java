package pers.lqresier.picc.vo;

/**
 * 停用、丢弃、作废号段展示
 * @author Administrator
 *
 */
public class DocumentSegVO {
	private String beginNum=null;//起始号
	private String endNum=null;//结束号
	public String getBeginNum() {
		return beginNum;
	}
	public void setBeginNum(String beginNum) {
		this.beginNum = beginNum;
	}
	public String getEndNum() {
		return endNum;
	}
	public void setEndNum(String endNum) {
		this.endNum = endNum;
	}
	
}
