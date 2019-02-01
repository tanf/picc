package pers.lqresier.picc.vo;

import pers.lqresier.picc.entity.Policy;

/**
 * 出单界面展示
 * @author Administrator
 *
 */
public class PolicyVO {
	
	private boolean result;//出单结果
	private String tip;//提示
	private Policy policy=null;//保单
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public Policy getPolicy() {
		return policy;
	}
	public void setPolicy(Policy policy) {
		this.policy = policy;
	}
	
}
