package com.chinasoft.app.service.impl;

import java.util.List;

import com.chinasoft.app.dao.ProductDao;
import com.chinasoft.app.dao.impl.ProductDaoImpl;
import com.chinasoft.app.service.ProductService;

public class ProductServiceImpl implements ProductService{

	@Override
	public List<String> findProductByName(String searchname) {
		ProductDao  productDao = new ProductDaoImpl();
		return productDao.findProductByName(searchname);
	}

}
