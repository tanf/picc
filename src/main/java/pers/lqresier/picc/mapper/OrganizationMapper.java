package pers.lqresier.picc.mapper;

import pers.lqresier.picc.entity.Organization;

import java.util.List;

public interface OrganizationMapper{

    List<Organization> queryAll();

    int update(Organization organization);//修改
	
}
