package pers.lqresier.picc.service.impl;

import ch.qos.logback.core.db.dialect.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.condition.PolicyCondition;
import pers.lqresier.picc.entity.*;
import pers.lqresier.picc.exception.NoDocumentException;
import pers.lqresier.picc.exception.OutOfCancelTimeException;
import pers.lqresier.picc.exception.WebsiteCodeException;
import pers.lqresier.picc.exception.WebsiteNotFoundException;
import pers.lqresier.picc.mapper.*;
import pers.lqresier.picc.service.PolicyService;
import pers.lqresier.picc.vo.PolicyVO;
import pers.lqresier.picc.vo.UserSaleVO;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Transactional
@Service
public class PolicyServiceImpl implements PolicyService {
	@Autowired
	private PolicyMapper policyMapper;
	@Autowired
	private InsurerMapper insurerMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private DocumentMapper documentMapper;
	@Autowired
	private WebsiteMapper websiteMapper;

	@SuppressWarnings("unchecked")
	@Override
	public List<Policy> queryPolicyByPolicyCondition(PolicyCondition policyCondition) throws Exception{
		List<Policy> policyList=policyMapper.queryByCondition(policyCondition);
		if(policyList==null||policyList.size()==0){
			return null;
		}
		return policyList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public PolicyVO addPolicy(Policy policy, Insurer insurer) throws WebsiteNotFoundException, WebsiteCodeException, NoDocumentException,Exception {
		PolicyVO policyVo=new PolicyVO();
		// 5、获取当前用户最新的可用单证
		Document document = documentMapper.getLatestDocument(policy.getUser());
		if(document==null) {
			//无可用单证
			throw new NoDocumentException();
		}
		// 获得网点信息
		List<Website> websiteList = (List<Website>) websiteMapper.queryAll();
		if (websiteList == null || websiteList.size() == 0) {
			//找不到网点信息
			throw new WebsiteNotFoundException();
		}
		Website website = websiteList.get(0);
		policy.setWebsite(website);
		// 获取地区号
		if(website.getCode().length()<6) {
			//网点地区号异常
			throw new WebsiteCodeException();
		}
		//添加一个新的保单(为了获取id号，便于生成保单编号)
		Policy newPolicy=new Policy();
		policyMapper.add(newPolicy);
		//获取保单id
		Integer policyId=newPolicy.getId();
		policy.setId(policyId);
		// 3、通过产品信息主键查询到产品
		Product product = productMapper.query(policy.getProduct());
		policy.setProduct(product);
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		policy.setCreateTime(currentTime);//投保时间
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(currentTime.getTime());
		int year = calendar.get(Calendar.YEAR);//年份
		calendar.add(Calendar.HOUR_OF_DAY, 1);
		policy.setBeginTime(new Timestamp(calendar.getTimeInMillis()));//起保时间
		calendar.add(Calendar.DAY_OF_YEAR, product.getTimeLimit());
		policy.setEndTime(new Timestamp(calendar.getTimeInMillis()));//结束时间
		// 8、生成保单编号
		StringBuilder policyCode = new StringBuilder("P");
		// 获取险种
		policyCode.append(product.getType().getCode());
		policyCode.append(year);
		policyCode.append(website.getCode().substring(0, 6));
		policyCode.append(mergeCode("0000A0000", policyId));
		policy.setPolicyCode(policyCode.toString());
		// 7、改变对应单证的状态为已使用(1)
		document.setStatus(1);
		document.setUseTime(currentTime);
		documentMapper.update(document);
		// 6、将单证信息添加到保单中
		policy.setDocumentNum(document.getNum());
		policy.setDocument(document);
		// 1、添加保险人信息
		insurerMapper.add(insurer);
		//查找到添加的insurer
		insurer=insurerMapper.queryByCardCode(insurer.getCardCode());
		// 2、保单添加投保人、被保人、受益人(个单全是同一个人)
		policy.setPolicyHolder(insurer);
		policy.setInsured(insurer);
		policy.setBeneficiary(insurer);
		// 4、要将对应产品信息添加到保单信息中
		policy.setDocumentCode(product.getDocumentCode());
		policy.setPremium(product.getPremium());
		policy.setCoverage(product.getCoverage());
		policy.setPremiumTotal(policy.getPolicyNum() * policy.getPremium());
		policy.setCoverageTotal(policy.getPolicyNum() * policy.getCoverage());
		policy.setStatus(1);
		// 9、更新保单
		policyMapper.update(policy);
		return policyVo;
	}

	@Override
	public boolean cancelPolicy(Policy policy) throws OutOfCancelTimeException,Exception {
		//查询保单是否已经起保，起保开始后不能退保
		policy=policyMapper.query(policy);
		if(policy.getBeginTime().before(new Timestamp(System.currentTimeMillis()))) {
			throw new OutOfCancelTimeException();
		}
		policy.setStatus(0);// 设置状态为0退保
		int executeNum=policyMapper.update(policy);
		return executeNum>0?true:false;
	}

	/**
	 * 自增编码
	 * 
	 * @param code
	 * @return
	 */
	@SuppressWarnings("unused")
	private String increaseCode(String code) throws Exception {
		char[] chars = code.toCharArray();
		boolean isCarry = true;// 是否进位
		for (int i = chars.length - 1; i >= 0; i--) {
			if (isCarry) {
				chars[i] += 1;
				isCarry = false;
			}
			if (chars[i] >= 58 && chars[i] < 65) {
				chars[i] -= 10;
				isCarry = true;
				continue;
			}
			if (chars[i] >= 91) {
				chars[i] -= 26;
				isCarry = true;
				continue;
			}
			if (isCarry == false) {
				break;
			}
		}
		return String.valueOf(chars);
	}
	
	/**
	 * 合并编码和数字(相加)
	 * @param old
	 * @param add
	 * @return
	 */
	private String mergeCode(String old,Integer add) throws Exception {
		char[] oldChars=old.toCharArray();
		char[] numChars=add.toString().toCharArray();
		boolean isCarry=false;//是否进位
		int numLen=numChars.length;
		boolean isNum=false;//是否为数字
		for(int i=oldChars.length-1;i>0;i--) {
			if(oldChars[i]>'0'&&oldChars[i]<'9') {
				isNum=true;
			}else {
				isNum=false;
			}
			if(numLen-->0) {
				oldChars[i]=(char) (numChars[numLen]-48+oldChars[i]);
			}
			if(isCarry) {
				oldChars[i]+=1;
				isCarry=false;
			}
			if(isNum==false&oldChars[i]>90) {
				//字母，大于Z
				oldChars[i]-=26;
				isCarry=true;
				continue;
			}
			if(isNum==true&oldChars[i]>57) {
				//数字，大于9
				oldChars[i]-=10;
				isCarry=true;
				continue;
			}
			if(numLen<=0&&isCarry==false) {
				break;
			}
		}
		return String.valueOf(oldChars);
	}

	@Override
	public List<Double> get30Sales() throws Exception {
		List<Double>  list=new ArrayList<Double>();
		for(int i=30;i>=1;i--){
			list.add(policyMapper.getSumPremium(i));
		}
		return list;
	}

	@Override
	public List<UserSaleVO> getUserSaleVOs() throws Exception {
		return policyMapper.getUserSaleVOs();
	}

	

}
