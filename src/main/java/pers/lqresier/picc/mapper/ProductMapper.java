package pers.lqresier.picc.mapper;

import pers.lqresier.picc.condition.ProductCondition;
import pers.lqresier.picc.entity.Product;
import pers.lqresier.picc.entity.ProductType;

import java.util.List;

public interface ProductMapper{
	
	List<Product> queryByCondition(ProductCondition productCondition);//条件查询

	List<Product> queryPremium();//查询保险费

	Integer isExist(Product product);//查重复

	/**
	 * 查询单证识别码信息(产品名，保费，单证识别码)
	 * @return
	 */
	List<Product> queryDocumentCodeInfo();

	int add(Product product);//添加

	int update(Product product);//修改

	Product query(Product product);//主键查询
}
