package pers.lqresier.picc.service;

import pers.lqresier.picc.entity.Organization;
import pers.lqresier.picc.entity.Website;

public interface WebsiteService extends Service {
	
	/**
	 * 修改网点信息(包括机构信息)
	 * 两个更新操作
	 * @param website
	 * @param organization
	 * @return
	 */
	boolean updateWebsiteInfo(Website website, Organization organization) throws Exception;
	
	/**
	 * 修改网点信息
	 * @param website
	 * @return
	 */
	boolean updateWebsiteInfo(Website website) throws Exception;
	
	/**
	 * 添加网点信息
	 * @param website
	 * @return
	 */
	boolean addWebsiteInfo(Website website) throws Exception;
	
	/**
	 * 查询网点信息(网点类中包含机构信息，所以只需要查一次)
	 * @return
	 */
	Website queryWebsiteInfo() throws Exception;
}
