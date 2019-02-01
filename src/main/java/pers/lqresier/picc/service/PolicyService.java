package pers.lqresier.picc.service;

import pers.lqresier.picc.condition.PolicyCondition;
import pers.lqresier.picc.entity.Insurer;
import pers.lqresier.picc.entity.Policy;
import pers.lqresier.picc.exception.NoDocumentException;
import pers.lqresier.picc.exception.OutOfCancelTimeException;
import pers.lqresier.picc.exception.WebsiteCodeException;
import pers.lqresier.picc.exception.WebsiteNotFoundException;
import pers.lqresier.picc.vo.PolicyVO;
import pers.lqresier.picc.vo.UserSaleVO;

import java.util.List;

public interface PolicyService extends Service{
	/**
	 * 根据PolicyCondition查询保单
	 * @param policyCondition
	 * @return
	 */
	List<Policy> queryPolicyByPolicyCondition(PolicyCondition policyCondition) throws Exception;
	
	/**
	 * 出单
	 * 1、要先插入保险人
	 * 2、再将保险人添加到保单中
	 * 3、通过产品信息主键查询到产品
	 * 4、要将对应产品信息添加到保单信息中
	 * 5、单证流水号要获得最新的可用单证流水号（去单证表查）
	 * 6、要改变对应单证的状态
	 * 7、保单编号要自增(要加锁，避免编号重复)
	 * 8、插入保单
	 * PS：如果流程有何不妥，请自行改变流程和细节
	 * @param policy
	 * @param insurer
	 * @return
	 * @throws WebsiteNotFoundException 
	 * @throws WebsiteCodeException 
	 * @throws NoDocumentException
	 */
	PolicyVO addPolicy(Policy policy, Insurer insurer) throws WebsiteNotFoundException, WebsiteCodeException, NoDocumentException,Exception;
	
	/**
	 * 退保
	 * 改变policyStatus为0，即退保状态
	 * @return
	 * @throws OutOfCancelTimeException 
	 */
	boolean cancelPolicy(Policy policy) throws OutOfCancelTimeException,Exception;
	
	/**
	 * 保单查询
	 * @return
	 */
	List<Double> get30Sales() throws Exception;
	
	/**
	 * 获取【出单员-销售保单数】数据
	 * @return
	 */
	List<UserSaleVO> getUserSaleVOs() throws Exception;
}
