package pers.lqresier.picc.mapper;

import pers.lqresier.picc.condition.PolicyCondition;
import pers.lqresier.picc.entity.Policy;
import pers.lqresier.picc.vo.UserSaleVO;

import java.util.List;

public interface PolicyMapper{
	
	List<Policy> queryByCondition(PolicyCondition policyCondition);//条件查询

	/**
	 * 查询当天销售总保单费
	 * @return 总保单费
	 */
	Double getSumPremium(Integer days);
	
	/**
	 * 获取【出单员-销售保单数】数据
	 * @return List<UserSaleVO>
	 */
	List<UserSaleVO> getUserSaleVOs();

	int add(Policy policy);//添加

	int update(Policy policy);//修改

	Policy query(Policy policy);//主键查询
}
