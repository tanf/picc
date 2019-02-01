package pers.lqresier.picc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.entity.ProductType;
import pers.lqresier.picc.mapper.ProductTypeMapper;
import pers.lqresier.picc.service.ProductTypeService;
import java.util.List;

@Transactional
@Service
public class ProductTypeServiceImpl implements ProductTypeService {
	@Autowired
	private ProductTypeMapper productTypeMapper;

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductType> queryAll() {
		return productTypeMapper.queryAll();
	}

}
