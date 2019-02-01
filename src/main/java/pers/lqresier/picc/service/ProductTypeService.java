package pers.lqresier.picc.service;

import pers.lqresier.picc.entity.ProductType;

import java.util.List;

public interface ProductTypeService extends Service {
	/**
	 * 查询所有险种
	 * @return
	 */
	List<ProductType> queryAll();
}
