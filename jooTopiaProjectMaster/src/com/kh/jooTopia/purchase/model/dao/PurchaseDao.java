package com.kh.jooTopia.purchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class PurchaseDao {
	Properties prop = new Properties();
	
	public PurchaseDao() {
		String fileName = PurchaseDao
				.class
				.getResource("/sql/purchase/purchase-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
