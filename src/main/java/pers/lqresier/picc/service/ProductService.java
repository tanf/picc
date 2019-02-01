package pers.lqresier.picc.service;

import pers.lqresier.picc.condition.ProductCondition;
import pers.lqresier.picc.entity.Product;

import java.util.List;

public interface ProductService extends Service{
	/**
	 * 添加产品
	 * @param product
	 * @return
	 */
	boolean addProduct(Product product) throws Exception;
	
	/**
	 * 修改产品
	 * @param product
	 * @return
	 */
	boolean updateProduct(Product product) throws Exception;
	
	/**
	 * 根据ProductCondition查询产品
	 * @param productCondition
	 * @return
	 */
	List<Product> queryProductByProductCondition(ProductCondition productCondition) throws Exception;
	
	/**
	 * 删除产品
	 * 把productStatus置为0
	 * 调用update，不是真正意义上的删除
	 * @param product
	 * @return
	 */
	boolean deleteProduct(Product product) throws Exception;
	
	/**
	 * 重新上架产品
	 * @param product
	 * @return
	 */
	boolean putAwayProduct(Product product) throws Exception;
	
	/**
	 * 查询保险费
	 * @return
	 */
	List<Product> queryPremium() throws Exception;

	/**
	 * 通过主键查询
	 * @param id
	 * @return
	 */
	Product queryProductByPk(Integer id) throws Exception;

	
	/**
	 * 验证重复
	 * @param product
	 * @return
	 */
	boolean isExist(Product product) throws Exception;


	/**
	 * 查询单证识别码信息(产品名，保费，单证识别码)
	 * @return
	 */
	List<Product> queryDocumentCodeInfo() throws Exception;

}
