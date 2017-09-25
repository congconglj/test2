package com.chinasoft.app.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinasoft.app.dao.ProductDao;
import com.chinasoft.app.util.DBUtil;

public class ProductDaoImpl implements ProductDao{

	@Override
	public List<String> findProductByName(String searcname) {
		DBUtil db = new DBUtil();
		ResultSet res = db.execQuery("select pname from product where pname like ?", new Object[]{"%"+searcname+"%"});
		List<String> list = new ArrayList<String>();
		try {
			while(res.next()){
				list.add(res.getString(1));
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
