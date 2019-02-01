package pers.lqresier.picc.service;

import pers.lqresier.picc.entity.Organization;

import java.util.List;

public interface OrganizationService extends Service {

	/**
	 * 查询所有机构
	 * @return
	 */
	List<Organization> queryAll();
	
}
