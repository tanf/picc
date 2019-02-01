package pers.lqresier.picc.service.impl;

import ch.qos.logback.core.db.dialect.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.entity.Organization;
import pers.lqresier.picc.mapper.OrganizationMapper;
import pers.lqresier.picc.service.OrganizationService;

import java.util.List;

@Transactional
@Service
public class OrganizationServiceImpl implements OrganizationService {
	@Autowired
	private OrganizationMapper organizationMapper;

	@SuppressWarnings("unchecked")
	@Override
	public List<Organization> queryAll() {
		return organizationMapper.queryAll();
	}
}
