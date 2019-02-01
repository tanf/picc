package pers.lqresier.picc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.condition.ProductCondition;
import pers.lqresier.picc.entity.Product;
import pers.lqresier.picc.mapper.ProductMapper;
import pers.lqresier.picc.service.ProductService;

import java.util.List;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper productMapper;

	@Override
	public boolean addProduct(Product product) throws Exception{
		product.setProductStatus(1);//状态设为1，使用中
		int executeNum=productMapper.add(product);
		return executeNum>0?true:false;
	}

	@Override
	public boolean updateProduct(Product product) throws Exception{
		int executeNum=productMapper.update(product);
		return executeNum>0?true:false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> queryProductByProductCondition(ProductCondition productCondition) throws Exception{
		List<Product> productList=productMapper.queryByCondition(productCondition);
		if(productList==null||productList.size()==0){
			return null;
		}
		return productList;
	}

	@Override
	public boolean deleteProduct(Product product) throws Exception{
		product.setProductStatus(0);//状态设为下架0
		int executeNum=productMapper.update(product);
		return executeNum>0?true:false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> queryPremium() throws Exception{
		return productMapper.queryPremium();
	}

	@Override
	public Product queryProductByPk(Integer id) throws Exception{
		Product product=new Product();
		product.setId(id);
		return productMapper.query(product);
	}

	@Override
	public boolean putAwayProduct(Product product) throws Exception{
		product.setProductStatus(1);//状态设为上架1
		int executeNum=productMapper.update(product);
		return executeNum>0?true:false;
	}


	@Override
	public boolean isExist(Product product) throws Exception{
		Integer isExist = productMapper.isExist(product);
		if(isExist==null||isExist==0) {
			return false;
		}
		return true;
	}


	@Override
	public List<Product> queryDocumentCodeInfo() throws Exception{
		return productMapper.queryDocumentCodeInfo();
	}

	
	

}
