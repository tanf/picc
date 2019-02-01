package pers.lqresier.picc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.entity.Organization;
import pers.lqresier.picc.entity.Website;
import pers.lqresier.picc.mapper.OrganizationMapper;
import pers.lqresier.picc.mapper.WebsiteMapper;
import pers.lqresier.picc.service.WebsiteService;
import java.util.List;

@Transactional
@Service
public class WebsiteServiceImpl implements WebsiteService {
	@Autowired
	private WebsiteMapper websiteMapper;
	@Autowired
	private OrganizationMapper organizationMapper;

	@SuppressWarnings("unchecked")
	@Override
	public boolean updateWebsiteInfo(Website website, Organization organization) throws Exception{
		boolean isSuccess=false;
		int execNum=websiteMapper.update(website);
		if(execNum>0){
			isSuccess=true;
			List<Website> result= websiteMapper.queryAll();
			website=result.get(0);
			website.getOrganization().setName(organization.getName());
			execNum=organizationMapper.update(website.getOrganization());
			if(execNum>0){
				isSuccess=true;
			}
		}
		return isSuccess;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Website queryWebsiteInfo() throws Exception{
		List<Website> result=websiteMapper.queryAll();
		if(result==null||result.size()==0) {
			return null;
		}
		return result.get(0);
	}

	@Override
	public boolean updateWebsiteInfo(Website website) throws Exception{
		int execNum=websiteMapper.update(website);
		return execNum>0?true:false;
	}

	@Override
	public boolean addWebsiteInfo(Website website) throws Exception{
		int execNum=websiteMapper.add(website);
		return execNum>0?true:false;
	}

}
