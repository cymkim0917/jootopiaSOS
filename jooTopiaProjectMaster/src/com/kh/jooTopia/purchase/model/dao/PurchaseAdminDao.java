package com.kh.jooTopia.purchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class PurchaseAdminDao {
	Properties prop = new Properties();
	
	public PurchaseAdminDao() {
		String fileName = 
				PurchaseAdminDao
					.class
					.getResource("/sql/purchase/purchaseDetail-query.properties")
					.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
